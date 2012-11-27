# NewRepo
require 'fileutils'

# Clean old project files from directories
# Remove files recursively from a directory tree
puts "Deleting old project files from workspace"
delete = ['.buildpath','.project']

Dir.entries('.').each do |d|
	
	delete.each do |f|
		if(File.exists?(d+'/'+f))
			puts d+'/'+f			
			File.delete(d+'/'+f)
		end
	end
end

dotfilesPath = 'dotfiles'
project = ARGV[0]

template = {
	'dotfiles'=>['LICENSE','.gitattributes','.gitignore','CONTRIBUTING.md'],
	'dirs'=>['src'],
	'genfiles'=>['README.md',project+'.sublime-project'],
	'README.md'=>'## '+project,
	project+'.sublime-project'=>'{"folders":[{"path":"/'+Dir.pwd.gsub(':','')+'/'+project+'"}]}'
}

# unless(File.exists?(project))
	unless(File.exists?(dotfilesPath))
		system('git clone git@github.com:seagoj/dotfiles.git '+dotfilesPath)
	else
		system('cd '+dotfilesPath+' && git fetch')
	end

	unless(File.exists?(project))
		Dir.mkdir(project)
	end
	Dir.chdir Dir.pwd+'/'+project.chomp
	
	template['dirs'].each do |dir|
		unless(File.exists?(dir))
			Dir.mkdir(dir)
		end
	end
	
	template['dotfiles'].each do |dotfile|
		unless(File.exists?(dotfile))
			FileUtils.cp('../'+dotfilesPath+'/git/'+dotfile,'.')
		end
	end

	template['genfiles'].each do |gen|
		# puts gen
		unless(File.exists?(gen))
			file = File.new(gen,'wb')
			file.write(template[gen])
		end
	end
	
	system('git init')
	system('git add *')
	system('git commit -m "Commit dotfiles"')
	system('git remote add github git@github.com:seagoj/'+project+'.git')
# else
# 	puts project+' already exists.'
# end