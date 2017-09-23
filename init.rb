#!/usr/bin/env ruby

def confirm(message = nil)
  puts
  puts message
  puts '💋 Continue or ^C'
  gets
end

def yes_or_no(message)
  puts
  puts message
  puts '💋 [y]es, [N]o or ^C'
  wat = gets.chomp.downcase
  if wat == 'y'
    true
  else
    false
  end
end

puts 'Install these before running this:'
%w[
  XCode
  1Password
].each do |dep|
  puts "  #{dep}"
end

confirm

puts '🍎 -- Install xcode command line tools for homebrew:'
system('xcode-select --install')
puts

if ENV['SHELL'] != '/bin/zsh'
  puts '🍎 -- Install Oh My Zsh'
  puts 'HOX! It will open zsh at the end. Exit that shell to'
  puts 'return to this script.'
  confirm

  system 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'

  puts '🍎 -- Restart the terminal to continue with zsh if you want'
  confirm
end

puts '🍎 -- Install iTerm 2:'
system 'open https://www.iterm2.com/downloads.html'
confirm 'Download and install manually'
puts

puts '🍎 -- Install Alfred:'
system 'open https://www.alfredapp.com'
confirm 'Download and install manually'
puts

puts '🍎 -- Install Dropbox:'
system 'open https://www.dropbox.com/downloading?src=index'
confirm 'Download and install manually'
puts
confirm '🔴 HOX! Login and start syncing since it\'ll take time'
puts

puts '🍎 -- Install Homebrew'
system '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
puts

puts '🍎 -- Install nvm'
system 'curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash'

puts '🍎 -- Install stable nodejs and yarn'
system 'nvm install stable'
system 'npm install yarn -g'
puts

puts '🍎 -- Install rvm'
system 'curl -sSL https://get.rvm.io | bash'
system 'rvm install'
puts

puts '🍎 -- Install scm breeze'
system 'git clone git://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze'
system '~/.scm_breeze/install.sh'
system 'mkdir ~/code'
puts

puts '🍎 -- Install atom'
system 'open https://atom.io/download/mac'
confirm 'Open Atom after moving it to Applications and install Shell Commands'
system 'apm install sync-settings'
confirm 'Atom will ask sync-settings Token and Gist Id. You can do this later.'
puts

puts '🍎 -- Install Chrome'
system 'open https://www.google.com/chrome/index.html'
confirm 'Download and install manually'
puts

puts '🍎 -- Install Flowdock'
system 'open https://flowdock-resources.s3.amazonaws.com/mac/Flowdock.zip'
confirm 'Download and install manually'
puts

puts '🍎 -- Install Karabiner Elements:'
system 'open https://pqrs.org/osx/karabiner/'
confirm 'Download and install manually'
puts

puts '🍎 -- Install Secure Pipes:'
system 'open https://www.opoet.com/pyro/index.php'
confirm 'Download and install manually'
puts

puts '🍎 -- Install Freedome:'
system 'open https://download.sp.f-secure.com/freedome/installer/Freedome.dmg'
confirm 'Download and install manually'
puts

puts '🍎 -- Install Kontena CLI:'
system 'open https://github.com/kontena/kontena/releases/latest'
confirm 'Download and install manually'
puts

if yes_or_no '🔴 Do you want to install VM tools?'

  puts '🍎 -- Install VirtualBox:'
  system 'open https://www.virtualbox.org/wiki/Downloads'
  confirm 'Download and install manually'
  puts

  puts '🍎 -- Install VMWare Fusion:'
  system 'open https://my.vmware.com/'
  confirm 'Login, download and install manually'
  puts

  puts '🍎 -- Install vagrant:'
  system 'open https://www.vagrantup.com/downloads.html'
  confirm 'Download and install manually'
  system 'kontena plugin install vagrant'
  system 'vagrant plugin install vagrant-hostsupdater'
  system 'vagrant plugin install vagrant-rsync'
  system 'vagrant plugin install vagrant-scp'
  system 'vagrant plugin install vagrant-triggers'
  system 'vagrant plugin install vagrant-ca-certificates'
  puts

  puts '🍎 -- Install Docker for Mac'
  system 'curl -O https://download.docker.com/mac/stable/Docker.dmg'
  system 'open Docker.dmg'
  system 'rm Docker.dmg'
  puts
end

if yes_or_no '🔴 Do you want to install experimental dev tools?'
  system 'mkdir ~/code/bin'

  puts '🍎 -- Install kung:'
  system 'git clone git@github.com:matti/kung.git ~/code/bin/kung'
  system 'cat ~/code/bin/kung/README.md'
  confirm 'Install manually'
  puts

  puts '🍎 -- Install kontena-rocks:'
  system 'git clone git@github.com:matti/kontena-rocks.git ~/code/bin/kontena-rocks'
  system 'cat ~/code/bin/kontena-rocks/README.md'
  confirm 'Install manually'
  puts
end

confirm 'Installing brews from homebrew next'
system 'ruby brew/brews.rb'
puts

confirm 'Finally linking your own dotfiles'

files = [
  '.gitconfig',
  '.nanorc',
  '.zshrc',
  '.ackrc',
  '.scmbrc',
  '.ansible.cfg'
]

files.each do |file|
  system("rm -f #{ENV['HOME']}/#{file}")
  system("ln -s #{Dir.pwd}/#{file} #{ENV['HOME']}/#{file}")
end

puts "OK. Listing symlinks in #{ENV['HOME']}"

system("ls -l `find $HOME  -maxdepth 1 -type l -print`")

puts
puts '❤️ Done!'
