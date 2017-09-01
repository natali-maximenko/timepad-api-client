Gem::Specification.new do |s|
  s.name         = 'timepad'
  s.version      = '1.0.0'
  s.summary      = 'timepad api client'
  s.description  = 'API client for timepad.ru'
  s.author       = ['Natalia Maximenko']
  s.email        = ['natali.maximenko@gmail.com']
  s.homepage     = 'http://github.com/natali-maximenko/timepad-api-client'
  s.license      = 'MIT'

  s.files        = Dir["{lib}/**/*.rb", "*.md", '.rspec']
  s.require_path = 'lib'
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^spec/})

  #s.add_development_dependency 'rspec', '~> 3.0'
  #s.add_development_dependency 'rspec-its'
end
