Pod::Spec.new do |s|
  s.name             =  'RestKit-tvOS-'
  s.version          =  '0.24.1'
  s.summary          =  'RestKit is a framework for consuming and modeling RESTful web resources on iOS and OS X.'
  s.homepage         =  'http://www.restkit.org'
  s.social_media_url =  'https://twitter.com/RestKit'
  s.author           =  { 'Blake Watters' => 'blakewatters@gmail.com' }
  s.source           =  { :git => 'https://github.com/RestKit/RestKit.git', :tag => "v#{s.version}" }
  s.license          =  'Apache License, Version 2.0'

  # Platform setup
  s.requires_arc = true
  s.ios.deployment_target = '6.0'
  s.osx.deployment_target = '10.8'
  s.tvos.deployment_target = '9.0'

  # Exclude optional Search and Testing modules
  s.default_subspec = 'Core'

  # Preserve the layout of headers in the Code directory
  #s.header_mappings_dir = 'Code'

  ### Subspecs

  s.subspec 'Core' do |cs|
    cs.source_files = 'RestKit',
                      'RestKit/RestKit/Code/CoreData', 'RestKit/RestKit/Code/CoreData.h',
                      'RestKit/RestKit/Code/Network', 'RestKit/RestKit/Code/Network.h',
                      'RestKit/RestKit/Code/ObjectMapping', 'RestKit/RestKit/Code/ObjectMapping.h',
                      'RestKit/RestKit/Code/Support',
                      'RestKit/RestKit/Vendor/LibComponentLogging/Core'

    cs.dependency 'RestKit-tvOS-/AFNetworking'
    cs.dependency 'RestKit-tvOS-/ISO8601DateFormatterValueTransformer'
    cs.dependency 'RestKit-tvOS-/SOCKit'
    cs.dependency 'RestKit-tvOS-/TransitionKit'
    cs.dependency 'RestKit-tvOS-/RKValueTransformers'
  end

  s.subspec 'AFNetworking' do |os|
    os.source_files   = 'RestKit/AFNetworking/AFNetworking'
  end

   s.subspec 'ISO8601DateFormatterValueTransformer' do |os|
    os.source_files   = 'RestKit/ISO8601DateFormatterValueTransformer/Code'
  end

  s.subspec 'SOCKit' do |os|
    os.source_files   = 'RestKit/SOCKit'
    os.requires_arc = false
  end

  s.subspec 'TransitionKit' do |os|
    os.source_files   = 'RestKit/TransitionKit/Code'
  end

  s.subspec 'RKValueTransformers' do |os|
    os.source_files   = 'RestKit/RKValueTransformers/Code'
  end
end
