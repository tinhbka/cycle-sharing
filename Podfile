# Uncomment the next line to define a global platform for your project
platform :ios, '14.0'
def install_pods
  use_frameworks!
  pod 'SwiftLint'
  pod 'Firebase/Analytics'
  pod 'Firebase/Crashlytics'
  pod 'SDWebImage'
  pod 'IQKeyboardManagerSwift'
  pod 'R.swift', '~> 7.3.2'

  pod 'RxSwift'
  pod 'RxCocoa'
  
  pod "SCPageControl"

end
target 'CycleSharing' do
  install_pods
end


target 'CycleSharing-Dev' do
  install_pods
end

post_install do |installer|
  installer.generated_projects.each do |project|
    project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
      end
    end
  end
end
