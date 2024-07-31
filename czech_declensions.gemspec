# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'czech_declensions/version'

Gem::Specification.new do |s|
  s.name        = 'czech_declensions'
  s.version     = CzechDeclensions::VERSION
  s.authors     = ['Dominik Formánek']
  s.email       = ['dominik.formanek@gmail.com']
  s.homepage    = ''
  s.summary     = 'Czech declensions'
  s.description = 'Tool for czech declensions'

  s.rubyforge_project = 'czech_declensions'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
