# NewRepo
# Usage: ruby dotfiles/script/NewProject.rb project ?cookbook
require 'fileutils'

# Config#####
project = ARGV[0]
cookbook = project[0..8]=='cookbook-'
delete = ['.buildpath','.project','.metadata','nbproject','.settings','CONTRIBUTING.md']
dotfilesPath = 'dotfiles'
dotfilesRepo = 'git@github.com:seagoj/dotfiles.git'
projectRepo = 'git@github.com:seagoj/'+project+'.git'
template = {
	'dotfiles'=>['LICENSE','.gitattributes','.gitignore','CONTRIBUTING.md'],
	'dirs'=>['src'],
	'genfiles'=>['README.md',project+'.sublime-project'],
	'README.md'=>'## '+project,
	project+'.sublime-project'=>'{"folders":[{"path":"/'+Dir.pwd.gsub(':','')+'/'+project+'"}]}'
}
#############

# Clean old project files from directories
# Remove files recursively from a directory tree
puts "Deleting old project files from workspace"
# Delete old metadata
Dir.entries('.').each do |d|
	delete.each do |f|
		if(File.exists?(d+'/'+f))
			puts d+'/'+f
			FileUtils.rm_rf(d+'/'+f)
			# File.delete(d+'/'+f)
		end
	end
end

unless(File.exists?(dotfilesPath))
	puts "Pulling dotfiles from "+dotfilesRepo
	system('git clone '+dotfilesRepo+' '+dotfilesPath)
else
	puts "Fetching dotfiles updates from "+dotfilesRepo
	system('cd '+dotfilesPath+' && git add * && git commit -a -m "Update dotfiles from script" && git fetch')
	system('git remote add github '+dotfilesRepo)
	system('git push -u github master')
end

unless(File.exists?(project))
	Dir.mkdir(project)
end
Dir.chdir Dir.pwd+'/'+project.chomp

unless(cookbook)
	template['dirs'].each do |dir|
		File.delete('.gitattributes')
		File.delete('.gitignore')
		unless(File.exists?(dir))
			puts "Creating "+dir+" directory"
			Dir.mkdir(dir)
		end
	end
end

template['dotfiles'].each do |dotfile|
	unless(File.exists?(dotfile))
		puts "Copying "+dotfile
		FileUtils.cp('../'+dotfilesPath+'/git/'+dotfile,'.')
	end
end

template['genfiles'].each do |gen|
	unless(File.exists?(gen))
		puts "Building "+gen
		file = File.new(gen,'wb')
		file.write(template[gen])
	end
end

system('git init')
system('git add *')
system('git commit -a -m "Commit dotfiles"')
system('git remote add github '+projectRepo)
system('git push -u github master')