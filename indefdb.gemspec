Gem::Specification.new do |s|
  s.name        = 'indefdb'
  s.version     = '1.0.0'
  s.date        = '2020-01-01'
  s.summary     = "IndefDB"
  s.description = "Provides insight into the IndefDB dataset"
  s.authors     = ["rednaw"]
  s.files       = Dir.glob("{filters,lib,public,views}/**/*") + %w(indefdb config.ru)
  s.homepage    = 'https://github.com/rednaw/indefdb'
  s.license     = 'MIT'
  s.bindir = '.'
  s.executables << 'indefdb'

  s.required_ruby_version = '>= 2.3.7'
end
