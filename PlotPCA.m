function [] = PlotPCA(filename, pc, scores, latent, tsquare, iesnames)
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
    
    [row col] = size(iesnames);
    
	figure();
	plot(scores(:,1),scores(:,2), '+');
    gname(iesnames);
	xlabel('1st principal component');
	ylabel('2nd principal component');
	title(filename);
    

	[pcrows pccols] = size(pc);
	if((pccols < 3) || (cols < 3))
		return;
	end

	%categories = 1:rows;
	%categories = categories;
	%f1 = @(x) sprintf('%d',x);

	%cellfun(f1, num2cell(categories), 'UniformOutput', false)
	%categories = num2str(categories);

	%cellstr(num2str(categories));
	%categories = cellfun(@num2str,num2cell(1:rows),'uni',false)
	categories = strsplit(num2str(1:rows));

	%figure();
	%biplot(pc(:,1:3),'scores',scores(:,1:3));%,'varlabels',categories');
	%title(filename);

	%axis([-.26 0.8 -.51 .51 -.61 .81]);
	%view([30 40]);
end