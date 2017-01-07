
Pod::Spec.new do |s|

  s.name         = "GhostEventCenter"
  s.version      = "1.0.1"
  s.summary      = "An event center meant to work independently from NotificationCenter."
  s.description  = "An event center meant to work independently from NotificationCenter. Users strong types hooray."
  s.homepage     = "https://github.com/dnsmob/GhostEventCenter"
  s.license      = "MIT"
  s.author       = { "dns sandas" => "eurodns@hotmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/dnsmob/GhostEventCenter.git" , :tag => "1.0.1" }
#  s.source       = { :path => '.' }
  s.source_files  = "GhostEventCenter", "GhostEventCenter/**/*.{h,m,swift}"
#  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3' }

end
