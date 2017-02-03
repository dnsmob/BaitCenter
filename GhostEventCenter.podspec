Pod::Spec.new do |s|
    s.name         = "GhostEventCenter"
    s.version      = "1.1.0"
    s.summary      = "An event center meant to work independently from NotificationCenter."
    s.description  = "An event center meant to work independently from NotificationCenter. Uses strong types hooray."
    s.homepage     = "https://github.com/dnsmob/GhostEventCenter"
    s.license      = "MIT"
    s.author       = { "dns sandas" => "eurodns@hotmail.com" }

    s.source       = { :git => "https://github.com/dnsmob/GhostEventCenter.git" , :tag => "1.1.0" }
    s.source_files = "Sources/*.swift"

    s.ios.deployment_target = "8.0"
    s.osx.deployment_target = "10.9"
    s.tvos.deployment_target = "9.0"
    s.watchos.deployment_target = "2.0"
end
