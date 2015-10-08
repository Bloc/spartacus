Gem::Specification.new do |s|
  s.name        = 'spartacus'
  s.version     = '0.2.5'
  s.files         = `git ls-files`.split($\)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]
  s.date        = '2015-09-25'
  s.summary     = 'A client for the Bloc AP'
  s.description = 'A client for the Bloc API'
  s.authors     = ['Ben Neely']
  s.email       = 'ben@bloc.to'
  s.homepage    = 'http://rubygems.org/gems/spartacus'
  s.license     = 'MIT'
  s.add_runtime_dependency 'httparty', '~>0.13.7'
  s.add_runtime_dependency 'activesupport', '~>4.2'
  s.add_runtime_dependency 'json', '~>1.8'
  s.add_development_dependency "bundler"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"
  s.add_development_dependency "vcr"
  s.add_development_dependency "webmock"
end
