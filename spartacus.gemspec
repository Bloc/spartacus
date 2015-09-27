Gem::Specification.new do |s|
  s.name        = 'spartacus'
  s.version     = '0.1.2'
  s.add_runtime_dependency 'httparty', '~>0.13.7'
  s.add_runtime_dependency 'activesupport', '~>4.2'
  s.add_runtime_dependency 'json', '~>1.8'
  s.date        = '2015-09-25'
  s.summary     = 'A client for the Bloc AP'
  s.description = 'A client for the Bloc API'
  s.authors     = ['Ben Neely']
  s.email       = 'ben@bloc.to'
  s.files       = ['lib/spartacus.rb']
  s.homepage    = 'http://rubygems.org/gems/spartacus'
  s.license     = 'MIT'
end
