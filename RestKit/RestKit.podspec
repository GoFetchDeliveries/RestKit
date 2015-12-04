Pod::Spec.new do |s|
  s.name             =  'RestKit'
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

    s.prefix_header_contents = <<-EOS
    #import <CoreData/CoreData.h>
EOS

  # Preserve the layout of headers in the Code directory
  #s.header_mappings_dir = 'Code'

  ### Subspecs

  s.subspec 'Core' do |cs|
    cs.source_files = '*',
                      'RestKit/Code/CoreData', 'RestKit/Code/CoreData.h',
                      'RestKit/Code/Network', 'RestKit/Code/Network.h',
                      'RestKit/Code/ObjectMapping', 'RestKit/Code/ObjectMapping.h',
                      'RestKit/Code/Support', 'RestKit/Code/Support.h',
                      'RestKit/Vendor/LibComponentLogging/Core'

    cs.dependency 'RestKit/AFNetworking'
    cs.dependency 'RestKit/ISO8601DateFormatterValueTransformer'
    cs.dependency 'RestKit/SOCKit'
    cs.dependency 'RestKit/TransitionKit'
    cs.dependency 'RestKit/RKValueTransformers'

        cs.prefix_header_contents = <<-EOS
#import <Availability.h>

#define _AFNETWORKING_PIN_SSL_CERTIFICATES_

#if __IPHONE_OS_VERSION_MIN_REQUIRED
  #import <SystemConfiguration/SystemConfiguration.h>
  #import <MobileCoreServices/MobileCoreServices.h>
  #import <Security/Security.h>
#else
  #import <SystemConfiguration/SystemConfiguration.h>
  #import <CoreServices/CoreServices.h>
  #import <Security/Security.h>
#endif
EOS
  end

  s.subspec 'AFNetworking' do |os|
    os.source_files   = 'AFNetworking/AFNetworking'
  end

   s.subspec 'ISO8601DateFormatterValueTransformer' do |os|
    os.source_files   = 'ISO8601DateFormatterValueTransformer/Code'
  end

  s.subspec 'SOCKit' do |os|
    os.source_files   = 'SOCKit'
    os.requires_arc = false
  end

  s.subspec 'TransitionKit' do |os|
    os.source_files   = 'TransitionKit/Code'
  end

  s.subspec 'RKValueTransformers' do |os|
    os.source_files   = 'RKValueTransformers/Code'
  end
end
