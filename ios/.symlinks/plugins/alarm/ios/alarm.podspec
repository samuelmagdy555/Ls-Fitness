#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint alarm.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'alarm'
  s.version          = '0.0.1'
  s.summary          = 'An alarm manager for iOS and Android.'
  s.description      = <<-DESC
An alarm manager for iOS and Android.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files     = 'ios/Classes/**/*.swift', 'ios/Classes/**/*.h', 'ios/Classes/**/*.m' # حدد الملفات المصدرية بشكل أكثر دقة
  s.resources        = 'ios/Assets/**/*' # تأكد من تحديد الملفات داخل مجلد Assets
  s.dependency       'Flutter'
  s.platform         = :ios, '13.0' # قم برفع الحد الأدنى من iOS إلى 11.0 لتجنب مشاكل التوافق
  s.module_name = 'alarm'
  s.static_framework = true


  # إعدادات لمعالجة مشكلة المحاكيات القديمة
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386'
  }
  s.swift_version    = '5.0'
end
