# NewRepo
# Usage: ruby dotfiles/script/NewProject.rb project ?vagrantfile
require 'fileutils'

class Project
    attr_accessor :project,
                  :vagrant,
                  :docRoot,
                  :codeRoot,
                  :delete,
                  :cookbook,
                  :dotfilesPath,
                  :dotfilesRepo,
                  :projectRepo,
                  :template,
                  :log,
                  :output

    def initialize(args)
        @project = args[:project] unless args[:project].nil?

        if @project == nil
            abort("Project not set")
        end

        # Set instance defaults
        defaults = {
            :vagrant=>nil,
            :docRoot=>'/var/www',
            :codeRoot=>`pwd`,
            :destroy=>[
                '.buildpath',
                '.project',
                '.metadata',
                'nbproject',
                '.settings'
            ],
            :dotfilesPath=>'dotfiles',
            :dotfilesRepo=>'git@github.com:seagoj/dotfiles.git',
            :log=>File.new('NewProject.log','a+'),
            :cookbook=> @project[0..8]=='cookbook-',
            :projectRepo=> "git@github.com:seagoj/#{@project}.git",
            :template => {
                'dotfiles'=>['LICENSE','.gitattributes','.gitignore','CONTRIBUTING.md'],
                'dirs'=>['src'],
                'genfiles'=>['README.md',"#{@project}.sublime-project",'.git/hooks/post-receive'],
                'README.md'=>"## #{@project}",
                "#{@project}.sublime-project"=>'{"folders":[{"path":"/'+Dir.pwd.gsub(':','')+'/'+@project+'"}]}',
                '.git/hooks/post-receive'=>"cd ~/code/#{@project} && git pull github master"
            },
            :output=>'## '+Time.now.ctime+"\n"
        }

        defaults.merge(args).each do |k,v|
           instance_variable_set("@#{k}", v) unless v.nil?
        end

        self.destroy()
        self.update()
    end

    def destroy
        # Clean old project files from directories
        # Remove files recursively from a directory tree
        # log.info("Deleting old project files from workspace")
        puts "Destroying passed files in #{codeRoot}"
        # Delete files in @destroy hash
        Dir.entries('.').each do |d|
            @destroy.each do |f|
                if(File.exists?(d+'/'+f))
                    puts d+'/'+f
                    FileUtils.rm_rf(d+'/'+f)
                end
            end
        end
    end

    def update
        unless(File.exists?(@dotfilesPath))
            puts "Pulling dotfiles from #{@dotfilesRepo}"
            @output += `git clone #{@dotfilesRepo} #{@dotfilesPath}`
        else
            # log.info("Fetching dotfiles updates from "+dotfilesRepo)
            puts "Fetching dotfiles updates from #{@dotfilesRepo}"
            Dir.chdir(@dotfilesPath)
            
            @output += `git add * 2>&1`; result=$?.success?

            # log.write(output+"\n\n")
            
            # output = `git commit -a`
            @output += `git commit -m "Update dotfiles from script" 2>&1`; result=$?.success?
            @output += `git fetch 2>&1`; result=$?.success?
            # log.write(output+"\n\n")
            @output += `git remote add github #{@dotfilesRepo} 2>&1`; result=$?.success?
            # log.write(output+"\n\n")

            branchOutput = `git branch 2>&1`; result=$?.success?
            branch= branchOutput[2..branchOutput.length-1]
            # puts dotBranch
            @output+=`git push -u github #{branch} 2>&1`; result=$?.success?
            Dir.chdir('..')
        end
    end

    def mkDir
        unless(File.exists?(@project))
            Dir.mkdir(@project)
        end
            Dir.chdir Dir.pwd+'/'+@project.chomp
    end

    def genDirs
        unless(@cookbook)
            @template['dirs'].each do |dir|
                unless(File.exists?(dir))
                    puts "Creating #{dir} directory"
                    Dir.mkdir(dir)
                    if(dir=='src')
                        Dir.chdir('src')
                        index = File.new("index.php","wb")
                        index.write("<?php\n\tprint 'It\\'s alive!';\n")
                        Dir.chdir('..')
                        puts Dir.pwd
                    end
                end
            end
        end
    end

    def genGit()
        if(File.exists?('.gitattributes'))
            File.delete('.gitattributes')
        end
        if(File.exists?('.gitignore'))
            File.delete('.gitignore')
        end

        @template['dotfiles'].each do |dotfile|
            unless(File.exists?(dotfile))
                puts "Copying #{dotfile}"
                FileUtils.cp('../'+@dotfilesPath+'/git/'+dotfile,'.')
            end
        end
    end

    def setGitHook()
        unless(File.exists?(@docRoot+'/hook.php'))
            Fileutils.cp('../'+@dotfilesPath+'/git/hook.php', @docRoot+'/hook.php')
        end

        `sudo git clone git://github.com/seagoj/#{@project}.git #{@docRoot}/#{@project}`
        `sudo chown -R http #{@docRoot}/#{@project}`
    end

    def genSublimeText()
        @template['genfiles'].each do |gen|
            unless(File.exists?(gen))
                puts "Building #{gen}"
                file = File.new(gen,'wb')
                file.write(@template[gen])
            end
        end

        FileUtils.chmod 0755, "#{@project}/.git/hooks/post-receive"
    end

    def genVagrant()
        if(@vagrant)
          unless(File.exists?("Vagrantfile"))
              puts "Copying #{@vagrant} Vagrantfile"
              FileUtils.cp("../#{@dotfilesPath}/vagrantfiles/#{@vagrant}/Vagrantfile",".")
          end
        end
    end

    def githubPush()
        branchOutput=`git branch 2>&1`; result=$?.success?
        branch= branchOutput[2..branchOutput.length-1]

        @output += `git init 2>&1`; result=$?.success?
        @output += `git add * 2>&1`; result=$?.success?
        @output += `git commit -a -m "Commit dotfiles" 2>&1`; result=$?.success?
        @output += `git remote add github #{@projectRepo} 2>&1`; result=$?.success?
        @output += `git push -u github #{branch} 2>&1`; result=$?.success?
    end
end

project = Project.new :project => ARGV[0], :vagrant => ARGV[1]
