Dir.chdir('..')
puts Dir.pwd
Dir.chdir('dotfiles')

branch=`git branch`
puts branch[2..branch.length-1]