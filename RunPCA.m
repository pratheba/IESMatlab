function [] = RunPCA(fileslist)

	numoffiles  = length(fileslist);
	for index = 1:numoffiles

		[pathstr,name,ext] = fileparts(fileslist{index});
		if strcmp(ext,'.DS_Store')
			continue;
		end
		
		filename = strcat(name, '.dat');
		disp(filename);

        %PCA data retrieved has nxp format
        % n = observations and p = variables
		[pcaname, pcadata] = ExtractDataForPCA(fileslist{index});	
        [adjpcadata, originalmean, originalstddev, pc, scores, latent] = RunPCAAfterNormalizingData(pcadata);
        
        [reconstructedData, numberOfPrincipalComponents] = ReconstructData(originalmean, originalstddev, pc, scores, latent);
        plotOriginalDataForEachPC(pcadata, scores, numberOfPrincipalComponents);
        PlotPCS(scores, pc, latent, originalmean);
        %SaveRecontructedData(name, pcaname, reconstructedData);
   %     PlotData(pcaname, pcadata, adjpcadata, reconstructedData,name);
        %PlotPCA(name, adjpcadata, scores, latent, pcaname);
%         disp(v);
 		%SavePCA( name, pc, scores, latent);
   
    end
end