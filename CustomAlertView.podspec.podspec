Pod::Spec.new do |s|
s.name            = ‘CustomAlertView’
s.version          = ‘1.0.0’
s.summary          ='summary CustomAlertView.'
s.homepage        = 'https://github.com/wangp-developer/CustomAlertView'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author          = { 'wangp-developer' => '229747224@qq.com' }
s.source          = { :git => 'https://github.com/wangp-developer/CustomAlertView.git', :tag => "#{s.version}" }
s.ios.deployment_target = '8.0'
s.requires_arc = true
end
