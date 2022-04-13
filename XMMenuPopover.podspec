Pod::Spec.new do |s|
  s.name         = "XMMenuPopover"
  s.version      = "0.0.1"
  s.summary      = "一个可定制的长按菜单项，类似于系统的 UIMenuController "
  s.homepage     = "https://github.com/DFTT/XMMenuPopover"
  s.license      = "MIT"
  s.author       = { "DFTT" => "guoyonghong@021.com" }
  s.platform     = :ios, "10.0"
  s.source       = { :git => "https://github.com/DFTT/XMMenuPopover.git", :tag => "#{s.version}" }
  s.source_files = "MenuPopover/*"
end