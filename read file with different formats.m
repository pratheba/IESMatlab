% - Get structure from first line.
		 fid  = fopen( fileslist{index}, 'r' ) ;
		 line = fgetl( fid ) ;
		 fclose( fid ) ;
		 isStrCol = isnan( str2double( regexp( line, '[^\t]+', 'match' ))) ;

		 % - Build formatSpec for TEXTSCAN.
		 fmt = cell( 1, numel(isStrCol) ) ;
		 fmt(isStrCol)  = {'%s'} ;
		 fmt(~isStrCol) = {'%f'} ;
		 fmt = [fmt{:}] ;

		 % - Read full file.
		 fid  = fopen( fileslist{index}, 'r' ) ;
		 data = textscan( fid, fmt, Inf, 'Delimiter', '\t' ) ;
		 fclose( fid ) ;
		 
		 % - Optional: aggregate columns into large cell array.
		 for colId = find( ~isStrCol )
		    data{colId} = num2cell( data{colId} ) ;
		 end
		 data = [data{:}] ;