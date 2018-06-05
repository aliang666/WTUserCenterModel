Pod::Spec.new do |s|
  s.name         = "WTUserCenterModel"
  s.version      = "0.0.5"
  s.summary      = "WTUserCenterModel个人中心模块"

  s.homepage     = "https://github.com/aliang666/WTUserCenterModel"

  s.license      = "MIT"
  s.author             = { "jienliang000" => "jienliang000@163.com" }

  s.platform     = :ios
  s.platform     = :ios, "8.0"
  s.requires_arc = true

  s.source       = { :git => "https://github.com/aliang666/WTUserCenterModel.git", :tag => "#{s.version}" }
  s.source_files  = "WTUserCenterModel/*.{h,m}"

  s.subspec 'Abount' do |ss|
    ss.source_files = 'WTUserCenterModel/Abount/**/*.{h,m,c,mm}'
  end

  s.subspec 'Language' do |ss|
    ss.source_files = 'WTUserCenterModel/Language/**/*.{h,m,c,mm}'
  end

  s.subspec 'UserInfo' do |ss|
    ss.source_files = 'WTUserCenterModel/UserInfo/**/*.{h,m,c,mm}'
  end

  s.subspec 'Func' do |ss|
    ss.source_files = 'WTUserCenterModel/Func/**/*.{h,m,c,mm}'
  end

  s.subspec 'Cell' do |ss|
    ss.source_files = 'WTUserCenterModel/Cell/**/*.{h,m,c,mm}'
  end
end
