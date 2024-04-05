Pod::Spec.new do |s|
  s.name                      = "Fastlee"
  s.version                   = "1.1.2"
  s.summary                   = "Fastlee"
  s.homepage                  = "https://github.com/mobilee/Fastlee"
  s.license                   = { :type => "MIT", :file => "LICENSE" }
  s.author                    = { "Łukasz Szarkowicz" => "szarkowicz@gmail.com" }
  s.source                    = { :git => "https://github.com/mobilee/Fastlee.git", :tag => s.version.to_s }
  s.swift_version             = "5.1"
  s.ios.deployment_target     = "12.0"
  s.source_files              = "Sources/**/*"
  
  s.ios.framework             = "UIKit", "Foundation"
end
