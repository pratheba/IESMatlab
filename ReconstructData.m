function [modifiedData] = ReconstructData(normalizedData, originalmean, stddev, PCA, latent)

    numberOfPrincipalComponents = AnalyzeAndChoosePrincipalComponents(latent);
    modifiedData = [];
    if numberOfPrincipalComponents < 1
        return;
    end
    RowFeatureVector = PCA(:,1:numberOfPrincipalComponents);
    RowFeatureVector = RowFeatureVector';
    
    RowDataAdjust = normalizedData';
    modifiedData = RowFeatureVector * RowDataAdjust;

    modifiedData = (RowFeatureVector'* modifiedData);
    modifiedData = bsxfun(@times, modifiedData, stddev');
    modifiedData = bsxfun(@plus, modifiedData, originalmean');
end