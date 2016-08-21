% The Bartlett?s test checks if the observed correlation matrix R=(rij)(p x p) diverges significantly from the
% identity matrix (theoretical matrix under H0: the variables are orthogonal). The PCA can perform a
% compression of the available information only if we reject the null hypothesis.
% In order to measure the overall relation between the variables, we compute the determinant of the
% correlation matrix |R|. Under H0, |R| = 1; if the variables are highly correlated, we have |R| ? 0.
% The Bartlett's test statistic indicates to what extent we deviate from the reference situation |R| = 1.
% It uses the following formula


function [] = BartlettsSphericityTest(data)

    originalmean = mean(data);
    originalstddev = std(data);
    originalstddev(originalstddev==0) = 0.001;

    adjpcadata = bsxfun(@minus,data,originalmean);
    adjpcadata = bsxfun(@rdivide,adjpcadata,originalstddev);
    corrMatrix = corrcoef(adjpcadata);

end