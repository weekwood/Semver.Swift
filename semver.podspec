#
# Be sure to run `pod lib lint semver.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "semver"
  s.version          = "0.0.1"
  s.summary          = "Swift Semantic Versioning Library"
  s.homepage         = "https://github.com/weekwood/Semver.Swift.git"
  s.license          = 'MIT'
  s.author           = { "di wu" => "di.wu@me.com" }
  s.source           = { :git => "https://github.com/weekwood/Semver.Swift.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_file = 'Semver.swift'
end
