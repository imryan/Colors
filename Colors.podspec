Pod::Spec.new do |s|
  s.name             = 'Colors'
  s.version          = '1.0.1'
  s.summary          = 'Simple color palletes courtesy of klart.io'
  s.description      = <<-DESC
Simple color palletes courtesy of klart.io
                       DESC

  s.homepage         = 'https://github.com/imryan/Colors'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ryan Cohen' => 'notryancohen@gmail.com' }
  s.source           = { :git => 'https://github.com/imryan/Colors.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ryancohen'

  s.swift_version = '5.0'
  s.ios.deployment_target = '8.0'
  s.source_files = 'Colors/Classes/**/*'
end
