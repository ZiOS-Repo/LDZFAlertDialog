#
# Be sure to run `pod lib lint LDZFAlertDialog.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LDZFAlertDialog'
  s.version          = '0.1.4'
  s.summary          = 'A short description of LDZFAlertDialog.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/ZiOS-Repo/LDZFAlertDialog'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhuyuhui434@gmail.com' => 'zhuyuhui434@gmail.com' }
  s.source           = { :git => 'https://github.com/ZiOS-Repo/LDZFAlertDialog.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  # s.source_files = 'LDZFAlertDialog/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LDZFAlertDialog' => ['LDZFAlertDialog/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.public_header_files = 'LDZFAlertDialog/**/LDZFAlertDialog.h'
  s.source_files = 'LDZFAlertDialog/**/LDZFAlertDialog.h'
  s.resource_bundles = {
    'LDZFAlertDialog' => ['LDZFAlertDialog/Assets/*'],
    'LDZFAlertDialogExt' => ['LDZFAlertDialog/AssetsExt/*']
  }
    
  s.subspec 'BaseDialog' do |ss|
    ss.source_files = 'LDZFAlertDialog/**/BaseDialog/*.{h,m}'
    ss.dependency 'LDZFCategories'
    ss.dependency 'LDZFCommon'
    ss.dependency 'Masonry'
  end
  
  s.subspec 'DateDialog' do |ss|
    ss.source_files = 'LDZFAlertDialog/**/DateDialog/*.{h,m}'
    ss.dependency 'LDZFAlertDialog/BaseDialog'
  end
  
  s.subspec 'SingleChoiceDialog' do |ss|
    ss.source_files = 'LDZFAlertDialog/**/SingleChoiceDialog/*.{h,m}'
    ss.dependency 'LDZFAlertDialog/BaseDialog'
    ss.dependency 'LDZFPickerView'
  end
  
  s.subspec 'MultiChoiceDialog' do |ss|
    ss.source_files = 'LDZFAlertDialog/**/MultiChoiceDialog/*.{h,m}'
    ss.dependency 'LDZFAlertDialog/BaseDialog'
  end
  

  

end
