Pod::Spec.new do |s|
  s.name             = "semver"
  s.version          = "1.1.1"
  s.summary          = "Swift Semantic Versioning Library"
  s.homepage         = "https://github.com/weekwood/Semver.Swift.git"
  s.license          = 'MIT'
  s.author           = { "di wu" => "di.wu@me.com" }
  s.source           = { :git => "https://github.com/weekwood/semver.swift.git", :branch => 'swift4' }
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.requires_arc = true
  s.source_files = ['SemverSwift/Semver.swift']
end
