function [] = SavePCA( filename, pc, scores, latent)
	outputpath = strcat(getGlobalx(), '/../Results');
	if ~exist(outputpath,'dir')
		mkdir(outputpath);
    end
	outputfilename = strcat(outputpath, '/',filename,'.txt')
	fid = fopen(outputfilename, 'a');
	if fid ~= -1
		fprintf(fid , '%s\r\n', 'Principal Components');
		fclose(fid);
  	end             

	dlmwrite( outputfilename, pc, '-append', 'delimiter', ',', 'roffset', 1);
	fid = fopen(outputfilename, 'a');
	if fid ~= -1
		fprintf(fid, '\n%s\r\n', 'Scores');
		fclose(fid);
  	end 
	dlmwrite( outputfilename, scores, '-append', 'delimiter', ',', 'roffset', 1);

	fid = fopen(outputfilename, 'a');
	if fid ~= -1
		fprintf(fid, '\n%s\r\n', 'Variance');
		fclose(fid);
  	end 
	dlmwrite( outputfilename, latent, '-append', 'delimiter', ',', 'roffset', 1);
end