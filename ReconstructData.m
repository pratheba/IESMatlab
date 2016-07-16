function [modifiedData] = ReconstructData(originalmean, originalstddev, PCA,score, latent)

    numberOfPrincipalComponents = AnalyzeAndChoosePrincipalComponents(latent);
    modifiedData = [];
    if numberOfPrincipalComponents < 1
        return;
    end
    
    modifiedData = score(:,1:numberOfPrincipalComponents)* (PCA(:,1:numberOfPrincipalComponents))';
    modifiedData = bsxfun(@times, modifiedData, originalstddev);
    modifiedData = bsxfun(@plus, modifiedData, originalmean);
    
%%%%% With original normalized data
%     RowFeatureVector = PCA(:,1:numberOfPrincipalComponents);
%     RowFeatureVector = RowFeatureVector';
%     
%     RowDataAdjust = normalizedData';
%     modifiedData = RowFeatureVector * RowDataAdjust;
% 
%     modifiedData = (RowFeatureVector'* modifiedData);
% 
%     modifiedData = bsxfun(@times, modifiedData, stddev');
%     modifiedData = bsxfun(@plus, modifiedData, originalmean');
end