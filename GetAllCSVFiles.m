
function fileList = GetAllCSVFiles(inputDir, filestofind)
    path = inputDir;
	dirinfo = dir(inputDir);

	dirIndex = [dirinfo.isdir]; 
	disp(dirIndex);
	%fileList = fullfile(dirinfo(~dirIndex).name, filestofind); 
	fileList = {dirinfo(~dirIndex).name}';
	disp(fileList);

	if ~isempty(fileList)
		fileList = cellfun(@(x) fullfile(inputDir, x), fileList, 'UniformOutput', false);
		disp(fileList);

		RunPCA(fileList);
	end

	subDirs = {dirinfo(dirIndex).name}; 
	validIndex = ~ismember(subDirs, {'.','..'}); % subdirectories not '.' or '..'

	for iDir = find(validIndex)
		nextDir = fullfile(inputDir, subDirs{iDir});
		fileList = [fileList; GetAllCSVFiles(nextDir, filestofind)];
	end
end
	
  
  