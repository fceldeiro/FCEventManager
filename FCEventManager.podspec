Pod::Spec.new do |s|
  s.name = 'FCEventManager'
  s.version = '1.0.0'
  s.license = 'MIT'
  s.summary = 'Elegant Event Manager in Swift'
  s.homepage = 'https://github.com/fceldeiro/FCEventManager'
  s.authors = { 'Fabian Celdeiro' => 'celdeiro@gmail.com'}
  s.source = { :git => 'https://github.com/fceldeiro/FCEventManager.git', :tag => 'v1.0.0'}
  s.ios.deployment_target = '8.3'
  
  s.source_files = 'FCEventManager/src/*.swift'

  s.requires_arc = true
end