function [] = PlotData(pcadata, adjpcadata, reconstructedData)

        figure();
        subplot(2,2,1);
        xlabel('Index');
        ylabel('Data');
        title('original data');
        plot((pcadata)');
        
        subplot(2,2,2);
        plot((adjpcadata)');
        xlabel('Index');
        ylabel('Data');
        title('normalized data');
        
        subplot(2,2,3);
        plot((reconstructedData)');
        xlabel('Index');
        ylabel('Data');
        title('reconstructedData data');
end