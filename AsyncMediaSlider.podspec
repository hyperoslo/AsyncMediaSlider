Pod::Spec.new do |s|
  s.name             = "AsyncMediaSlider"
  s.summary          = "A simple to use media slider that loads remote images asynchronously on demand"
  s.version          = "0.2.0"
  s.homepage         = "https://github.com/hyperoslo/AsyncMediaSlider"
  s.license          = 'MIT'
  s.author           = { "Hyper Interaktiv AS" => "ios@hyper.no" }
  s.source           = { :git => "https://github.com/hyperoslo/AsyncMediaSlider.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/hyperoslo'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Source/**/*'

  s.dependency 'AFNetworking'
end
