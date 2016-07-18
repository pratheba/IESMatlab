function [] = RunPCA(fileslist)

	numoffiles  = length(fileslist);
	for index = 1:numoffiles

		[pathstr,name,ext] = fileparts(fileslist{index});
		if strcmp(ext,'.DS_Store')
			continue;
		end
		
		filename = strcat(name, '.dat');
		disp(filename);

		[pcaname, pcadata] = ExtractDataForPCA(fileslist{index});	
        [adjpcadata, originalmean, originalstddev, pc, scores, latent] = RunPCAAfterNormalizingData(pcadata);
        
        reconstructedData = ReconstructData(originalmean, originalstddev, pc, scores, latent);
        SaveRecontructedData(name, pcaname, reconstructedData);
        PlotData(pcadata, adjpcadata, reconstructedData);
        PlotPCA(name, adjpcadata, scores, latent, pcaname);
%         disp(v);
 		SavePCA( name, pc, scores, latent);
   
    end
end