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
        
		%filename = csvread(fileslist{index});
		[pc, scores, latent, tsquare] = pca(pcadata);
		PlotPCA(name, pc, scores, latent, tsquare, pcaname);
		%SavePCA( name, pc, scores, latent);
	end

end