function [PCAName PCAData] = ExtractDataForPCA(file)
    
    fid  = fopen( file, 'r' ) ;
    line = fgetl( fid ) ;
    fclose( fid ) ;
    C = strsplit(line, ' ');
    isStrCol = isnan( str2double(C));

    % - Build formatSpec for TEXTSCAN.
    fmt = cell( 1, numel(isStrCol) ) ;
    fmt(isStrCol)  = {'%s'} ;
    fmt(~isStrCol) = {'%f'} ;
    fmt = [fmt{:}] ;

    % - Read full file.
    fid  = fopen( file, 'r' ) ;
    data = textscan( fid, fmt, Inf, 'Delimiter', ' ' ) ;
    fclose( fid ) ;


    [row colSize] = size(data);
    [rowSize col] = size(data{2});
    
    PCAName = data{1};
    PCAName = PCAName';
         
    PCAData = zeros(rowSize, colSize-1);
    for i = 2 : colSize
        PCAData(:,i-1)= data{i};
    end
        
end