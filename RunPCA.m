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
        
        %Test for Common Variance
        Barspher(adjpcadata,0.05);
        
        [A, B, kmovalue] = kmo(adjpcadata);
        if(kmovalue <0.5)
            print 'The Matrix does not have adequate sampling frequency';
            return;
        end
        %PlotPCA(name, adjpcadata, scores, latent, pcaname, numberOfPrincipalComponents);
        
        %plotOriginalDataForEachPC(pcadata, scores, numberOfPrincipalComponents);
        %PlotPCS(scores, pc, latent, originalmean,originalstddev,filename);
        %SaveRecontructedData(name, pcaname, reconstructedData);
   %     PlotData(pcaname, pcadata, adjpcadata, reconstructedData,name);
        %
%         disp(v);
 		%SavePCA( name, pc, scores, latent);
   
    end
end