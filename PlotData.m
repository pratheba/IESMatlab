function [] = PlotData(pcaname, pcadata, adjpcadata, reconstructedData)

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
        r = randi([1 row],1,50);
        figure();
        subplot(2,2,1);
        title('OriginalData');
        x = 0:2.5:360;
        x = deg2rad(x);
        %c = zeros(50,1,3);
        for i=1:50
            y = pcadata(r(i),:);
            y = (y - min(y))/(max(y) - min(y));
            c = rand(1,3);
            h = polar(x,y);
            set(h,'Color',c);
            hold on;
        end
        hold off;
        
        subplot(2,2,2);
        title('ReconstructedData');
        for i=1:50
            y = reconstructedData(r(i),:);
            y = (y - min(y))/(max(y) - min(y));
            c = rand(1,3);
            h = polar(x,y);
            set(h,'Color',c);
            hold on;
        end
        hold off;
        
        f = subplot(2,2,3);
       
        title('squared error');
        
%         D = abs(pcadata-reconstructedData).^2;
%         MSE = sum(D(:))/numel(pcadata);
        cnames = {'Mean Squared Error'};
        rnames = cell(50,1);
        for i=1:50
            rnames{i} = pcaname{1,r(i)};
        end;
        
        err = zeros(size(r));
        err = err';
        for i=1:50
            err(i) = immse(pcadata(r(i),:),reconstructedData(r(i),:));
        end;
        %err = immse(pcadata,reconstructedData);
        t = uitable;
        set(t, 'Data', err, 'ColumnName',cnames,'RowName',rnames);
        pos = get(subplot(2,2,3),'position');
        set(t,'units','normalized');
        set(t,'position',pos);
        cw = [25;25];
        cw = cw';
        %set(t, 'ColumnWidth', cw);
        %t.Position(3) = t.Extent(3);
        %t.Position(4) = t.Extent(4);
            
end