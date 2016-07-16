function [adjpcadata, originalmean, originalstddev, pc, scores, latent] = RunPCAAfterNormalizingData(pcadata)
    originalmean = mean(pcadata);
    originalstddev = std(pcadata);
    originalstddev(originalstddev==0) = 0.001;

    adjpcadata = bsxfun(@minus,pcadata,originalmean);
    adjpcadata = bsxfun(@rdivide,adjpcadata,originalstddev);
    [pc, scores, latent] = pca(adjpcadata);
end