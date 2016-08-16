function numberOfPCs = AnalyzeAndChoosePrincipalComponents(latent)

    numberOfPCs = 0;
  %  normalizedlatent = (latent - min(latent)) / ( max(latent) - min(latent) )
    
    [row col] = size(latent);
    for i = 1: row
        %disp(normalizedlatent(i));
        if (latent(i) < 1) % kaiser's rule of extracting principal components with eigen values >= 1
            numberOfPCs = i-1;
            break;
        end
    end
end