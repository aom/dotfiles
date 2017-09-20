#!/usr/bin/env ruby

gems = %w[
  bundler
]

gems.each do |gem|
  system("gem install #{gem}")
end

# Faster bundler via parallerisation - https://robots.thoughtbot.com/parallel-gem-installing-using-bundler

cores = `sysctl -n hw.ncpu`.to_i
system("bundle config --global jobs #{cores - 1}")
