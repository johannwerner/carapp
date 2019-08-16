platform :ios, '11.0'
inhibit_all_warnings!
use_frameworks!
source 'https://github.com/CocoaPods/Specs.git'
ENV['COCOAPODS_DISABLE_STATS'] = 'true'

# Workspace and project definition
workspace 'CarApp'
project 'CarApp.xcodeproj'

def shared_pods
    pod 'PureLayout'
    pod 'R.swift', '5.0.3'
    pod 'RxCocoa'
    # Network layer abstraction
    pod 'Alamofire', '4.8.1'
    pod 'RxAlamofire', '5.0.0'
end


target 'CarApp' do
    project 'CarApp.xcodeproj'

    shared_pods
    target 'CarAppTests' do
      inherit! :search_paths
    end
    
end

## Post actions

post_install do |installer|
    
    installer.pods_project.targets.each do |target|
        
        target.build_configurations.each do |config|
            config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ""
            config.build_settings['CODE_SIGNING_REQUIRED'] = "NO"
            config.build_settings['CODE_SIGNING_ALLOWED'] = "NO"
            config.build_settings['GCC_WARN_INHIBIT_ALL_WARNINGS'] = "YES"
            
            if [
                'R.swift.Library'
                ].include?(target.name)
                
                puts "Setting Swift version for #{target.name} to 4.0"
                
                config.build_settings['SWIFT_VERSION'] = '4.0'
            end

        end
        
    end
    
end
