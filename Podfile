 
source 'https://git.coding.net/CocoaPods/Specs.git'
 
platform :ios, '9.0'
#inhibit_all_warnings! #忽略所有依赖库的所有警告
project 'QuysAdviceSDK'
target 'QuysAdviceSDKTests' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_modular_headers!##use_modular_headers：使用use_frameworks后问题修复
 pod 'Masonry',:modular_headers => false
 pod 'YTKNetwork',:modular_headers => false #:inhibit_warnings => true #true 忽略警告
 pod 'YYModel',:modular_headers => false
 pod 'SDWebImage',:modular_headers => false
 pod 'Reachability',:modular_headers => false
 
  target 'QuysAdvice' do
    pod 'Masonry',:modular_headers => false

  end

end
