# RemoveFiles
# Remove files recursively from a directory tree

files = ['.buildpath','.project']

Dir.entries('.').each do |d|
	
	files.each do |f|
		if(File.exists?(d+'/'+f))
			puts d+'/'+f			
			File.delete(d+'/'+f)
		end
	end
end
