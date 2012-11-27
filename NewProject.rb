# NewRepo
require 'fileutils'

dotfilesPath = 'dotfiles'
project = ARGV[0]

template = {
	'dotfiles'=>['LICENSE','.gitattributes','.gitignore'],
	'dirs'=>['src'],
	'README.md'=>'# '+project
}

unless(File.exists?(project))
	unless(File.exists?(dotfilesPath))
		system('git clone git@github.com:seagoj/dotfiles.git '+dotfilesPath)
	else
		system('cd '+dotfilesPath+' && git fetch')
	end

	Dir.mkdir(project)
	Dir.chdir Dir.pwd+'/'+project.chomp
	
	template['dirs'].each do |dir|
		Dir.mkdir(dir)
	end
	
	template['dotfiles'].each do |dotfile|
		FileUtils.cp('../'+dotfilesPath+'/'+dotfile,'.')
	end
	
	readme = File.new('README.md','wb')
	readme.write('# '+project)
	
	system('git init')
	system('git add *')
	system('git commit -m "Commit dotfiles"')
	system('git remote add github git@github.com:seagoj/'+project+'.git')
else
	puts project+' already exists.'
end