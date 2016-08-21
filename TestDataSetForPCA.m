function [name, data] = TestDataSetForPCA(fileslist)

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
		[name, data] = ExtractDataForPCA(fileslist{index});	
        
        
        
    end
    
end