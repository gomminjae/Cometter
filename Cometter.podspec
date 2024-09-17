Pod::Spec.new do |s|
  s.name             = 'Cometter'
  s.version          = '1.0.1'
  s.summary          = 'Using CAEmitter & Gesture Particle Crumb Generator'
  s.homepage         = 'https://github.com/gomminjae/Cometter'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'gomminjae' => 'gommj0611@naver.com' }
  s.source           = { :git => 'https://github.com/gomminjae/cometter.git', :tag => s.version.to_s }
  s.ios.deployment_target = '16.0'
  s.source_files = 'Sources/Cometter/*'
  s.swift_version = '5.0'
  s.requires_arc = true
end
