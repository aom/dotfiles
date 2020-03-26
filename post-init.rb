#!/usr/bin/env ruby

def system_verbose(cmd)
  puts cmd
  success = system(cmd)

  return if success

  puts 'command was not executed successfully'
  puts '💋 Continue or ^C'
  gets
end

system_verbose 'nodenv install $NODENV_VERSION'
system_verbose 'curl -fsSL https://github.com/nodenv/nodenv-installer/raw/master/bin/nodenv-doctor | bash'
system_verbose 'npm install -g yarn'

puts
puts '❤️ Done!'
