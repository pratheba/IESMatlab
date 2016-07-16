function [adjpcadata, mn, sd, pc, scores, latent, tsquare] = RunPCAAfterNormalizingData(pcadata)
    mn = mean(pcadata);
    sd = std(pcadata);
    sd(sd==0) = 0.001;

    adjpcadata = bsxfun(@minus,pcadata,mn);
    adjpcadata = bsxfun(@rdivide,adjpcadata,sd);
    [pc, scores, latent, tsquare] = pca(adjpcadata);
end