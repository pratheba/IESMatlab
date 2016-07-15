function [PC1, PC2] = RunPCA(fileslist)

	numoffiles  = length(fileslist);
	for index = 1:numoffiles

		[pathstr,name,ext] = fileparts(fileslist{index});
		if strcmp(ext,'.DS_Store')
			continue;
		end
		
		filename = strcat(name, '.dat');
		disp(filename);
		out=textread(ileslist{index}, '%s', 'whitespace',',');
		pcaData = out(:,2:end);
		iesNameData = out(:,1);


		filename = csvread(fileslist{index});
		[pc, scores, latent, tsquare] = pca(filename(:,2:end));
		iesnames = filename(:,1);
		PlotPCA(name, pc, scores, latent, tsquare, iesnames);
		SavePCA( name, pc, scores, latent);
	end

end