function [] = PlotPCS(score, pc, latent, originalmean)

  numberOfPrincipalComponents = AnalyzeAndChoosePrincipalComponents(latent);

if numberOfPrincipalComponents < 1
    return;
end
    
x = 0:2.5:360;
x = x+3*pi/2;
x = deg2rad(x);

figure();
[row ,col] = size(pc);
for i=1:numberOfPrincipalComponents
    %modifiedData = pc(:,i)*score(:,i:i);
    subplot(5,2,i);
    %c = rand(1,3);
    
    A = pc(:,i);
    %A = bsxfun(@plus, 1000*A,originalmean');
    
    positive = A(A>=0);
    posIndex = find(A >= 0);
    negative = A(A < 0);
    negIndex = find(A<0);
    
    positiveAndMean = bsxfun(@plus, 1000*positive,originalmean(posIndex)');
    negativeAndMean = bsxfun(@plus, 1000*abs(negative),originalmean(negIndex)');
    
    %abspc(:,i) = bsxfun(@plus, 1000*pc(:,i),originalmean');
    %h = polar(x,abspc(:,i)');
  
    h = polar(x(posIndex),positiveAndMean');
    set(h,'Color','green');
    hold on;
    
    h = polar(x(negIndex),negativeAndMean');
    set(h,'Color','red');
    hold off;
%     y1 = flipud(pc(:,i));
%     polar(x,y1');
     view(90, 90);
%     hold on;
%     view(90, 90);
end