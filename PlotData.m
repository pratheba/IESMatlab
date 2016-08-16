function [] = PlotData(pcaname, pcadata, adjpcadata, reconstructedData,figtitle)

%         figure();
%         subplot(2,2,1);
%         xlabel('Index');
%         ylabel('Data');
%         title('original data');
%         plot((pcadata)');
%         
%         subplot(2,2,2);
%         plot((adjpcadata)');
%         xlabel('Index');
%         ylabel('Data');
%         title('normalized data');
%         
%         subplot(2,2,3);
%         plot((reconstructedData)');
%         xlabel('Index');
%         ylabel('Data');
%         title('reconstructedData data');
        
        [row col] = size(reconstructedData);
        numberOfData = 1;
        if row < 1
            return;
        end
%         if(row >= 50)
%             numberOfData = 50;
%         elseif row >= 25
%             numberOfData = 25;
%         elseif row >= 10
%             numberOfData = 10;
%         else
%             return;
%         end
        
        r = randi([1 row],1,numberOfData);
        figure('name',figtitle);
        subplot(2,2,1);
        
        x = 0:2.5:360;
        x = x+3*pi/2;
        x = deg2rad(x);
        %c = zeros(50,1,3);
        
        yPCA = zeros(numberOfData, col);
        for i=1:numberOfData
            yPCA(i,:) = pcadata(r(i),:);
            yPCA(i,:) = (yPCA(i,:) - min(yPCA(i,:)))/(max(yPCA(i,:)) - min(yPCA(i,:)));
            
            c = rand(1,3);
            h = polar(x,yPCA(i,:));
            set(h,'Color',c);
            y1 = yPCA(i,:);
            y1(col/2+1:end) = fliplr(y1(1:col/2));
            h = polar(x,y1);
            view(90, 90);
            set(h,'Color',c);
            hold on;
        end
        title('OriginalData');
        hold off;
        
        subplot(2,2,2);
        
        yRecons = zeros(numberOfData, col);
        for i=1:numberOfData
            yRecons(i,:) = reconstructedData(r(i),:);
            yRecons(i,:) = (yRecons(i,:) - min(yRecons(i,:)))/(max(yRecons(i,:)) - min(yRecons(i,:)));
            c = rand(1,3);
            h = polar(x,yRecons(i,:));
            set(h,'Color',c);
            y1 = yRecons(i,:);
            y1(col/2+1:end) = fliplr(y1(1:col/2));
            h = polar(x,y1);
            view(90, 90);
            hold on;
        end
        title('ReconstructedData');
        hold off;
        
        subplot(2,2,3);
        
        
%         D = abs(pcadata-reconstructedData).^2;
%         MSE = sum(D(:))/numel(pcadata);
        cnames = {'Mean Squared Error'};
        rnames = cell(numberOfData,1);
        for i=1:numberOfData
            rnames{i} = pcaname{1,r(i)};
        end;
        
        err = zeros(size(r));
        err = err';
        for i=1:numberOfData
            err(i) = immse(pcadata(r(i),:),reconstructedData(r(i),:));
        end;
        
        for i=1:numberOfData
            y = abs(yPCA(i,:)- yRecons(i,:));
            %y = (y - min(y))/(max(y) - min(y));
            c = rand(1,3);
            h = polar(x,y);
            set(h,'Color',c);
%             y1 = y;
%             y1(col/2+1:end) = fliplr(y1(1:col/2));
%             h = polar(x,y1);
             view(90, 90);
            hold on;
        end
        title('absolute error');
        hold off;
        
        subplot(2,2,4);
        %err = immse(pcadata,reconstructedData);
        t = uitable;
        set(t, 'Data', err);%, 'ColumnName',cnames,'RowName',rnames);
        pos = get(subplot(2,2,4),'position');
        set(t,'units','normalized');
        set(t,'position',pos);
        title('Error info');
%         cw = [25;25];
%         cw = cw';
        %set(t, 'ColumnWidth', cw);
        %t.Position(3) = t.Extent(3);
        %t.Position(4) = t.Extent(4);
            
end