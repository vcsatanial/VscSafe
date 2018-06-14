Pod::Spec.new do |s|
  s.name         = 'VscSafe'
  s.ios.deployment_target = '7.0'
  s.version      = '1.0.4'
  s.summary      = '规避使用常见系统API时产生的崩溃'
  s.description  = <<-DESC
			对数组越界,字典nil值等进行了方法交换,保证app运行的安全
                   DESC

  s.homepage     = 'https://github.com/vcsatanial/VscSafe'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'VincentSatanial' => '116359398@qq.com' }
  s.source       = { :git => 'https://github.com/vcsatanial/VscSafe.git', :tag => s.version }
  s.source_files = 'VscSafe/*.{h,m}'
  s.requires_arc = true

end
