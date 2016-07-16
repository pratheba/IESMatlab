function [PC1, PC2] = RunPCA(fileslist)

	numoffiles  = length(fileslist);
	for index = 1:numoffiles

		[pathstr,name,ext] = fileparts(fileslist{index});
		if strcmp(ext,'.DS_Store')
			continue;
		end
		
		filename = strcat(name, '.dat');
		disp(filename);

		[pcaname pcadata] = ExtractDataForPCA(fileslist{index});	
        [adjpcadata, originalmean, stddev, pc, scores, latent, tsquare] = RunPCAAfterNormalizingData(pcadata);
        
        figure();
        subplot(2,2,1);
        xlabel('Index');
        ylabel('Data');
        title('original data');
        plot((pcadata)');
        
        subplot(2,2,2);
        plot((adjpcadata)');
        xlabel('Index');
        ylabel('Data');
        title('normalized data');
    
		%PlotPCA(name, adjpcadata, scores, latent, tsquare, pcaname);
		%SavePCA( name, pc, scores, latent);
        modifiedData = ReconstructData(adjpcadata, originalmean, stddev, pc, latent);
        modifiedData = modifiedData';
       
        subplot(2,2,3);
        plot((modifiedData)');
        xlabel('Index');
        ylabel('Data');
        title('pcarun data');
        
       
	end

end