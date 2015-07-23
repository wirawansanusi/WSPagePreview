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
  s.version          = "1.0.17"
  s.summary          = "WSPagePreview lets you to create a customisable page preview with additional options like page size, margin and font size."
  s.description      = "Create a customizable page preview without any trouble!
                        Supports :
                        - Auto Layout
                        - Storyboard
                        - iOS 7.0+"
  s.homepage         = "https://github.com/wirawansanusi/WSPagePreview"
  s.screenshots     = "http://i.imgur.com/qdndBZq.png", "http://i.imgur.com/VPPARlx.png", "http://i.imgur.com/H5h6Qu1.png"
  s.license          = 'Apache-2.0'
  s.author           = { "wirawansanusi" => "kucingsunter@gmail.com" }
  s.source           = { :git => "https://github.com/wirawansanusi/WSPagePreview.git", :tag => s.version.to_s }
  s.social_media_url = 'http://www.wirawansanusi.com/'

  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = { 'WSPagePreview' => ['Pod/Assets/*.png'] }
end
