Pod::Spec.new do |spec|
  spec.name = 'WeSingLibs'
  spec.version = '1.0.0'
  spec.ios.deployment_target = '8.0'


  spec.license = 'MIT'
  spec.summary = 'WeSing Libs'
  spec.homepage = 'https://github.com/SammyLan/WSPods'
  spec.author = { 'Sammy Lan' => 'SammyLan234@gmail.com' }
  spec.source = { :git => 'https://github.com/SammyLan/WSPods.git', :tag => spec.version.to_s }

  spec.description = 'WeSing Libs description'

  spec.requires_arc = true
  #spec.framework = 'ImageIO'
  spec.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  
  spec.default_subspec = 'WSLoginSDK'

  spec.subspec 'WSLoginSDK' do |subspec|
    subspec.source_files = 'WSLoginSDK/WSLoginSDK/**/*.{h,m,mm}'
    #subspec.public_header_files = 'WSLoginSDK/WSLoginSDK/*.h'
  end

end
