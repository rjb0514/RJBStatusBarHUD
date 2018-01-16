Pod::Spec.new do |s|
    s.name         = 'RJBStatusBarHUD'
    s.version      = '1.0.0'
    s.summary      = 'An easy way to display hud'
    s.homepage     = 'https://github.com/rjb0514/RJBStatusBarHUD'
    s.license      = 'MIT'
    s.authors      = {'RJB' => 'rujianbin123@163.com'}
    s.platform     = :ios, '8.0'
    s.source       = {:git => 'https://github.com/rjb0514/RJBStatusBarHUD.git', :tag => s.version}
    s.source_files = 'RJBStatusBarHUD/**/*.{h,m}'
    s.resource     = 'RJBStatusBarHUD/RJBStatusBarHUD.bundle'
    s.requires_arc = true
end
