function [] = PlotPCS(score, pc, latent, originalmean, originalstddev, titlePcs)

  numberOfPrincipalComponents = AnalyzeAndChoosePrincipalComponents(latent);

if numberOfPrincipalComponents < 1
    return;
end
    
x = 0:2.5:360;
x = x+3*pi/2;
x = deg2rad(x);

figure();
set(gcf,'numbertitle','off','name',titlePcs) % See the help for GCF
   
v = ceil(numberOfPrincipalComponents/2);
[row ,col] = size(pc);
  

        
for i=1:numberOfPrincipalComponents
    %modifiedData = pc(:,i)*score(:,i:i);
    
    subplot(v,2,i);
    
    %c = rand(1,3);
    %figure();
     A = pc(:,i);
    % B = bsxfun(@plus, 1000*max(A,0),originalmean');
    % C = bsxfun(@plus, 1000*max(-A,0),-originalmean');
    h = polar(x',max((((1000*A)+originalmean')),0));
    %h = polar(x',max(A,0));
    set(h, 'Color','green');
    hold on;
    h = polar(x',max((((1000*-A)-originalmean')),0));
    %h = polar(x',max(-A,0));
    set(h,'Color','red');
    view(90, 90);
    title(strcat(num2str(i) , 'PC'));
    hold off;
        
   
  
%     customcolormap = zeros(row, 3);
%     %A = bsxfun(@plus, 1000*A,originalmean');
%     for p=1:length(A)
%         if(A(p)>=0)
%             A(p) = 1000*A(p) + originalmean(p);
%             %customcolormap(p,:) = [1 0 0];
%             %h = plot(x(p),A(p));
%             %h = plot(A(p));
%             %set(h, 'Color','green');
%             %set(h,'Color','green');
%             %hold on;
%         else
%             %customcolormap(p,:) = [0 1 0];
%             A(p) = 1000*abs(A(p)) + originalmean(p);
%             %h = plot(A(p));
%             %set(h, 'Color','red');
%             %h = plot(x(p),A(p));
%             
%             %set(h,'Color','red');
%             %hold on;
%         end
%     end
%     hold off;
%     
%     positive = A(A>=0);
%     posIndex = find(A >= 0);
%     negative = A(A < 0);
%     negIndex = find(A<0);
%     
%     positiveAndMean = bsxfun(@plus, 1000*positive,originalmean(posIndex)');
%     negativeAndMean = bsxfun(@plus, 1000*abs(negative),originalmean(negIndex)');
%     
%     h = plot(positiveAndMean);
%     set(h, 'Color','green');
%     hold on;
%     h = plot(negativeAndMean);
%     set(h,'Color','red');
%     hold off;
    
%     customcolormap = zeros(row, 3);
%     greencolor = [0 1 0];
%     for p=1:length(posIndex)
%         customcolormap(posIndex(p),:) = greencolor;
%         A(posIndex(p)) = positiveAndMean(p);
%     end
%     redcolor = [0 1 0];
%     for n=1:length(negIndex)
%         %customcolormap(negIndex(n),:) = redcolor;
%         A(negIndex(n)) = negativeAndMean(n);
%     end
    
    
    %co = get(gca,'ColorOrder');
    %set(gca, 'ColorOrder', customcolormap, 'NextPlot', 'replacechildren');
    %co = get(gca,'ColorOrder') ;
    %for j=1:length(A)
%     h = plot(max(A,-100000));
%     set(h, 'Color','green');
%     hold on;
%     h = plot(max(-A,-10000));
%     set(h,'Color','red');
%     hold off;
      %  h = plot(x,A');%, 'LineWidth',3);
        %set(h,'Color',customcolormap)
    %end
    %colormap(s,customcolormap);
    %set(h,'Color',customcolormap);
   
%     A(posIndex) = positiveAndMean;
%     A(negIndex) = negativeAndMean;
    %abspc(:,i) = bsxfun(@plus, 1000*pc(:,i),originalmean');
    %h = polar(x,abspc(:,i)');
  
%     h = polar(x(posIndex),positiveAndMean');
%     set(h,'Color','green');
%     hold on;
%     
%     h = polar(x(negIndex),negativeAndMean');
%     set(h,'Color','red');
%     hold off;
% %     y1 = flipud(pc(:,i));
% %     polar(x,y1');
%      view(90, 90);
%     hold on;
%     view(90, 90);
end

figure();

h = polar(x',originalmean');
set(h,'Color','blue');
set(gcf,'numbertitle','off','name',strcat('mean' , titlePcs)); % See the help for GCF
