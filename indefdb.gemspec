Gem::Specification.new do |spec|
  spec.name = "indefdb"
  spec.version = "1.0.0"
  spec.authors = ["rednaw"]
  spec.summary = %q{Provides insight into the IndefDB dataset}
  spec.files   = Dir.glob("{filters,lib,public,views}/**/*") + %w(indefdb config.ru)
  spec.bindir = '.'
  spec.executables << 'indefdb'

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
