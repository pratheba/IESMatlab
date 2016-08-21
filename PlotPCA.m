function [v] = PlotPCA(filename, pc, scores, latent, iesnames,numberOfPrincipalComponents)
	%disp('pc start');
	%disp(pc);
	%disp('pc done');
	%disp('start');
	%disp(scores);
	%disp('score done');
	
	[rows cols] = size(scores);
	if(cols < 2)
		return;
    end
    
    %[row col] = size(iesnames);
    
	figure();
    set(gcf,'numbertitle','off','name',filename) % See the help for GCF
    index=1;
    for i=1:numberOfPrincipalComponents
        for j= 1:numberOfPrincipalComponents
            subplot(numberOfPrincipalComponents,numberOfPrincipalComponents,index);
            
            plot(scores(:,i),scores(:,j), '.');
            %v = gname(iesnames);    

            xlabel(strcat(num2str(i),' PC'));
            ylabel(strcat(num2str(j),' PC'));
            index = index+1;
        end
    end
   
   
%    hs = get(v.text,'String')
    
% 	[pcrows pccols] = size(pc);
% 	if((pccols < 3) || (cols < 3))
% 		return;
% 	end

	%categories = 1:rows;
	%categories = categories;
	%f1 = @(x) sprintf('%d',x);

	%cellfun(f1, num2cell(categories), 'UniformOutput', false)
	%categories = num2str(categories);

	%cellstr(num2str(categories));
	%categories = cellfun(@num2str,num2cell(1:rows),'uni',false)
	%categories = strsplit(num2str(1:rows));

% 	figure();
% 	biplot(pc(:,1:3),'scores',scores(:,1:3));%,'varlabels',categories');
% 	title(filename);
% 
% 	axis([-.26 0.8 -.51 .51 -.61 .81]);
% 	view([30 40]);
end