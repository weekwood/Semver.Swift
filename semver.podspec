Pod::Spec.new do |s|
  s.name             = "semver"
  s.version          = "0.1.2"
  s.summary          = "Swift Semantic Versioning Library"
  s.homepage         = "https://github.com/weekwood/Semver.Swift.git"
  s.license          = 'MIT'
  s.author           = { "di wu" => "di.wu@me.com" }
  s.source           = { :git => "https://github.com/weekwood/semver.swift.git", :tag => s.version.to_s }
  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.source_files = ['SemverSwift/Semver.swift']
end
