function [] = plotOriginalDataForEachPC(pcadata, scores, numOfPrincipalComponents)
    [rows, cols] = size(scores);
    if rows < 5
        return;
    end
%     maxv = max(scores);
%     minv = min(scores);
%     
%     avg = (maxv + minv)/2;
%     
    x = 0:2.5:360;
    x = x+3*pi/2;
    x = deg2rad(x);

    figure();
    numofsubplots = ceil(numOfPrincipalComponents/2);
    for c=1:numOfPrincipalComponents
        subplot(numofsubplots,2,c);
        [tempscore, indices] = sort(abs(scores(:,c)));
        disp('column');
        
        if(numel(tempscore) >= 5)
            for i=1:5
                colorv = rand(1,3);
                disp(indices(i));
                h = polar(x,pcadata(indices(i),:));
                set(h,'Color',colorv);
%                 y1 = pcadata(i,:);
%                 y1(cols/2+1:end) = fliplr(y1(1:cols/2));
%                 h = polar(x,y1);
                view(90, 90);
                set(h,'Color',colorv);
                hold on;
            end
        end
    end
                
%         for r=1:rows
%             if(abs(scores(r,c)) > avg(1,c))
%                 colorv = rand(1,3);
%                 h = polar(x,pcadata(r,:));
%                 set(h,'Color',colorv);
% %                 y1 = pcadata(i,:);
% %                 y1(cols/2+1:end) = fliplr(y1(1:cols/2));
% %                 h = polar(x,y1);
%                 view(90, 90);
%                 set(h,'Color',colorv);
%                 hold on;
%             end
%         end
%     end
        
end