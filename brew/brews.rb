#!/usr/bin/env ruby

def system_verbose(cmd)
  puts cmd
  success = system(cmd)

  return if success

  puts 'command was not executed successfully'
  puts '💋 Continue or ^C'
  gets
end

def brew_reinstall(package, opts = {})
  opts_with_mode = opts.merge(mode: :reinstall)
  brew_install(package, opts_with_mode)
end

def brew_install(package, opts = {})
  if package.is_a? Array
    package.each do |p|
      brew_install p, opts
    end

    return
  end

  mode = if opts[:mode]
    opts[:mode].to_s
  else
    'install'
  end

  puts "--[ #{package} ]".ljust(80, '-')

  if opts[:loads] && mode == 'reinstall'
    launchctl_unload_cmd = "launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.#{package}.plist"
    system_verbose(launchctl_unload_cmd)
  end

  install_cmd = "brew #{mode} #{package}"
  system_verbose(install_cmd)

  if opts[:loads]
    link_cmd = "ln -sfv /usr/local/opt/#{package}/*.plist ~/Library/LaunchAgents"
    system_verbose(link_cmd)

    launchctl_load_cmd = "launchctl load ~/Library/LaunchAgents/homebrew.mxcl.#{package}.plist"
    system_verbose(launchctl_load_cmd)
  end

  puts
end

doctor_says_ok = system('brew doctor')
raise 'doctor is not happy' unless doctor_says_ok

mode = ARGV[0]

if mode == 'reinstall'
  alias brew brew_reinstall
else
  alias brew brew_install
end

brew 'git'

brew 'nodenv'

brew 'rbenv'

brew 'awscli'

brew ['postgresql', 'redis', 'sqlite']

brew 'imagemagick'

brew ['youtube-dl', 'ffmpeg']

brew 'yle-dl'

#puts 'Tapping brew to homebrew/dupes with sudo'
#system_verbose 'sudo brew tap homebrew/dupes'
brew 'rsync'

brew 'curl'
brew 'wget'

brew 'httpie'

brew 'htop-osx'

# Awesome fuzzy command line search
brew 'fzf'
brew 'kubectx'

# Newer nano is better and needed for nanorc that is the second line
brew 'nano'
system_verbose 'git clone https://github.com/scopatz/nanorc.git ~/.nano'

puts 'Setting suid for htop'
system_verbose 'sudo chown root:wheel `which htop`'
system_verbose 'sudo chmod u+s `which htop`'
