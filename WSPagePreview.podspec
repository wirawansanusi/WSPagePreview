#
# Be sure to run `pod lib lint WSPagePreview.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "WSPagePreview"
  s.version          = "1.0.0"
  s.summary          = "WSPagePreview lets you to create a customizable page preview with additional options like page size, margin and font size."
  s.description      = "Create a customizable page preview without any trouble!
                        Supports :
                        - Auto Layout
                        - Storyboard
                        - iOS 8.0+"
  s.homepage         = "https://github.com/wirawan-syscli/WSPagePreview"
  s.screenshots     = "http://i.imgur.com/itoc7vn.png", "http://i.imgur.com/8pql1hq.png", "http://i.imgur.com/vP4W7gE.png"
  s.license          = 'Apache-2.0'
  s.author           = { "wirawan-syscli" => "wirawan@syscli.co.jp" }
  s.source           = { :git => "https://github.com/wirawan-syscli/WSPagePreview.git", :tag => s.version.to_s }
  s.social_media_url = 'http://www.wirawansanusi.com/'

  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = { 'WSPagePreview' => ['Pod/Assets/*.png'] }
end
