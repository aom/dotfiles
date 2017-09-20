#!/usr/bin/env ruby

files = [
  '.gitconfig',
  '.nanorc',
  '.zshrc',
  '.ackrc',
  '.scmbrc',
  '.ansible.cfg'
]

puts 'Install these before running this:'
%w[
  xcode
  oh-my-zsh
  nvm
  rvm
  brew
  brew cask packages
  scm breeze
].each do |dep|
  puts "  #{dep}"
end

puts 'Install xcode command line tools for homebrew:'
system('xcode-select --install')

puts 'Press [enter] to continue or ^C to cancel'
gets

files.each do |file|
  system("rm -f #{ENV['HOME']}/#{file}")
  system("ln -s #{Dir.pwd}/#{file} #{ENV['HOME']}/#{file}")
end

puts "OK. Listing symlinks in #{ENV['HOME']}"

system("ls -l `find $HOME  -maxdepth 1 -type l -print`")
