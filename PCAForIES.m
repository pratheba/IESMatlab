
function fileList = GetAllFiles(inputDir, filestofind)

	%filestofind = '*.csv';
	%dirinfo = dir('/Users/prathebaselvaraju/4-Projects/IES/IESparser/IESParser/IESParser/Output');
	%inputDir = '/Users/prathebaselvaraju/4-Projects/IES/IESparser/IESParser/IESParser/Output'
	dirinfo = dir(inputDir);

	dirIndex = [dirinfo.isdir]; 
	disp(dirIndex);
	fileList = {dirinfo(~dirIndex).name};
	disp(fileList);

	if ~isempty(fileList)
		fileList = cellfun(@x, fullfile(dirName, x), fileList, 'UniformOutput', false);
		disp(fileList);
	end

	subDirs = {dirinfo(dirIndex).name};
	validIndex = ~ismember(subDirs, {'.','..'}); % subdirectories not '.' or '..'

	for iDir = find(validIndex)
		nextDir = fullfile(inputDir, subDirs{iDir});
		fileList = [fileList; GetAllFiles(nextDir, filestofind)];
	end
	
  
  subDirs = {dirData(dirIndex).name};  %# Get a list of the subdirectories
  validIndex = ~ismember(subDirs,{'.','..'});  %# Find index of subdirectories
                                               %#   that are not '.' or '..'
  for iDir = find(validIndex)                  %# Loop over valid subdirectories
    nextDir = fullfile(dirName,subDirs{iDir});    %# Get the subdirectory path
    fileList = [fileList; GetAllFiles(nextDir)];  %# Recursively call GetAllFiles
  end