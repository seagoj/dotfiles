# NewRepo
# Usage: ruby dotfiles/script/NewProject.rb project ?cookbook
require 'fileutils'

# Config#####
project = ARGV[0]
cookbook = project[0..8]=='cookbook-'
delete = ['.buildpath','.project','.metadata','nbproject','.settings']
dotfilesPath = 'dotfiles'
dotfilesRepo = 'git@github.com:seagoj/dotfiles.git'
projectRepo = "git@github.com:seagoj/#{project}.git"
template = {
	'dotfiles'=>['LICENSE','.gitattributes','.gitignore','CONTRIBUTING.md'],
	'dirs'=>['src'],
	'genfiles'=>['README.md',"#{project}.sublime-project"],
	'README.md'=>"## #{project}",
	"#{project}.sublime-project"=>'{"folders":[{"path":"/'+Dir.pwd.gsub(':','')+'/'+project+'"}]}'
}
logFile = 'NewProject.log'
output = '## '+Time.now.ctime+"\n"
#############
# log = Logger.new(logFile)

# unless(File.exists?(logFile))
# 	log.info(logFile)
# end

# Clean old project files from directories
# Remove files recursively from a directory tree
# log.info("Deleting old project files from workspace")
puts "Deleting old project files from workspace"
# Delete old metadata
Dir.entries('.').each do |d|
	delete.each do |f|
		if(File.exists?(d+'/'+f))
			# log.info(d+'/'+f)
			puts d+'/'+f
			FileUtils.rm_rf(d+'/'+f)
		end
	end
end

unless(File.exists?(dotfilesPath))
	# log.info("Pulling dotfiles from "+dotfilesRepo)
	puts "Pulling dotfiles from #{dotfilesRepo}"
	output += `git clone #{dotfilesRepo} #{dotfilesPath}`
	# log.info(output)
else
	# log.info("Fetching dotfiles updates from "+dotfilesRepo)
	puts "Fetching dotfiles updates from #{dotfilesRepo}"
	Dir.chdir(dotfilesPath)
	
	output += `git add * 2>&1`; result=$?.success?
	# log.write(output+"\n\n")
	
	# output = `git commit -a`
	output += `git commit -m "Update dotfiles from script" 2>&1`; result=$?.success?
	output += `git fetch 2>&1`; result=$?.success?
	# log.write(output+"\n\n")
	output += `git remote add github #{dotfilesRepo} 2>&1`; result=$?.success?
	# log.write(output+"\n\n")

	branchOutput = `git branch 2>&1`; result=$?.success?
	branch= branchOutput[2..branchOutput.length-1]
	# puts dotBranch
	output += `git push -u github #{branch} 2>&1`; result=$?.success?
	Dir.chdir('..')
	exit
end

unless(File.exists?(project))
	Dir.mkdir(project)
end
Dir.chdir Dir.pwd+'/'+project.chomp

unless(cookbook)
	template['dirs'].each do |dir|
		unless(File.exists?(dir))
			puts "Creating #{dir} directory"
			Dir.mkdir(dir)
		end
	end
end

if(File.exists?('.gitattributes'))
	File.delete('.gitattributes')
end
if(File.exists?('.gitignore'))
	File.delete('.gitignore')
end

template['dotfiles'].each do |dotfile|
	unless(File.exists?(dotfile))
		puts "Copying #{dotfile}"
		FileUtils.cp('../'+dotfilesPath+'/git/'+dotfile,'.')
	end
end

template['genfiles'].each do |gen|
	unless(File.exists?(gen))
		puts "Building #{gen}"
		file = File.new(gen,'wb')
		file.write(template[gen])
	end
end

branchOutput=`git branch 2>&1`; result=$?.success?
branch= branchOutput[2..branchOutput.length-1]

output += `git init 2>&1`; result=$?.success?
output += `git add * 2>&1`; result=$?.success?
output += `git commit -a -m "Commit dotfiles" 2>&1`; result=$?.success?
output += `git remote add github #{projectRepo} 2>&1`; result=$?.success?
output += `git push -u github #{branch} 2>&1`; result=$?.success?

File.open(logFile, "a+") { |file| file.write(output) }