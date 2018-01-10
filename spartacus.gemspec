Gem::Specification.new do |s|
  s.name        = 'spartacus'
  s.version     = '0.2.10'
  s.files         = `git ls-files`.split($\)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]
  s.date        = '2015-09-25'
  s.summary     = 'A client for the Bloc API'
  s.description = 'A client for the Bloc API'
  s.post_install_message = "Remember: we are all merely waiting for a certain, lonely death."
  s.authors     = ['Ben Neely', 'Joe Lipper']
  s.email       = 'ben@bloc.to'
  s.homepage    = 'http://rubygems.org/gems/spartacus'
  s.license     = 'MIT'
  s.add_runtime_dependency 'httparty', '~>0.13.7'
  s.add_runtime_dependency 'activesupport', '~>4.2.6'
  s.add_runtime_dependency 'json', '~>1.8.3'
  s.add_runtime_dependency 'dotenv', '~>2.1.1'
  s.add_development_dependency 'bundler', '~>1.12.5'
  s.add_development_dependency 'rspec', '~> 3.4'
  s.add_development_dependency 'rake', '~>11.1.2'
  s.add_development_dependency 'vcr', '~>3.0.3'
  s.add_development_dependency 'webmock', '~>2.0.3'
end
