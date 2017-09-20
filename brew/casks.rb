

sudo_packages = [
  "vagrant"
]

for package in sudo_packages do
  system("sudo brew cask install #{package}")
end
