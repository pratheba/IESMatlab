function [] = SaveRecontructedData(filename, pcaname, reconstructedData)

    pcaname = pcaname';
    finaloutput=[pcaname num2cell(reconstructedData)];
    ouputFileName = strcat('/Users/prathebaselvaraju/4-Projects/IES/matlab_files/output/reconstructedData' , filename , '.csv'); 
    %ouputFileinMat = strcat('/Users/prathebaselvaraju/4-Projects/IES/matlab_files/output/reconstructedData' , filename , '.dat'); 
    %dlmwrite(ouputFileName,finaloutput,',','roffset', 1);
    finaloutput = cell2table(finaloutput);
    writetable(finaloutput,ouputFileName);
    %save(ouputFileinMat);
end