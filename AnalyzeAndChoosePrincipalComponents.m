function numberOfPCs = AnalyzeAndChoosePrincipalComponents(latent)

     numberOfPCs = 0;
    normalizedlatent = (latent - min(latent)) / ( max(latent) - min(latent) )
    
    [row col] = size(latent);
    for i = 1: row
        disp(normalizedlatent(i));
        if (normalizedlatent(i) < 0.5)
            numberOfPCs = i-1;
            break;
        end
    end
end