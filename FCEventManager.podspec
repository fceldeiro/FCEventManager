Pod::Spec.new do |s|
  s.name = 'FCEventManager'
  s.version = '0.0.3'
  s.license = 'MIT'
  s.summary = 'Elegant Event Manager in Swift'
  s.homepage = 'https://github.com/fceldeiro/FCEventManager'
  s.authors = { 'Fabian Celdeiro' => 'me@me.com'}
  s.source = { :git => 'https://github.com/fceldeiro/FCEventManager.git', :tag => 'v0.0.3'}
  s.ios.deployment_target = '8.0'
  #s.osx.deployment_target = '10.9'

  s.source_files = 'FCEventManager/src/*.swift'

  s.requires_arc = true
end