Pod::Spec.new do |s|
  s.name             = 'ShareSDK3'
  s.version          = "3.5.2"
  s.summary          = 'ShareSDK is the most comprehensive Social SDK in the world,which share easily with 40+ platforms.'
  s.license          = 'MIT'
  s.author           = { "Jinghuang Liu" => "liujinghuang@icloud.com" }

  s.homepage         = 'http://www.mob.com'
  s.source           = { :git => "https://github.com/ShareSDKPlatform/ShareSDK.git", :tag => s.version.to_s }
  s.platform         = :ios
  s.ios.deployment_target = "6.0"
  s.frameworks       = 'UIKit', 'JavaScriptCore','SystemConfiguration','CoreTelephony'
  s.libraries        = 'icucore', 'z.1.2.5', 'stdc++'

  s.default_subspecs    = 'ShareSDK'
  s.vendored_frameworks = 'ShareSDK/ShareSDK.framework'

  # 核心模块
    s.subspec 'ShareSDK' do |sp|
        sp.vendored_frameworks = 'ShareSDK/Support/Required/ShareSDKConnector.framework'
        sp.libraries = 'icucore', 'z', 'stdc++'
        sp.resources = 'ShareSDK/Support/Required/ShareSDK.bundle'
    end

    # 各个平台：需要集成哪些平台需要选择相应的平台语句，如果以下语句没有对应的平台，则是：1、不需要（如Twitter），2、ShareSDK尚未支持。
    s.subspec 'ShareSDKPlatforms' do |sp|
        #sp.default_subspecs = 'QQ', 'SinaWeibo', 'WeChat', 'RenRen', 'AliPaySocial','Kakao','Yixin', 'Messenger','Copy','Evernote','GooglePlus','Instagram','Instapaper','Line','Mail','SMS','WhatsApp','Facebook' - Errors: Can't set `default_subspecs` attribute for subspecs

        # QQ
        sp.subspec 'QQ' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformSDK/QQSDK/TencentOpenAPI.framework','ShareSDK/Support/PlatformConnector/QQConnector.framework'
            ssp.resource = 'ShareSDK/Support/PlatformSDK/QQSDK/TencentOpenApi_IOS_Bundle.bundle'
            ssp.libraries = 'sqlite3'
        end

        # SinaWeibo
        sp.subspec 'SinaWeibo' do |ssp|
            ssp.vendored_libraries = "ShareSDK/Support/PlatformSDK/SinaWeiboSDK/*.a"
            ssp.resource = 'ShareSDK/Support/PlatformSDK/SinaWeiboSDK/WeiboSDK.bundle'
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/SinaWeiboConnector.framework'
            ssp.frameworks = 'ImageIO'
            ssp.libraries = 'sqlite3'
            ssp.source_files = "ShareSDK/Support/PlatformSDK/SinaWeiboSDK/*.{h,m}"
            ssp.public_header_files = "ShareSDK/Support/PlatformSDK/SinaWeiboSDK/*.h"
        end

        # WeChat
        sp.subspec 'WeChat' do |ssp|
            ssp.vendored_libraries = "ShareSDK/Support/PlatformSDK/WeChatSDK/*.a"
            ssp.source_files = "ShareSDK/Support/PlatformSDK/WeChatSDK/*.{h,m}"
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/WechatConnector.framework'
            ssp.public_header_files = "ShareSDK/Support/PlatformSDK/WeChatSDK/*.h"
            ssp.libraries = 'sqlite3'
        end

        # RenRen
        sp.subspec 'RenRen' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformSDK/RenRenSDK/RennSDK.framework' ,'ShareSDK/Support/PlatformConnector/RenrenConnector.framework'
            ssp.resource = 'ShareSDK/Support/PlatformSDK/RenRenSDK/RennSDK.bundle'
        end

        # 支付宝（AliPaySocial）
        sp.subspec 'AliPaySocial' do |ssp|
            ssp.vendored_libraries = 'ShareSDK/Support/PlatformSDK/APSocialSDK/*.a'
            ssp.source_files = "ShareSDK/Support/PlatformSDK/APSocialSDK/*.{h,m}"
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/AliPayConnector.framework'
            ssp.public_header_files = "ShareSDK/Support/PlatformSDK/APSocialSDK/*.h"
        end

        # Kakao
        sp.subspec 'Kakao' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformSDK/KaKaoSDK/KakaoOpenSDK.framework','ShareSDK/Support/PlatformConnector/KakaoConnector.framework'
        end

        # Yixin
        sp.subspec 'Yixin' do |ssp|
            ssp.vendored_libraries = "ShareSDK/Support/PlatformSDK/YiXinSDK/*.a"
            ssp.source_files = "ShareSDK/Support/PlatformSDK/YiXinSDK/*.{h,m}"
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/YiXinConnector.framework'
            ssp.public_header_files = "ShareSDK/Support/PlatformSDK/YiXinSDK/*.h"
        end

        # Facebook
        sp.subspec 'Facebook' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformSDK/FacebookMessengerSDK/FBSDKMessengerShareKit.framework','ShareSDK/Support/PlatformConnector/FacebookConnector.framework'
        end

        # Copy
        sp.subspec 'Copy' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/CopyConnector.framework'
        end

        # Evernote
        sp.subspec 'Evernote' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/EvernoteConnector.framework'
        end

        # GooglePlus
        sp.subspec 'GooglePlus' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/GooglePlusConnector.framework'
        end

        # Instagram
        sp.subspec 'Instagram' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/InstagramConnector.framework'
        end

        # Instapaper
        sp.subspec 'Instapaper' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/InstapaperConnector.framework'
        end

        # Line
        sp.subspec 'Line' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/LineConnector.framework'
        end

        # Mail
        sp.subspec 'Mail' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/MailConnector.framework'
        end

        # SMS
        sp.subspec 'SMS' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/SMSConnector.framework'
        end

        # WhatsApp
        sp.subspec 'WhatsApp' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/WhatsAppConnector.framework'
        end
    end

    # ShareSDK 配置文件模块
    s.subspec 'ShareSDKConfigurationFile' do |sp|
        sp.vendored_frameworks = 'ShareSDK/Support/Optional/ShareSDKConfigFile.framework'
        sp.resources = 'ShareSDK/Support/Optional/ShareSDKConfigFile.bundle'
    end
    
    # ShareSDK Extension扩展模块
    s.subspec 'ShareSDKExtension' do |sp|
        sp.vendored_frameworks = 'ShareSDK/Support/Optional/ShareSDKExtension.framework'
    end

    # 需要移除平台SDK的平台，可用PlatformConnector平台语句替换ShareSDKPlatforms的平台语句
    s.subspec 'PlatformConnector' do |sp|
        #sp.default_subspecs = 'QQ', 'SinaWeibo', 'WeChat', 'RenRen', 'AliPaySocial' - Errors: Can't set `default_subspecs` attribute for subspecs

        # QQ
        sp.subspec 'QQ' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/QQConnector.framework'
        end

        # SinaWeibo
        sp.subspec 'SinaWeibo' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/SinaWeiboConnector.framework'
        end

        # WeChat
        sp.subspec 'WeChat' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/WechatConnector.framework'
        end

        # RenRen
        sp.subspec 'RenRen' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/RenrenConnector.framework'
        end

        # 支付宝（AliPaySocial）
        sp.subspec 'AliPaySocial' do |ssp|
            ssp.vendored_frameworks = 'ShareSDK/Support/PlatformConnector/AliPayConnector.framework'
        end
    end

    # ShareSDK提供的UI
    s.subspec 'ShareSDKUI' do |sp|
        sp.vendored_frameworks = 'ShareSDK/Support/Optional/ShareSDKUI.framework'
        sp.resources = 'ShareSDK/Support/Optional/ShareSDKUI.bundle'
    end


end
