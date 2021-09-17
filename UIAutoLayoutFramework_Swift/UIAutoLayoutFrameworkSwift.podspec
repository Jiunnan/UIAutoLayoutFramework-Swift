Pod::Spec.new do |spec|

  spec.name         = "UIAutoLayoutFrameworkSwift"
  spec.version      = "1.1.0"
  spec.summary      = "UIAutoLayoutFramework for Swift"
  spec.description  = "UIAutoLayoutFramework for Swift"
  spec.homepage     = "https://github.com/Jiunnan/UIAutoLayoutFramework-Swift"
  spec.license      = "MIT"
  spec.author       = { "林俊男" => "john74111@gmail.com" }
  spec.platform     = :ios, "9.0"
  spec.source       = { :git => "https://github.com/Jiunnan/UIAutoLayoutFramework-Swift.git", :tag => spec.version.to_s }
  spec.source_files  = "UIAutoLayoutFramework_Swift/**/*.{swift}"
  spec.swift_versions = "5.0"
  
end
