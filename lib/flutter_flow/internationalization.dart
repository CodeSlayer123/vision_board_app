import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi', 'ta', 'ur'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
    String? taText = '',
    String? urText = '',
  }) =>
      [enText, hiText, taText, urText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // login
  {
    'awn1ttmh': {
      'en': 'Enter your credentials to access your account.',
      'hi': 'स्वागत है, और नीचे अपने खाते तक पहुंचें।',
      'ta': 'வரவேற்கிறோம், கீழே உள்ள உங்கள் கணக்கை அணுகவும்.',
      'ur': 'خوش آمدید، اور نیچے اپنے اکاؤنٹ تک رسائی حاصل کریں۔',
    },
    '7coe115q': {
      'en': 'Sign In',
      'hi': 'साइन इन करें',
      'ta': 'உள்நுழையவும்',
      'ur': 'سائن ان',
    },
    'e9pnyzm9': {
      'en': '',
      'hi': 'ईमेल पता',
      'ta': 'மின்னஞ்சல் முகவரி',
      'ur': 'ای میل اڈریس',
    },
    'vuhwdlzn': {
      'en': 'Email Address',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'z0v8ougp': {
      'en': '',
      'hi': 'पासवर्ड',
      'ta': 'கடவுச்சொல்',
      'ur': 'پاس ورڈ',
    },
    '3mg9dzti': {
      'en': 'Password',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'd7zjcwes': {
      'en': 'Sign In',
      'hi': 'साइन इन करें',
      'ta': 'உள்நுழையவும்',
      'ur': 'سائن ان',
    },
    'hhgceptf': {
      'en': 'Forgot Password?',
      'hi': 'पासवर्ड भूल गए?',
      'ta': 'கடவுச்சொல்லை மறந்துவிட்டீர்களா?',
      'ur': 'پاسورڈ بھول گے؟',
    },
    'mnrqbvlk': {
      'en': 'Sign Up',
      'hi': 'साइन अप करें',
      'ta': 'பதிவு செய்யவும்',
      'ur': 'سائن اپ',
    },
    'ye7jjwdc': {
      'en': '',
      'hi': 'ईमेल पता',
      'ta': 'மின்னஞ்சல் முகவரி',
      'ur': 'ای میل اڈریس',
    },
    '4u8srye4': {
      'en': 'Email Address',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'y4q7638d': {
      'en': '',
      'hi': 'पासवर्ड',
      'ta': 'கடவுச்சொல்',
      'ur': 'پاس ورڈ',
    },
    '2b9s0vl5': {
      'en': 'Password',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'ffc8ingn': {
      'en': 'Create Account',
      'hi': 'खाता बनाएं',
      'ta': 'உங்கள் கணக்கை துவங்குங்கள்',
      'ur': 'اکاؤنٹ بنائیں',
    },
    'tazfclws': {
      'en': 'Field is required',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '64wzffab': {
      'en': 'Email address should be minimum 5 characters',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'anmgh4rt': {
      'en': 'email address is too long',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'niw2rp7x': {
      'en': 'Email seems to be invalid. Please check',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '0erhnun6': {
      'en': 'Field is required',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'mw32hvo4': {
      'en': 'Field is required',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'rklj8lg5': {
      'en': 'Field is required',
      'hi': '',
      'ta': '',
      'ur': '',
    },
  },
  // forgotPassword
  {
    's20e49ou': {
      'en': 'Back',
      'hi': 'पीछे',
      'ta': 'மீண்டும்',
      'ur': 'پیچھے',
    },
    '5slql49v': {
      'en': 'Back',
      'hi': 'पीछे',
      'ta': 'மீண்டும்',
      'ur': 'پیچھے',
    },
    'qgfcbi0c': {
      'en': 'Forgot Password',
      'hi': 'पासवर्ड भूल गए',
      'ta': 'கடவுச்சொல்லை மறந்துவிட்டீர்களா',
      'ur': 'پاسورڈ بھول گے',
    },
    'fjhybvst': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'hi':
          'हम आपको आपका पासवर्ड रीसेट करने के लिए एक लिंक के साथ एक ईमेल भेजेंगे, कृपया नीचे अपने खाते से संबद्ध ईमेल दर्ज करें।',
      'ta':
          'உங்கள் கடவுச்சொல்லை மீட்டமைக்க இணைப்புடன் கூடிய மின்னஞ்சலை உங்களுக்கு அனுப்புவோம், உங்கள் கணக்குடன் தொடர்புடைய மின்னஞ்சலை கீழே உள்ளிடவும்.',
      'ur':
          'ہم آپ کو اپنا پاس ورڈ دوبارہ ترتیب دینے کے لیے ایک لنک کے ساتھ ایک ای میل بھیجیں گے، براہ کرم نیچے اپنے اکاؤنٹ سے وابستہ ای میل درج کریں۔',
    },
    'ujc5xipx': {
      'en': '',
      'hi': 'आपका ईमेल पता...',
      'ta': 'உங்கள் மின்னஞ்சல் முகவரி...',
      'ur': 'آپ کا ای میل پتہ...',
    },
    'gegzfze4': {
      'en': 'Enter your email...',
      'hi': 'अपना ईमेल दर्ज करें...',
      'ta': 'மின்னஞ்சலை பதிவுசெய்...',
      'ur': 'اپنا ای میل درج کریں...',
    },
    '1njh17kf': {
      'en': 'Send Link',
      'hi': 'लिंक भेजें',
      'ta': 'இணைப்பை அனுப்பவும்',
      'ur': 'لنک بھیجیں۔',
    },
    '9a4bm91z': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // createProfile
  {
    'vyqdl7s3': {
      'en': 'Create Profile',
      'hi': 'प्रोफ़ाइल बनाने',
      'ta': 'சுயவிவரத்தை உருவாக்கவும்',
      'ur': 'پروفائل بنائیں',
    },
    'cnc5fmbk': {
      'en': 'Full Name',
      'hi': 'पूरा नाम',
      'ta': 'முழு பெயர்',
      'ur': 'پورا نام',
    },
    'h398jj2j': {
      'en': 'Enter description here..',
      'hi': 'यहां विवरण दर्ज करें ..',
      'ta': 'விளக்கத்தை இங்கே உள்ளிடவும்..',
      'ur': 'یہاں تفصیل درج کریں..',
    },
    'v8ktyj0f': {
      'en': '(optional)',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '355g1zkk': {
      'en': 'Enter phone number here..',
      'hi': 'यहां विवरण दर्ज करें ..',
      'ta': 'விளக்கத்தை இங்கே உள்ளிடவும்..',
      'ur': 'یہاں تفصیل درج کریں..',
    },
    'r1fjugu6': {
      'en': 'Phone number will be visible to users within your community',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '7ve36dhv': {
      'en': 'Finish ',
      'hi': 'उपयोगकर्ता बनाएं और आमंत्रित करें',
      'ta': 'பயனரை உருவாக்கி அழைக்கவும்',
      'ur': 'صارف بنائیں اور مدعو کریں۔',
    },
    'nyguqlya': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    '8opg51gj': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'ht71rkhg': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'bxrlgb5p': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
  },
  // communityVisions
  {
    'j0lx26qq': {
      'en': 'Create Task',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'xe34smbh': {
      'en': 'My Tasks',
      'hi': 'मेरा काम',
      'ta': 'எனது பணிகள்',
      'ur': 'میرے کام',
    },
    '1rnio8vt': {
      'en': '(4)',
      'hi': '(4)',
      'ta': '(4)',
      'ur': '(4)',
    },
    'oopnhfx6': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'i2oud4oy': {
      'en': 'Issue #242952592',
      'hi': 'अंक #242952592',
      'ta': 'வெளியீடு #242952592',
      'ur': 'شمارہ نمبر 242952592',
    },
    '6z27sxtu': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    'kvvayf1a': {
      'en': 'Andres Reynolds',
      'hi': 'एंड्रेस रेनॉल्ड्स',
      'ta': 'ஆண்ட்ரெஸ் ரெனால்ட்ஸ்',
      'ur': 'اینڈریس رینالڈز',
    },
    'y2umcbi9': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'ut18klg9': {
      'en': 'Tuesday, 10:00am',
      'hi': 'मंगलवार, सुबह 10:00 बजे',
      'ta': 'செவ்வாய், காலை 10:00 மணி',
      'ur': 'منگل، صبح 10:00 بجے',
    },
    'rktf6kep': {
      'en': 'Not Started',
      'hi': 'शुरू नहीं',
      'ta': 'துவங்கவில்லை',
      'ur': 'شروع نہیں کیا',
    },
    'mpiabjfr': {
      'en': 'Start',
      'hi': 'शुरू',
      'ta': 'தொடங்கு',
      'ur': 'شروع کریں۔',
    },
    'i1j0llq5': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    '89oepmke': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    'b8974iek': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'vpfyakh9': {
      'en': 'Issue #242952592',
      'hi': 'अंक #242952592',
      'ta': 'வெளியீடு #242952592',
      'ur': 'شمارہ نمبر 242952592',
    },
    '2jc6nxa6': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    'z98yqioc': {
      'en': 'Andres Reynolds',
      'hi': 'एंड्रेस रेनॉल्ड्स',
      'ta': 'ஆண்ட்ரெஸ் ரெனால்ட்ஸ்',
      'ur': 'اینڈریس رینالڈز',
    },
    '6c511ygf': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'z9zv51n7': {
      'en': 'Tuesday, 10:00am',
      'hi': 'मंगलवार, सुबह 10:00 बजे',
      'ta': 'செவ்வாய், காலை 10:00 மணி',
      'ur': 'منگل، صبح 10:00 بجے',
    },
    '310ik08p': {
      'en': 'Completed',
      'hi': 'पूरा हुआ',
      'ta': 'நிறைவு',
      'ur': 'مکمل',
    },
    '6mv3j0ec': {
      'en': 'Tracker',
      'hi': 'ट्रैकर',
      'ta': 'டிராக்கர்',
      'ur': 'ٹریکر',
    },
  },
  // createTask_1_SelectProject
  {
    '1evyvanx': {
      'en': 'Create Task',
      'hi': 'टास्क बनाएं',
      'ta': 'பணியை உருவாக்கவும்',
      'ur': 'ٹاسک بنائیں',
    },
    '5p3w7kqb': {
      'en': 'Don\'t see your project? Add one here.',
      'hi': 'आपका प्रोजेक्ट नहीं दिख रहा है? यहां एक जोड़ें।',
      'ta': 'உங்கள் திட்டம் பார்க்கவில்லையா? ஒன்றை இங்கே சேர்க்கவும்.',
      'ur': 'آپ کا پروجیکٹ نظر نہیں آرہا؟ یہاں ایک شامل کریں۔',
    },
    'atun5agk': {
      'en': 'Add Project',
      'hi': 'प्रोजेक्ट जोड़ें',
      'ta': 'திட்டத்தைச் சேர்க்கவும்',
      'ur': 'پروجیکٹ شامل کریں۔',
    },
    'nb0qs3fd': {
      'en': 'Last edited:',
      'hi': 'पिछली बार संपादित:',
      'ta': 'கடைசியாக திருத்தப்பட்டது:',
      'ur': 'آخری ترمیم:',
    },
    'h0y2vck1': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'ry8gdxku': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'xtzbonrg': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'd3cize38': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
  },
  // createTask
  {
    '5maeu8hf': {
      'en': 'Create Task',
      'hi': 'टास्क बनाएं',
      'ta': 'பணியை உருவாக்கவும்',
      'ur': 'ٹاسک بنائیں',
    },
    '1muhlu3r': {
      'en': 'Task Name',
      'hi': 'कार्य का नाम',
      'ta': 'பணி பெயர்',
      'ur': 'ٹاسک کا نام',
    },
    'ihqd9vyk': {
      'en': 'Enter description here...',
      'hi': 'यहां विवरण दर्ज करें...',
      'ta': 'விளக்கத்தை இங்கே உள்ளிடவும்...',
      'ur': 'یہاں تفصیل درج کریں...',
    },
    '8sub26sn': {
      'en': 'Not Started',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '64eji80x': {
      'en': 'Not Started',
      'hi': 'शुरू नहीं',
      'ta': 'துவங்கவில்லை',
      'ur': 'شروع نہیں کیا',
    },
    'jvpqwpy3': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    'x2qb0j22': {
      'en': 'Select Status',
      'hi': 'स्थिति का चयन करें',
      'ta': 'நிலையைத் தேர்ந்தெடுக்கவும்',
      'ur': 'اسٹیٹس کو منتخب کریں۔',
    },
    'y163v19q': {
      'en': 'Create Task',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '3nx43hj1': {
      'en': 'Please add a task name.',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'tjxg3net': {
      'en': 'Please enter at least 3 letters.',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '3khebw6t': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '45sp2bki': {
      'en': 'Field is required',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'cm4f3q0t': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'ta': '',
      'ur': '',
    },
  },
  // taskDetails
  {
    'hb364kq4': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'q4ikqgkd': {
      'en': 'Team Members',
      'hi': 'टीम के सदस्य',
      'ta': 'குழு உறுப்பினர்கள்',
      'ur': 'ٹیم کے افراد',
    },
    'qrkfqya2': {
      'en': 'Notes & Activity',
      'hi': 'टिप्पणियाँ',
      'ta': 'குறிப்புகள்',
      'ur': 'نوٹس',
    },
    '46h6mjof': {
      'en': 'Mark as Complete',
      'hi': 'पूर्ण के रूप में चिह्नित करें',
      'ta': 'முழுமையானதாகக் குறிக்கவும்',
      'ur': 'مکمل کے بطور نشان زد کریں۔',
    },
    'xvvip759': {
      'en': 'Begin Task',
      'hi': 'कार्य शुरू करें',
      'ta': 'பணியைத் தொடங்குங்கள்',
      'ur': 'کام شروع کریں۔',
    },
    'q5i02gt3': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // addTeamMembers
  {
    'dzbojo7r': {
      'en': 'Invite User',
      'hi': 'उपयोगकर्ता को आमंत्रित करें',
      'ta': 'பயனரை அழைக்கவும்',
      'ur': 'صارف کو مدعو کریں۔',
    },
    '5ilq7vbh': {
      'en': 'Full Name',
      'hi': 'पूरा नाम',
      'ta': 'முழு பெயர்',
      'ur': 'پورا نام',
    },
    '733r7kk8': {
      'en': 'Email',
      'hi': 'ईमेल',
      'ta': 'மின்னஞ்சல்',
      'ur': 'ای میل',
    },
    '64z5ta3b': {
      'en': 'Title or Role',
      'hi': 'शीर्षक या भूमिका',
      'ta': 'தலைப்பு அல்லது பாத்திரம்',
      'ur': 'عنوان یا کردار',
    },
    '39qfddvg': {
      'en': 'Team 1',
      'hi': 'टीम 1',
      'ta': 'அணி 1',
      'ur': 'ٹیم 1',
    },
    '0rrub9lg': {
      'en': 'Team 2',
      'hi': 'टीम 2',
      'ta': 'அணி 2',
      'ur': 'ٹیم 2',
    },
    '23fglgb8': {
      'en': 'Team 3',
      'hi': 'टीम 3',
      'ta': 'அணி 3',
      'ur': 'ٹیم 3',
    },
    'd6ul4ero': {
      'en': 'Select Team',
      'hi': 'टीम का चयन',
      'ta': 'குழுவைத் தேர்ந்தெடுக்கவும்',
      'ur': 'ٹیم منتخب کریں۔',
    },
    'oehnkpb9': {
      'en': 'Enter description here..',
      'hi': 'यहां विवरण दर्ज करें ..',
      'ta': 'விளக்கத்தை இங்கே உள்ளிடவும்..',
      'ur': 'یہاں تفصیل درج کریں..',
    },
    'c38hkcs1': {
      'en': 'Create & Invite User',
      'hi': 'उपयोगकर्ता बनाएं और आमंत्रित करें',
      'ta': 'பயனரை உருவாக்கி அழைக்கவும்',
      'ur': 'صارف بنائیں اور مدعو کریں۔',
    },
    '41umybiv': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'i5wagnfq': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'h5euxn0m': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'ag9dglwf': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
  },
  // teamMemberDetails
  {
    'ukmpqe9t': {
      'en': 'Team Name',
      'hi': 'टीम का नाम',
      'ta': 'குழு பெயர்',
      'ur': 'گروہ کا نام',
    },
    'rq31lxfx': {
      'en': ' - ',
      'hi': '-',
      'ta': '-',
      'ur': '-',
    },
    '8lhfh12w': {
      'en': '12 Tasks',
      'hi': '12 कार्य',
      'ta': '12 பணிகள்',
      'ur': '12 کام',
    },
    'j2ieipip': {
      'en': 'Team Bio',
      'hi': 'टीम बायो',
      'ta': 'டீம் பயோ',
      'ur': 'ٹیم بائیو',
    },
    '9s048496': {
      'en': 'Tasks',
      'hi': 'कार्य',
      'ta': 'பணிகள்',
      'ur': 'کام',
    },
    '3rwjcoju': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'znm2flgb': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // Main_projects
  {
    '3drc3684': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // projectDetailsPage
  {
    'o8jt5s5k': {
      'en': 'View new page',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'vdyl48dm': {
      'en': 'Completed Tasks',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'f24x8bkt': {
      'en': 'Number of Tasks',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '8i8307mb': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    'mfp5v5yt': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'x63goi6j': {
      'en': 'Issue #242952592',
      'hi': 'अंक #242952592',
      'ta': 'வெளியீடு #242952592',
      'ur': 'شمارہ نمبر 242952592',
    },
    '3ihf4pre': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    'frnfsszo': {
      'en': 'Andres Reynolds',
      'hi': 'एंड्रेस रेनॉल्ड्स',
      'ta': 'ஆண்ட்ரெஸ் ரெனால்ட்ஸ்',
      'ur': 'اینڈریس رینالڈز',
    },
    'sg458n0n': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    '6hgcr887': {
      'en': 'Tuesday, 10:00am',
      'hi': 'मंगलवार, सुबह 10:00 बजे',
      'ta': 'செவ்வாய், காலை 10:00 மணி',
      'ur': 'منگل، صبح 10:00 بجے',
    },
    '1870f5uq': {
      'en': 'Completed',
      'hi': 'पूरा हुआ',
      'ta': 'நிறைவு',
      'ur': 'مکمل',
    },
    'xo4dmszc': {
      'en': 'Complete',
      'hi': 'पूरा',
      'ta': 'முழுமை',
      'ur': 'مکمل',
    },
    '24rs6kdw': {
      'en': 'Completed on',
      'hi': 'पर पूर्ण',
      'ta': 'அன்று நிறைவடைந்தது',
      'ur': 'پر مکمل ہوا۔',
    },
    '4cmr54lc': {
      'en': 'Activity',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'alg6xfua': {
      'en': 'Current Time',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'zj029l6a': {
      'en': 'Description',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'k3eagrk1': {
      'en': 'Tab View 4',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'y1upl145': {
      'en': 'Back',
      'hi': 'पीछे',
      'ta': 'மீண்டும்',
      'ur': 'پیچھے',
    },
    '5kom1132': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // myVisions
  {
    'qcd4z131': {
      'en': 'My Visions',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '0e5jbrkh': {
      'en': 'A list of your visions below.',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '5mru78lw': {
      'en': 'Create Project',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '1wa31x2v': {
      'en': 'Short Term Visions',
      'hi': 'मेरा काम',
      'ta': 'எனது பணிகள்',
      'ur': 'میرے کام',
    },
    'ovd9n38h': {
      'en': 'There are no current short term visions!',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '3lrpxmwu': {
      'en': 'Long Term Visions',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    '1z3c1sdd': {
      'en': 'There are no current long term visions!',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '716yfim5': {
      'en': 'Complete',
      'hi': 'पूरा',
      'ta': 'முழுமை',
      'ur': 'مکمل',
    },
    '6vyvn2vc': {
      'en': 'No visions have been completed yet.\nKeep believing!',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'hmxr55qt': {
      'en': 'My Visions',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // myProfile
  {
    '5n51xmhd': {
      'en': 'Switch to Dark Mode',
      'hi': 'डार्क मोड में स्विच करें',
      'ta': 'டார்க் பயன்முறைக்கு மாறவும்',
      'ur': 'ڈارک موڈ پر سوئچ کریں۔',
    },
    'w3vpe9rl': {
      'en': 'Switch to Light Mode',
      'hi': 'लाइट मोड में स्विच करें',
      'ta': 'லைட் பயன்முறைக்கு மாறவும்',
      'ur': 'لائٹ موڈ پر سوئچ کریں۔',
    },
    '05v307ij': {
      'en': 'Account Settings',
      'hi': 'अकाउंट सेटिंग',
      'ta': 'கணக்கு அமைப்புகள்',
      'ur': 'اکاؤنٹ کی ترتیبات',
    },
    'o1pcrlaz': {
      'en': 'Change Password',
      'hi': 'पासवर्ड बदलें',
      'ta': 'கடவுச்சொல்லை மாற்று',
      'ur': 'پاس ورڈ تبدیل کریں',
    },
    'alhgf413': {
      'en': 'Edit Profile',
      'hi': 'प्रोफ़ाइल संपादित करें',
      'ta': 'சுயவிவரத்தைத் திருத்து',
      'ur': 'پروفائل میں ترمیم کریں',
    },
    '7ouresb2': {
      'en': 'Join a Community',
      'hi': 'प्रोफ़ाइल संपादित करें',
      'ta': 'சுயவிவரத்தைத் திருத்து',
      'ur': 'پروفائل میں ترمیم کریں',
    },
    'u59r6d23': {
      'en': 'Manage Community',
      'hi': 'प्रोफ़ाइल संपादित करें',
      'ta': 'சுயவிவரத்தைத் திருத்து',
      'ur': 'پروفائل میں ترمیم کریں',
    },
    'yy8g46gi': {
      'en': 'Create a Community',
      'hi': 'प्रोफ़ाइल संपादित करें',
      'ta': 'சுயவிவரத்தைத் திருத்து',
      'ur': 'پروفائل میں ترمیم کریں',
    },
    'w4vsr6hu': {
      'en': 'Log Out',
      'hi': 'लॉग आउट',
      'ta': 'வெளியேறு',
      'ur': 'لاگ آوٹ',
    },
    '2ue4y5b6': {
      'en': 'Delete Account',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '3e1n01mf': {
      'en': 'My Profile',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // manageCommunity
  {
    '5oskislx': {
      'en': 'Your Community\'s Invite Code:',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'amm128rv': {
      'en': 'Community Members',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'aww45eq8': {
      'en': 'Edit Community',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'lquzalhp': {
      'en': 'Community Name',
      'hi': 'पूरा नाम',
      'ta': 'முழு பெயர்',
      'ur': 'پورا نام',
    },
    'jk36wfto': {
      'en': 'Enter description here..',
      'hi': 'यहां विवरण दर्ज करें ..',
      'ta': 'விளக்கத்தை இங்கே உள்ளிடவும்..',
      'ur': 'یہاں تفصیل درج کریں..',
    },
    '3r8a3smr': {
      'en': 'Update Community',
      'hi': 'उपयोगकर्ता बनाएं और आमंत्रित करें',
      'ta': 'பயனரை உருவாக்கி அழைக்கவும்',
      'ur': 'صارف بنائیں اور مدعو کریں۔',
    },
    'h2tjjlou': {
      'en': 'My Team',
      'hi': 'मेरी टीम',
      'ta': 'என் அணி',
      'ur': 'میری ٹیم',
    },
  },
  // searchMembers
  {
    'i5eebch9': {
      'en': 'Add Members',
      'hi': 'सदस्य जोड़ें',
      'ta': 'உறுப்பினர்களைச் சேர்க்கவும்',
      'ur': 'ممبرز کو شامل کریں۔',
    },
    'p2un3aei': {
      'en': 'Search members...',
      'hi': 'सदस्यों को खोजें...',
      'ta': 'உறுப்பினர்களைத் தேடு...',
      'ur': 'اراکین کو تلاش کریں...',
    },
    'ux02ixql': {
      'en': 'Search Memebers',
      'hi': 'सदस्यों को खोजें',
      'ta': 'உறுப்பினர்களைத் தேடுங்கள்',
      'ur': 'ممبرز تلاش کریں۔',
    },
    'kmiq19hs': {
      'en': 'Assign',
      'hi': 'सौंपना',
      'ta': 'ஒதுக்க',
      'ur': 'تفویض',
    },
    'ag17xw1c': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // createProject
  {
    'zhq7wtzw': {
      'en': 'Create New Vision',
      'hi': 'प्रोजेक्ट बनाएं',
      'ta': 'திட்டத்தை உருவாக்கவும்',
      'ur': 'پروجیکٹ بنائیں',
    },
    '9duf9kbf': {
      'en': 'Project Name',
      'hi': 'परियोजना का नाम',
      'ta': 'திட்டத்தின் பெயர்',
      'ur': 'پراجیکٹ کا نام',
    },
    'j3scp78v': {
      'en': 'Enter description here...',
      'hi': 'यहां विवरण दर्ज करें...',
      'ta': 'விளக்கத்தை இங்கே உள்ளிடவும்...',
      'ur': 'یہاں تفصیل درج کریں...',
    },
    '7e67vfyv': {
      'en': 'Short Term',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'px9pfgvm': {
      'en': 'Long Term',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'hp50ejto': {
      'en': 'Short Term',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'jvswwvkt': {
      'en': 'Upload Image',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '8gollttg': {
      'en': 'Public',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '5z5b1zxp': {
      'en': 'All users in the same orginazation will be able to see',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'gql7sgl9': {
      'en': 'Create Vision',
      'hi': 'प्रोजेक्ट बनाएं',
      'ta': 'திட்டத்தை உருவாக்கவும்',
      'ur': 'پروجیکٹ بنائیں',
    },
    'cn7pslxf': {
      'en': 'Field is required',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'ep1avop3': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'qwgs42m5': {
      'en': 'Field is required',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'b56jfgss': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'ta': '',
      'ur': '',
    },
  },
  // editProfile
  {
    'evdej962': {
      'en': 'Change Photo',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    't7tz85hw': {
      'en': 'Your Name',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'p7ef0qd8': {
      'en': 'Title or Role',
      'hi': 'शीर्षक या भूमिका',
      'ta': 'தலைப்பு அல்லது பாத்திரம்',
      'ur': 'عنوان یا کردار',
    },
    'br3jvobf': {
      'en': 'Your bio',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '5vmz78yy': {
      'en': 'Email associated with this account:',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '4cj4t3x4': {
      'en': 'Save Changes',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'pt9elxe4': {
      'en': 'Edit Profile',
      'hi': '',
      'ta': '',
      'ur': '',
    },
  },
  // teamMembers
  {
    'cr7ls6ar': {
      'en': 'Add Members',
      'hi': 'सदस्य जोड़ें',
      'ta': 'உறுப்பினர்களைச் சேர்க்கவும்',
      'ur': 'ممبرز کو شامل کریں۔',
    },
    'gxfshi24': {
      'en': 'Members in Project',
      'hi': 'परियोजना में सदस्य',
      'ta': 'திட்டத்தில் உறுப்பினர்கள்',
      'ur': 'پروجیکٹ میں ممبران',
    },
    'prexm7ph': {
      'en': 'Remove',
      'hi': 'हटाना',
      'ta': 'அகற்று',
      'ur': 'دور',
    },
    'gjanmvum': {
      'en': 'UserName',
      'hi': 'उपयोगकर्ता नाम',
      'ta': 'பயனர்பெயர்',
      'ur': 'صارف کا نام',
    },
    '8dw4hlie': {
      'en': 'Remove',
      'hi': 'हटाना',
      'ta': 'அகற்று',
      'ur': 'دور',
    },
    'eq219wh6': {
      'en': 'UserName',
      'hi': 'उपयोगकर्ता नाम',
      'ta': 'பயனர்பெயர்',
      'ur': 'صارف کا نام',
    },
    'cjsbj4wg': {
      'en': 'Remove',
      'hi': 'हटाना',
      'ta': 'அகற்று',
      'ur': 'دور',
    },
    '78fdfkdh': {
      'en': 'Add Members',
      'hi': 'सदस्य जोड़ें',
      'ta': 'உறுப்பினர்களைச் சேர்க்கவும்',
      'ur': 'ممبرز کو شامل کریں۔',
    },
    'rzrf0zsp': {
      'en': 'Assign',
      'hi': 'सौंपना',
      'ta': 'ஒதுக்க',
      'ur': 'تفویض',
    },
    'aygq6hhd': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    '70d3gp3g': {
      'en': 'View',
      'hi': 'राय',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    'i5shsgmr': {
      'en': 'Username',
      'hi': 'उपयोगकर्ता नाम',
      'ta': 'பயனர் பெயர்',
      'ur': 'صارف نام',
    },
    '5uym93b4': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    '8ohfceuq': {
      'en': 'View',
      'hi': 'राय',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    'cf2slli6': {
      'en': 'Username',
      'hi': 'उपयोगकर्ता नाम',
      'ta': 'பயனர் பெயர்',
      'ur': 'صارف نام',
    },
    'dcpf109l': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    'ntjxiluh': {
      'en': 'View',
      'hi': 'राय',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    '70m6fdii': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    'vlair7ur': {
      'en': 'View',
      'hi': 'राय',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    '76xe81xi': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // editProject
  {
    '7wmlszlo': {
      'en': 'Edit Vision',
      'hi': 'प्रोजेक्ट बनाएं',
      'ta': 'திட்டத்தை உருவாக்கவும்',
      'ur': 'پروجیکٹ بنائیں',
    },
    'wwzsnwbn': {
      'en': 'Project Name',
      'hi': 'परियोजना का नाम',
      'ta': 'திட்டத்தின் பெயர்',
      'ur': 'پراجیکٹ کا نام',
    },
    'hyz5515g': {
      'en': 'Enter description here...',
      'hi': 'यहां विवरण दर्ज करें...',
      'ta': 'விளக்கத்தை இங்கே உள்ளிடவும்...',
      'ur': 'یہاں تفصیل درج کریں...',
    },
    'g3bz8qvx': {
      'en': 'Short Term',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'bolc4e4p': {
      'en': 'Long Term',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'nyhwsjue': {
      'en': 'Replace Image',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'ss2lio2l': {
      'en': 'Public',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'xtrwpp4c': {
      'en': 'All users in the same orginazation will be able to see',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '57dpf0bb': {
      'en': 'Save Changes',
      'hi': 'प्रोजेक्ट बनाएं',
      'ta': 'திட்டத்தை உருவாக்கவும்',
      'ur': 'پروجیکٹ بنائیں',
    },
    '3uigqoh0': {
      'en': 'Delete Project',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'lp17x1az': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'ly4njc2q': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'wqm2ux47': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'cgdvh4bx': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
  },
  // Main_trackerCopy
  {
    'f6oj7ixf': {
      'en': 'Good morning',
      'hi': 'सुबह बख़ैर',
      'ta': 'காலை வணக்கம்',
      'ur': 'صبح بخیر',
    },
    '2l584oky': {
      'en': 'Create Task',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '0czvp5si': {
      'en': 'My Visions',
      'hi': 'मेरा काम',
      'ta': 'எனது பணிகள்',
      'ur': 'میرے کام',
    },
    '7tyl60ti': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'cdbxmszf': {
      'en': 'Issue #242952592',
      'hi': 'अंक #242952592',
      'ta': 'வெளியீடு #242952592',
      'ur': 'شمارہ نمبر 242952592',
    },
    'aqkfwcmu': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    'vwxy69j9': {
      'en': 'Andres Reynolds',
      'hi': 'एंड्रेस रेनॉल्ड्स',
      'ta': 'ஆண்ட்ரெஸ் ரெனால்ட்ஸ்',
      'ur': 'اینڈریس رینالڈز',
    },
    '371a3st2': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'qererb8t': {
      'en': 'Tuesday, 10:00am',
      'hi': 'मंगलवार, सुबह 10:00 बजे',
      'ta': 'செவ்வாய், காலை 10:00 மணி',
      'ur': 'منگل، صبح 10:00 بجے',
    },
    '7pt4e1ub': {
      'en': 'Not Started',
      'hi': 'शुरू नहीं',
      'ta': 'துவங்கவில்லை',
      'ur': 'شروع نہیں کیا',
    },
    'rk16dnad': {
      'en': 'Start',
      'hi': 'शुरू',
      'ta': 'தொடங்கு',
      'ur': 'شروع کریں۔',
    },
    'sqcu7kev': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'hnk7jipz': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    '0lymfes4': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'iznpp31t': {
      'en': 'Issue #242952592',
      'hi': 'अंक #242952592',
      'ta': 'வெளியீடு #242952592',
      'ur': 'شمارہ نمبر 242952592',
    },
    'eq2hipwn': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    'r4njw8dy': {
      'en': 'Andres Reynolds',
      'hi': 'एंड्रेस रेनॉल्ड्स',
      'ta': 'ஆண்ட்ரெஸ் ரெனால்ட்ஸ்',
      'ur': 'اینڈریس رینالڈز',
    },
    'qkzoko9h': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'vvr6brlu': {
      'en': 'Tuesday, 10:00am',
      'hi': 'मंगलवार, सुबह 10:00 बजे',
      'ta': 'செவ்வாய், காலை 10:00 மணி',
      'ur': 'منگل، صبح 10:00 بجے',
    },
    '3p9m1j93': {
      'en': 'Complete',
      'hi': 'पूरा',
      'ta': 'முழுமை',
      'ur': 'مکمل',
    },
    'q2i2dd70': {
      'en': 'Complete',
      'hi': 'पूरा',
      'ta': 'முழுமை',
      'ur': 'مکمل',
    },
    'try0lyi6': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'uhn1o5bd': {
      'en': 'My Tasks',
      'hi': 'मेरा काम',
      'ta': 'எனது பணிகள்',
      'ur': 'میرے کام',
    },
    'ztnhe7w7': {
      'en': '(4)',
      'hi': '(4)',
      'ta': '(4)',
      'ur': '(4)',
    },
    'hbuhft5y': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'dab57eut': {
      'en': 'Issue #242952592',
      'hi': 'अंक #242952592',
      'ta': 'வெளியீடு #242952592',
      'ur': 'شمارہ نمبر 242952592',
    },
    'ftwh2fmh': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    'ph8ao6xj': {
      'en': 'Andres Reynolds',
      'hi': 'एंड्रेस रेनॉल्ड्स',
      'ta': 'ஆண்ட்ரெஸ் ரெனால்ட்ஸ்',
      'ur': 'اینڈریس رینالڈز',
    },
    'b9wi4zha': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    '7l09lvo8': {
      'en': 'Tuesday, 10:00am',
      'hi': 'मंगलवार, सुबह 10:00 बजे',
      'ta': 'செவ்வாய், காலை 10:00 மணி',
      'ur': 'منگل، صبح 10:00 بجے',
    },
    'obkd20qd': {
      'en': 'Not Started',
      'hi': 'शुरू नहीं',
      'ta': 'துவங்கவில்லை',
      'ur': 'شروع نہیں کیا',
    },
    'nswscwyu': {
      'en': 'Start',
      'hi': 'शुरू',
      'ta': 'தொடங்கு',
      'ur': 'شروع کریں۔',
    },
    'kdigl92d': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'is001plx': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    '2my7sg8t': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'nrguvcdb': {
      'en': 'Issue #242952592',
      'hi': 'अंक #242952592',
      'ta': 'வெளியீடு #242952592',
      'ur': 'شمارہ نمبر 242952592',
    },
    '2rib3h9c': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    'yb8qfbgv': {
      'en': 'Andres Reynolds',
      'hi': 'एंड्रेस रेनॉल्ड्स',
      'ta': 'ஆண்ட்ரெஸ் ரெனால்ட்ஸ்',
      'ur': 'اینڈریس رینالڈز',
    },
    'dbcu5ggs': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'vvca1cwz': {
      'en': 'Tuesday, 10:00am',
      'hi': 'मंगलवार, सुबह 10:00 बजे',
      'ta': 'செவ்வாய், காலை 10:00 மணி',
      'ur': 'منگل، صبح 10:00 بجے',
    },
    'qulf1pne': {
      'en': 'Completed',
      'hi': 'पूरा हुआ',
      'ta': 'நிறைவு',
      'ur': 'مکمل',
    },
    '6kv2opw8': {
      'en': 'Tracker',
      'hi': 'ट्रैकर',
      'ta': 'டிராக்கர்',
      'ur': 'ٹریکر',
    },
  },
  // createTaskCopy
  {
    'vuhf13y6': {
      'en': 'Create Task',
      'hi': 'टास्क बनाएं',
      'ta': 'பணியை உருவாக்கவும்',
      'ur': 'ٹاسک بنائیں',
    },
    'z1sf539i': {
      'en': 'Task Name',
      'hi': 'कार्य का नाम',
      'ta': 'பணி பெயர்',
      'ur': 'ٹاسک کا نام',
    },
    'jgriuvd4': {
      'en': 'Enter description here...',
      'hi': 'यहां विवरण दर्ज करें...',
      'ta': 'விளக்கத்தை இங்கே உள்ளிடவும்...',
      'ur': 'یہاں تفصیل درج کریں...',
    },
    'h5csmfsi': {
      'en': 'Not Started',
      'hi': 'शुरू नहीं',
      'ta': 'துவங்கவில்லை',
      'ur': 'شروع نہیں کیا',
    },
    '8g4j31mk': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    'm9oyu25u': {
      'en': 'Complete',
      'hi': 'पूरा',
      'ta': 'முழுமை',
      'ur': 'مکمل',
    },
    'lg7uvaqy': {
      'en': 'Select Status',
      'hi': 'स्थिति का चयन करें',
      'ta': 'நிலையைத் தேர்ந்தெடுக்கவும்',
      'ur': 'اسٹیٹس کو منتخب کریں۔',
    },
    '4uansphz': {
      'en': 'Create Task',
      'hi': 'टास्क बनाएं',
      'ta': 'பணியை உருவாக்கவும்',
      'ur': 'ٹاسک بنائیں',
    },
    'qto9ew3w': {
      'en': 'Please add a task name.',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'h9ud8wev': {
      'en': 'Please enter at least 3 letters.',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'w414xzy6': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'olbau8si': {
      'en': 'Field is required',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '7sbykxjy': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'ta': '',
      'ur': '',
    },
  },
  // newCreateTask
  {
    'idaxwtfb': {
      'en': 'Create Task',
      'hi': 'टास्क बनाएं',
      'ta': 'பணியை உருவாக்கவும்',
      'ur': 'ٹاسک بنائیں',
    },
    'x7z2ov2p': {
      'en': 'Task Name',
      'hi': 'कार्य का नाम',
      'ta': 'பணி பெயர்',
      'ur': 'ٹاسک کا نام',
    },
    '37xb9x2t': {
      'en': 'Enter description here...',
      'hi': 'यहां विवरण दर्ज करें...',
      'ta': 'விளக்கத்தை இங்கே உள்ளிடவும்...',
      'ur': 'یہاں تفصیل درج کریں...',
    },
    'awaf4zai': {
      'en': 'Not Started',
      'hi': 'शुरू नहीं',
      'ta': 'துவங்கவில்லை',
      'ur': 'شروع نہیں کیا',
    },
    'ucbtbwso': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    'wwy89s4g': {
      'en': 'Complete',
      'hi': 'पूरा',
      'ta': 'முழுமை',
      'ur': 'مکمل',
    },
    'aykiv7b4': {
      'en': 'Select Status',
      'hi': 'स्थिति का चयन करें',
      'ta': 'நிலையைத் தேர்ந்தெடுக்கவும்',
      'ur': 'اسٹیٹس کو منتخب کریں۔',
    },
    'tkkaxo3p': {
      'en': 'Create Task',
      'hi': 'टास्क बनाएं',
      'ta': 'பணியை உருவாக்கவும்',
      'ur': 'ٹاسک بنائیں',
    },
    'byag3lmv': {
      'en': 'Please add a task name.',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'afrz3dzo': {
      'en': 'Please enter at least 3 letters.',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '6wg40gco': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'p6zxypwb': {
      'en': 'Field is required',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'gcddh1bv': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'ta': '',
      'ur': '',
    },
  },
  // Main_projectsWebCopy
  {
    '6t1370a0': {
      'en': 'Projects',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    's2bqgujy': {
      'en': 'A list of your projects below.',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'nfgytggr': {
      'en': 'Create Project',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'xnyj1ksc': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // test
  {
    '7teaxelb': {
      'en': 'Page Title',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'uvqd315t': {
      'en': '<-',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'r9zkzajt': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    '3ecxikt1': {
      'en': 'Home',
      'hi': '',
      'ta': '',
      'ur': '',
    },
  },
  // createProfileCopy
  {
    'hr2s9lir': {
      'en': 'Create Profile',
      'hi': 'प्रोफ़ाइल बनाने',
      'ta': 'சுயவிவரத்தை உருவாக்கவும்',
      'ur': 'پروفائل بنائیں',
    },
    'q68pcvxq': {
      'en': 'Full Name',
      'hi': 'पूरा नाम',
      'ta': 'முழு பெயர்',
      'ur': 'پورا نام',
    },
    'xibst6mw': {
      'en': 'Title or Role',
      'hi': 'शीर्षक या भूमिका',
      'ta': 'தலைப்பு அல்லது பாத்திரம்',
      'ur': 'عنوان یا کردار',
    },
    '4puuz2hs': {
      'en': 'Enter description here..',
      'hi': 'यहां विवरण दर्ज करें ..',
      'ta': 'விளக்கத்தை இங்கே உள்ளிடவும்..',
      'ur': 'یہاں تفصیل درج کریں..',
    },
    'r9k2h37q': {
      'en': '[Some hint text...]',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '0c1m7p9c': {
      'en': 'Email',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '95yy6t0e': {
      'en': 'Create User',
      'hi': 'उपयोगकर्ता बनाएं और आमंत्रित करें',
      'ta': 'பயனரை உருவாக்கி அழைக்கவும்',
      'ur': 'صارف بنائیں اور مدعو کریں۔',
    },
    '9wkly78f': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'sgcpg0lo': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'gmwh6oll': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    '21bsqisg': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
  },
  // editProfileCopy
  {
    'fp13e54f': {
      'en': 'Your Name',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '4q6dkqdt': {
      'en': 'Title or Role',
      'hi': 'शीर्षक या भूमिका',
      'ta': 'தலைப்பு அல்லது பாத்திரம்',
      'ur': 'عنوان یا کردار',
    },
    'viqvflc7': {
      'en': 'Your bio',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'kymwb2s8': {
      'en': 'Email associated with this account:',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'u3y991tu': {
      'en': '[Some hint text...]',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'dwuuzgt0': {
      'en': '[Email]',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'rnsprm22': {
      'en': 'Save Changes',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '3fhrg0e9': {
      'en': 'Edit Profile',
      'hi': '',
      'ta': '',
      'ur': '',
    },
  },
  // test2
  {
    '434nymb2': {
      'en': 'Page Title',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '1yktyjpl': {
      'en': 'No-Code Platform Design',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'owk2eith': {
      'en': '30%',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'ghtl7yue': {
      'en': 'Product Namge Goes Here',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'c4m05oh4': {
      'en': '\$24.00',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'lk2xktny': {
      'en': 'Product Name Goes Here',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '5ygo7a65': {
      'en': '\$24.00',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'bsjwcgbf': {
      'en': 'Home',
      'hi': '',
      'ta': '',
      'ur': '',
    },
  },
  // projectDetailsPageCopy
  {
    '32bz2o5g': {
      'en': 'View All',
      'hi': 'सभी को देखें',
      'ta': 'அனைத்தையும் காட்டு',
      'ur': 'سب دیکھیں',
    },
    'udxwfqhd': {
      'en': 'Completed Tasks',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'scrm1tgf': {
      'en': 'Number of Tasks',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'cts1t6kx': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    'zl46f75g': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    '46ffewef': {
      'en': 'Issue #242952592',
      'hi': 'अंक #242952592',
      'ta': 'வெளியீடு #242952592',
      'ur': 'شمارہ نمبر 242952592',
    },
    'bbq6l6pn': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    '2x68nl5w': {
      'en': 'Andres Reynolds',
      'hi': 'एंड्रेस रेनॉल्ड्स',
      'ta': 'ஆண்ட்ரெஸ் ரெனால்ட்ஸ்',
      'ur': 'اینڈریس رینالڈز',
    },
    'p1mr8duo': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'efa0drbl': {
      'en': 'Tuesday, 10:00am',
      'hi': 'मंगलवार, सुबह 10:00 बजे',
      'ta': 'செவ்வாய், காலை 10:00 மணி',
      'ur': 'منگل، صبح 10:00 بجے',
    },
    'x25pvucu': {
      'en': 'Completed',
      'hi': 'पूरा हुआ',
      'ta': 'நிறைவு',
      'ur': 'مکمل',
    },
    '2c71zf7m': {
      'en': 'Complete',
      'hi': 'पूरा',
      'ta': 'முழுமை',
      'ur': 'مکمل',
    },
    'p11hg4jg': {
      'en': 'Completed on',
      'hi': 'पर पूर्ण',
      'ta': 'அன்று நிறைவடைந்தது',
      'ur': 'پر مکمل ہوا۔',
    },
    '115z780p': {
      'en': 'Activity',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'py7gqq58': {
      'en': 'Current Time',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'o0yqbrto': {
      'en': 'Back',
      'hi': 'पीछे',
      'ta': 'மீண்டும்',
      'ur': 'پیچھے',
    },
    'awxnltd5': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // projectDetailsPage2a
  {
    'ixvld9x8': {
      'en': 'Completed Tasks',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'aw5psdmi': {
      'en': 'Number of Tasks',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'oifb7p3f': {
      'en': 'Project',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'enoj0w2c': {
      'en': 'Tasks',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '3mjtxnss': {
      'en': 'No tasks have been added yet!',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'h7ggih6b': {
      'en': 'Gallery',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '8a9dewam': {
      'en': 'Upload Image',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'ft5hp68z': {
      'en': 'Activity',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'xrroh2fw': {
      'en': 'Current Time',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'ku70mr3f': {
      'en': 'Back',
      'hi': 'पीछे',
      'ta': 'மீண்டும்',
      'ur': 'پیچھے',
    },
    'qy3p8652': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // VisionBoardPage1aCopy
  {
    'jggnnae5': {
      'en': 'My Visions',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'z7rodedd': {
      'en': 'A list of your visions below.',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'vmgvp7id': {
      'en': 'Go to test page',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'f824gi53': {
      'en': 'Create Project',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'fsiv93s3': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // taskDetailsCopy
  {
    '0450pzxe': {
      'en': 'Task Description',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'sesdftme': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // createProjectCopy2
  {
    '6ee4iies': {
      'en': 'Create New Vision',
      'hi': 'प्रोजेक्ट बनाएं',
      'ta': 'திட்டத்தை உருவாக்கவும்',
      'ur': 'پروجیکٹ بنائیں',
    },
    'lk94hqti': {
      'en': 'Project Name',
      'hi': 'परियोजना का नाम',
      'ta': 'திட்டத்தின் பெயர்',
      'ur': 'پراجیکٹ کا نام',
    },
    'e7mz6d6s': {
      'en': 'Enter description here...',
      'hi': 'यहां विवरण दर्ज करें...',
      'ta': 'விளக்கத்தை இங்கே உள்ளிடவும்...',
      'ur': 'یہاں تفصیل درج کریں...',
    },
    '2shsjo8i': {
      'en': 'Upload Image',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'y00n24dm': {
      'en': 'Create Vision',
      'hi': 'प्रोजेक्ट बनाएं',
      'ta': 'திட்டத்தை உருவாக்கவும்',
      'ur': 'پروجیکٹ بنائیں',
    },
    '0u66i0ti': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    '5lp3jcde': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'wh089xlk': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    '1fsfl8so': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
  },
  // test3
  {
    'x715c1ae': {
      'en': 'Page Title',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '481l44s3': {
      'en': 'Home',
      'hi': '',
      'ta': '',
      'ur': '',
    },
  },
  // joinCommunity
  {
    'ii6jilsg': {
      'en': 'Communities',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'z535x32w': {
      'en': 'Share your dreams',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'rukg9ql2': {
      'en': 'Create Project',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'cnv152z4': {
      'en': 'Enter Community Code...',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'rxwqwp5c': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // createCommunity
  {
    'yb0nacko': {
      'en': 'Communities',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '0pkxuwj2': {
      'en': 'Create a Community!',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'pepw9oqn': {
      'en': 'Create Project',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'c5k1l5qp': {
      'en': 'Community Name',
      'hi': 'पूरा नाम',
      'ta': 'முழு பெயர்',
      'ur': 'پورا نام',
    },
    'l7nkmvu7': {
      'en': 'Create Community',
      'hi': 'उपयोगकर्ता बनाएं और आमंत्रित करें',
      'ta': 'பயனரை உருவாக்கி அழைக்கவும்',
      'ur': 'صارف بنائیں اور مدعو کریں۔',
    },
    'ahtzdyfh': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // communityPage
  {
    'v59i6qvm': {
      'en': 'Community Visions',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '8daglvaa': {
      'en': 'Help your community!',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'zpjgyrly': {
      'en': 'Leave Community',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'bge70j4y': {
      'en': 'Create Project',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    's4wbv7sv': {
      'en': 'Short Term ',
      'hi': 'मेरा काम',
      'ta': 'எனது பணிகள்',
      'ur': 'میرے کام',
    },
    'uzw9o5pn': {
      'en': 'Join a Community',
      'hi': 'प्रोफ़ाइल संपादित करें',
      'ta': 'சுயவிவரத்தைத் திருத்து',
      'ur': 'پروفائل میں ترمیم کریں',
    },
    'xrra6vyy': {
      'en': 'Long Term ',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    '0ewnf4w8': {
      'en': 'Join a Community',
      'hi': 'प्रोफ़ाइल संपादित करें',
      'ta': 'சுயவிவரத்தைத் திருத்து',
      'ur': 'پروفائل میں ترمیم کریں',
    },
    'q5tyzm78': {
      'en': 'Communities',
      'hi': '',
      'ta': '',
      'ur': '',
    },
  },
  // editTask
  {
    'm66spit2': {
      'en': 'Edit Task',
      'hi': 'टास्क बनाएं',
      'ta': 'பணியை உருவாக்கவும்',
      'ur': 'ٹاسک بنائیں',
    },
    'ogbflv9p': {
      'en': 'Task Name',
      'hi': 'कार्य का नाम',
      'ta': 'பணி பெயர்',
      'ur': 'ٹاسک کا نام',
    },
    'aehhl13l': {
      'en': 'Enter description here...',
      'hi': 'यहां विवरण दर्ज करें...',
      'ta': 'விளக்கத்தை இங்கே உள்ளிடவும்...',
      'ur': 'یہاں تفصیل درج کریں...',
    },
    'g0q8rwzs': {
      'en': 'Not Started',
      'hi': 'शुरू नहीं',
      'ta': 'துவங்கவில்லை',
      'ur': 'شروع نہیں کیا',
    },
    '28omy582': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    'vkbbjc1p': {
      'en': 'Select Status',
      'hi': 'स्थिति का चयन करें',
      'ta': 'நிலையைத் தேர்ந்தெடுக்கவும்',
      'ur': 'اسٹیٹس کو منتخب کریں۔',
    },
    'kz5d6cs9': {
      'en': 'Save Changes',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '8sqeuh1q': {
      'en': 'Delete Task',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'e7ajnfvf': {
      'en': 'Please add a task name.',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'sa3esvqe': {
      'en': 'Please enter at least 3 letters.',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'lw9iyvw9': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'eo9mxcxs': {
      'en': 'Field is required',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'la74geqb': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'ta': '',
      'ur': '',
    },
  },
  // finalizeCommunity
  {
    'ih03gsuw': {
      'en': 'Communities',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '51kgk86z': {
      'en': 'Describe your Community!',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '9to51v5z': {
      'en': 'Create Project',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'fmerf66g': {
      'en': 'Enter description here..',
      'hi': 'यहां विवरण दर्ज करें ..',
      'ta': 'விளக்கத்தை இங்கே உள்ளிடவும்..',
      'ur': 'یہاں تفصیل درج کریں..',
    },
    '5foogqqf': {
      'en': 'Your Community\'s Invite Code:',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '6vsli3bp': {
      'en': 'Create Community',
      'hi': 'उपयोगकर्ता बनाएं और आमंत्रित करें',
      'ta': 'பயனரை உருவாக்கி அழைக்கவும்',
      'ur': 'صارف بنائیں اور مدعو کریں۔',
    },
    'uy1vggon': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // Main_teamPageCopy
  {
    '3mu7tgy5': {
      'en': 'My Team',
      'hi': 'मेरी टीम',
      'ta': 'என் அணி',
      'ur': 'میری ٹیم',
    },
    'kdicgx9j': {
      'en': 'Find Members',
      'hi': 'सदस्य खोजें',
      'ta': 'உறுப்பினர்களைக் கண்டறியவும்',
      'ur': 'ممبرز تلاش کریں۔',
    },
    'es7kahnt': {
      'en': 'Search members...',
      'hi': 'सदस्यों को खोजें...',
      'ta': 'உறுப்பினர்களைத் தேடு...',
      'ur': 'اراکین کو تلاش کریں...',
    },
    'u91x7ftu': {
      'en': 'Community Members',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'c5fouh8u': {
      'en': 'Example 3',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'e93qcjp7': {
      'en': 'Tab View 3',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'llwa5ins': {
      'en': 'My Team',
      'hi': 'मेरी टीम',
      'ta': 'என் அணி',
      'ur': 'میری ٹیم',
    },
  },
  // viewTask
  {
    '0kcf0uzy': {
      'en': 'View Task',
      'hi': 'टास्क बनाएं',
      'ta': 'பணியை உருவாக்கவும்',
      'ur': 'ٹاسک بنائیں',
    },
    'p1vwqvkg': {
      'en': 'Task Name',
      'hi': 'कार्य का नाम',
      'ta': 'பணி பெயர்',
      'ur': 'ٹاسک کا نام',
    },
    'qxke6pw1': {
      'en': 'Enter description here...',
      'hi': 'यहां विवरण दर्ज करें...',
      'ta': 'விளக்கத்தை இங்கே உள்ளிடவும்...',
      'ur': 'یہاں تفصیل درج کریں...',
    },
    'fyqoxujs': {
      'en': 'Start Date:',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'qgliqwiw': {
      'en': 'Due Date:',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '18b4r6ay': {
      'en': 'Please add a task name.',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '5dw5u7n6': {
      'en': 'Please enter at least 3 letters.',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'tzuoa3eo': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'ntmourwc': {
      'en': 'Field is required',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'wzulirdl': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'ta': '',
      'ur': '',
    },
  },
  // myVisionsCopy
  {
    'itek3ndq': {
      'en': 'My Visions',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '3lywg6tv': {
      'en': 'A list of your visions below.',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '2qrb5uhw': {
      'en': 'Create Project',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'dqovebop': {
      'en': 'Short Term Visions',
      'hi': 'मेरा काम',
      'ta': 'எனது பணிகள்',
      'ur': 'میرے کام',
    },
    '64mlaxst': {
      'en': 'There are no current short term visions!',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '3feut3dg': {
      'en': 'Long Term Visions',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    '2zg87aas': {
      'en': 'There are no current long term visions!',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '2gyyf8be': {
      'en': 'Complete',
      'hi': 'पूरा',
      'ta': 'முழுமை',
      'ur': 'مکمل',
    },
    'xq49g02d': {
      'en': 'No visions have been completed yet. Keep believing!',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'nbgrxgzi': {
      'en': 'My Visions',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // joinCommunityStepTwo
  {
    'fe34c34v': {
      'en': 'Communities',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'ezlgd70x': {
      'en': 'Create Project',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'm0b1m3q3': {
      'en': 'None found!',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '589343fx': {
      'en': 'Join!',
      'hi': 'प्रोफ़ाइल संपादित करें',
      'ta': 'சுயவிவரத்தைத் திருத்து',
      'ur': 'پروفائل میں ترمیم کریں',
    },
    'qcywvxo1': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // viewUser
  {
    '4n9w3jv2': {
      'en': 'Message',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '2hd9brja': {
      'en': 'User Description',
      'hi': 'टीम बायो',
      'ta': 'டீம் பயோ',
      'ur': 'ٹیم بائیو',
    },
    'phoc7q62': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
      'ur': 'گھر',
    },
  },
  // drawerNav
  {
    'xnmol3vm': {
      'en': 'My Visions',
      'hi': 'मेरी प्रोफाइल',
      'ta': 'என் சுயவிவரம்',
      'ur': 'میری پروفائل',
    },
    'tgp9100p': {
      'en': 'My Communities',
      'hi': 'मेरी प्रोफाइल',
      'ta': 'என் சுயவிவரம்',
      'ur': 'میری پروفائل',
    },
    'gvsvhzns': {
      'en': 'My Profile',
      'hi': 'मेरी टीम',
      'ta': 'எனது அணிகள்',
      'ur': 'میری ٹیمیں',
    },
    '8czmkd58': {
      'en': 'Join a Community',
      'hi': 'प्रोफ़ाइल संपादित करें',
      'ta': 'சுயவிவரத்தைத் திருத்து',
      'ur': 'پروفائل میں ترمیم کریں',
    },
    'rqwbm1db': {
      'en': 'Manage Community',
      'hi': 'प्रोफ़ाइल संपादित करें',
      'ta': 'சுயவிவரத்தைத் திருத்து',
      'ur': 'پروفائل میں ترمیم کریں',
    },
    'ho48prvt': {
      'en': 'Create a Community',
      'hi': 'प्रोफ़ाइल संपादित करें',
      'ta': 'சுயவிவரத்தைத் திருத்து',
      'ur': 'پروفائل میں ترمیم کریں',
    },
    'of8ozb94': {
      'en': 'Log Out',
      'hi': 'लॉग आउट',
      'ta': 'வெளியேறு',
      'ur': 'لاگ آوٹ',
    },
  },
  // addTeam
  {
    'uap9xd08': {
      'en': 'Assign Member',
      'hi': 'सदस्य असाइन करें',
      'ta': 'உறுப்பினரை நியமிக்கவும்',
      'ur': 'ممبر تفویض کریں۔',
    },
    'v3df17c1': {
      'en': 'Find members by searching below to add them to this task.',
      'hi': 'नीचे खोज कर सदस्यों को खोजें',
      'ta': 'கீழே தேடுவதன் மூலம் உறுப்பினர்களைக் கண்டறியவும்',
      'ur': 'ذیل میں تلاش کرکے اراکین کو تلاش کریں۔',
    },
    '4gubn0rd': {
      'en': 'Search members...',
      'hi': 'सदस्यों को खोजें...',
      'ta': 'உறுப்பினர்களைத் தேடு...',
      'ur': 'اراکین کو تلاش کریں...',
    },
    'k3vvd9ha': {
      'en': 'Assign',
      'hi': 'सौंपना',
      'ta': 'ஒதுக்க',
      'ur': 'تفویض',
    },
    'gts4h2ob': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    '5fcmvseb': {
      'en': 'View',
      'hi': 'राय',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    'ipj4b3o2': {
      'en': 'Username',
      'hi': 'उपयोगकर्ता नाम',
      'ta': 'பயனர் பெயர்',
      'ur': 'صارف نام',
    },
    'hwbisz08': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    '3t1qpdde': {
      'en': 'View',
      'hi': 'राय',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    'hpq0skds': {
      'en': 'Username',
      'hi': 'उपयोगकर्ता नाम',
      'ta': 'பயனர் பெயர்',
      'ur': 'صارف نام',
    },
    'zf4p0iqk': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    'gvttx09d': {
      'en': 'View',
      'hi': 'राय',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    'jy6ian12': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    'm88gl572': {
      'en': 'View',
      'hi': 'राय',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
  },
  // createNote
  {
    'i9im6f7s': {
      'en': 'Create Note',
      'hi': 'नोट बनाएं',
      'ta': 'குறிப்பை உருவாக்கவும்',
      'ur': 'نوٹ بنائیں',
    },
    'y8jieyz4': {
      'en': 'Create a note to keep your team in the loop.',
      'hi': 'नीचे खोज कर सदस्यों को खोजें',
      'ta': 'கீழே தேடுவதன் மூலம் உறுப்பினர்களைக் கண்டறியவும்',
      'ur': 'ذیل میں تلاش کرکے اراکین کو تلاش کریں۔',
    },
    'sq20csss': {
      'en': 'Enter your note here...',
      'hi': 'अपना नोट यहां दर्ज करें...',
      'ta': 'உங்கள் குறிப்பை இங்கே உள்ளிடவும்...',
      'ur': 'اپنا نوٹ یہاں درج کریں...',
    },
    'clj48a46': {
      'en': 'Create Note',
      'hi': 'नोट बनाएं',
      'ta': 'குறிப்பை உருவாக்கவும்',
      'ur': 'نوٹ بنائیں',
    },
  },
  // TaskComponent
  {
    'uuuaezib': {
      'en': 'Completed',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
  },
  // WebNav
  {
    'nf1dqsbp': {
      'en': '3',
      'hi': '',
      'ta': '',
      'ur': '',
    },
  },
  // changePhoto
  {
    'rveosbw6': {
      'en': 'Change Photo',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'xkv4rj30': {
      'en':
          'Upload a new photo below in order to change your avatar seen by others.',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '9jqfzztm': {
      'en': 'Upload Image',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'tnhsrx4j': {
      'en': 'Save Changes',
      'hi': '',
      'ta': '',
      'ur': '',
    },
  },
  // modal_Project
  {
    '4r29z75b': {
      'en': 'View All',
      'hi': 'सभी को देखें',
      'ta': 'அனைத்தையும் காட்டு',
      'ur': 'سب دیکھیں',
    },
    't5thu3gr': {
      'en': 'Completed Tasks',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'fycpdliq': {
      'en': 'Number of Tasks',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    't39dexai': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    'uu14cs8r': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'ph74cymq': {
      'en': 'Issue #242952592',
      'hi': 'अंक #242952592',
      'ta': 'வெளியீடு #242952592',
      'ur': 'شمارہ نمبر 242952592',
    },
    'fe9x22ad': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    't725c9h5': {
      'en': 'Andres Reynolds',
      'hi': 'एंड्रेस रेनॉल्ड्स',
      'ta': 'ஆண்ட்ரெஸ் ரெனால்ட்ஸ்',
      'ur': 'اینڈریس رینالڈز',
    },
    '2rn0rm7g': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    '28tyqcfc': {
      'en': 'Tuesday, 10:00am',
      'hi': 'मंगलवार, सुबह 10:00 बजे',
      'ta': 'செவ்வாய், காலை 10:00 மணி',
      'ur': 'منگل، صبح 10:00 بجے',
    },
    'gd3bhzsf': {
      'en': 'Completed',
      'hi': 'पूरा हुआ',
      'ta': 'நிறைவு',
      'ur': 'مکمل',
    },
    'y686s4b1': {
      'en': 'Complete',
      'hi': 'पूरा',
      'ta': 'முழுமை',
      'ur': 'مکمل',
    },
    'lcgypwk6': {
      'en': 'Completed on',
      'hi': 'पर पूर्ण',
      'ta': 'அன்று நிறைவடைந்தது',
      'ur': 'پر مکمل ہوا۔',
    },
    'dy7qxdlp': {
      'en': 'Activity',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '99rgc554': {
      'en': 'Current Time',
      'hi': '',
      'ta': '',
      'ur': '',
    },
  },
  // modal_TaskDetails
  {
    'zerfwzgz': {
      'en': 'Mark as Complete',
      'hi': 'पूर्ण के रूप में चिह्नित करें',
      'ta': 'முழுமையானதாகக் குறிக்கவும்',
      'ur': 'مکمل کے بطور نشان زد کریں۔',
    },
    'fki0wi86': {
      'en': 'Begin Task',
      'hi': 'कार्य शुरू करें',
      'ta': 'பணியைத் தொடங்குங்கள்',
      'ur': 'کام شروع کریں۔',
    },
    'pj3j661s': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
    'qwc3ia6n': {
      'en': ', ',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '5bz5zdwp': {
      'en': 'Team Members',
      'hi': 'टीम के सदस्य',
      'ta': 'குழு உறுப்பினர்கள்',
      'ur': 'ٹیم کے افراد',
    },
    'hc3gs7ga': {
      'en': 'Activity',
      'hi': 'टिप्पणियाँ',
      'ta': 'குறிப்புகள்',
      'ur': 'نوٹس',
    },
    'ru97sguf': {
      'en': 'Leave update here...',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '7qs4hvi5': {
      'en': 'Post Update',
      'hi': 'नोट बनाएं',
      'ta': 'குறிப்பை உருவாக்கவும்',
      'ur': 'نوٹ بنائیں',
    },
  },
  // modal_UserProfile
  {
    'xbcjin31': {
      'en': 'Team Name',
      'hi': 'टीम का नाम',
      'ta': 'குழு பெயர்',
      'ur': 'گروہ کا نام',
    },
    's2rahhu0': {
      'en': ' - ',
      'hi': '-',
      'ta': '-',
      'ur': '-',
    },
    'f87wic4n': {
      'en': '12 Tasks',
      'hi': '12 कार्य',
      'ta': '12 பணிகள்',
      'ur': '12 کام',
    },
    '1r4s70n4': {
      'en': 'Team Bio',
      'hi': 'टीम बायो',
      'ta': 'டீம் பயோ',
      'ur': 'ٹیم بائیو',
    },
    'ai2tvk8r': {
      'en': 'Tasks',
      'hi': 'कार्य',
      'ta': 'பணிகள்',
      'ur': 'کام',
    },
    'k2fas9o8': {
      'en': 'Due',
      'hi': 'बकाया',
      'ta': 'காரணமாக',
      'ur': 'واجب الادا',
    },
  },
  // modal_TaskCreate_1
  {
    'na5pbjsl': {
      'en': 'Choose Project',
      'hi': 'आपका प्रोजेक्ट नहीं दिख रहा है? यहां एक जोड़ें।',
      'ta': 'உங்கள் திட்டம் பார்க்கவில்லையா? ஒன்றை இங்கே சேர்க்கவும்.',
      'ur': 'آپ کا پروجیکٹ نظر نہیں آرہا؟ یہاں ایک شامل کریں۔',
    },
    '7lc6cya0': {
      'en': 'Don\'t see your project? Add one here.',
      'hi': 'आपका प्रोजेक्ट नहीं दिख रहा है? यहां एक जोड़ें।',
      'ta': 'உங்கள் திட்டம் பார்க்கவில்லையா? ஒன்றை இங்கே சேர்க்கவும்.',
      'ur': 'آپ کا پروجیکٹ نظر نہیں آرہا؟ یہاں ایک شامل کریں۔',
    },
    'wyow03qm': {
      'en': 'Add Project',
      'hi': 'प्रोजेक्ट जोड़ें',
      'ta': 'திட்டத்தைச் சேர்க்கவும்',
      'ur': 'پروجیکٹ شامل کریں۔',
    },
    '0advwx1u': {
      'en': 'Last edited:',
      'hi': 'पिछली बार संपादित:',
      'ta': 'கடைசியாக திருத்தப்பட்டது:',
      'ur': 'آخری ترمیم:',
    },
    'ksmhvpjh': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    '2icxeqf5': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    'bthhoi83': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
    '9g6shlpz': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'ta': 'இந்த பகுதி அவசியமானது',
      'ur': 'فیلڈ کی ضرورت ہے',
    },
  },
  // modal_CreateProject
  {
    'd3zhz60s': {
      'en': 'Create Project',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'ndua9r0o': {
      'en': 'Please add the name & description below.',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'ijnwlsug': {
      'en': 'Project Name',
      'hi': 'परियोजना का नाम',
      'ta': 'திட்டத்தின் பெயர்',
      'ur': 'پراجیکٹ کا نام',
    },
    'l7qnilp2': {
      'en': 'Enter description here...',
      'hi': 'यहां विवरण दर्ज करें...',
      'ta': 'விளக்கத்தை இங்கே உள்ளிடவும்...',
      'ur': 'یہاں تفصیل درج کریں...',
    },
    'iou7k3x8': {
      'en': 'Assign Users',
      'hi': 'नीचे खोज कर सदस्यों को खोजें',
      'ta': 'கீழே தேடுவதன் மூலம் உறுப்பினர்களைக் கண்டறியவும்',
      'ur': 'ذیل میں تلاش کرکے اراکین کو تلاش کریں۔',
    },
    'h40v3y8u': {
      'en': 'Find members by searching below',
      'hi': 'नीचे खोज कर सदस्यों को खोजें',
      'ta': 'கீழே தேடுவதன் மூலம் உறுப்பினர்களைக் கண்டறியவும்',
      'ur': 'ذیل میں تلاش کرکے اراکین کو تلاش کریں۔',
    },
    'p3m016ff': {
      'en': 'Search members...',
      'hi': 'सदस्यों को खोजें...',
      'ta': 'உறுப்பினர்களைத் தேடு...',
      'ur': 'اراکین کو تلاش کریں...',
    },
    'kr442apd': {
      'en': 'Assign',
      'hi': 'सौंपना',
      'ta': 'ஒதுக்க',
      'ur': 'تفویض',
    },
    '74kovm7t': {
      'en': 'Assign',
      'hi': 'सौंपना',
      'ta': 'ஒதுக்க',
      'ur': 'تفویض',
    },
    'p9mvmaob': {
      'en': 'Create Project',
      'hi': 'प्रोजेक्ट बनाएं',
      'ta': 'திட்டத்தை உருவாக்கவும்',
      'ur': 'پروجیکٹ بنائیں',
    },
    'zzv8enkj': {
      'en': 'Please enter a project name.',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '536ycszy': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'e68qg04m': {
      'en': 'Please enter a short description.',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'csybxpz6': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'ta': '',
      'ur': '',
    },
  },
  // modal_TaskCreate_2
  {
    'fkb8cli1': {
      'en': 'Task Name',
      'hi': 'कार्य का नाम',
      'ta': 'பணி பெயர்',
      'ur': 'ٹاسک کا نام',
    },
    '5qwd78rp': {
      'en': 'Enter description here...',
      'hi': 'यहां विवरण दर्ज करें...',
      'ta': 'விளக்கத்தை இங்கே உள்ளிடவும்...',
      'ur': 'یہاں تفصیل درج کریں...',
    },
    'o1qo2qg3': {
      'en': 'Not Started',
      'hi': 'शुरू नहीं',
      'ta': 'துவங்கவில்லை',
      'ur': 'شروع نہیں کیا',
    },
    '3xt3njp6': {
      'en': 'In Progress',
      'hi': 'चालू',
      'ta': 'செயல்பாட்டில் உள்ளது',
      'ur': 'کام جاری ہے',
    },
    'u0g3xflr': {
      'en': 'Complete',
      'hi': 'पूरा',
      'ta': 'முழுமை',
      'ur': 'مکمل',
    },
    'c2dtsnbb': {
      'en': 'Select Status',
      'hi': 'स्थिति का चयन करें',
      'ta': 'நிலையைத் தேர்ந்தெடுக்கவும்',
      'ur': 'اسٹیٹس کو منتخب کریں۔',
    },
    'udw09bms': {
      'en': 'Create Task',
      'hi': 'टास्क बनाएं',
      'ta': 'பணியை உருவாக்கவும்',
      'ur': 'ٹاسک بنائیں',
    },
    'dgd9bazz': {
      'en': 'Please add a task name.',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '510sc51m': {
      'en': 'Please enter at least 3 letters.',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'grveqhde': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'jid8c04u': {
      'en': 'Field is required',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'r242ro2z': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'ta': '',
      'ur': '',
    },
  },
  // modal_Activity
  {
    '2issmdet': {
      'en': 'Notifications',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '4z8dhmym': {
      'en': 'Project:',
      'hi': '',
      'ta': '',
      'ur': '',
    },
  },
  // modal_addMembers
  {
    'qgce8yzt': {
      'en': 'Add Members to project',
      'hi': 'आपका प्रोजेक्ट नहीं दिख रहा है? यहां एक जोड़ें।',
      'ta': 'உங்கள் திட்டம் பார்க்கவில்லையா? ஒன்றை இங்கே சேர்க்கவும்.',
      'ur': 'آپ کا پروجیکٹ نظر نہیں آرہا؟ یہاں ایک شامل کریں۔',
    },
    'ncylrws1': {
      'en': 'Members in Project',
      'hi': 'परियोजना में सदस्य',
      'ta': 'திட்டத்தில் உறுப்பினர்கள்',
      'ur': 'پروجیکٹ میں ممبران',
    },
    'ddkg34qk': {
      'en': 'Remove',
      'hi': 'हटाना',
      'ta': 'அகற்று',
      'ur': 'دور',
    },
    'gw54o3ei': {
      'en': 'UserName',
      'hi': 'उपयोगकर्ता नाम',
      'ta': 'பயனர்பெயர்',
      'ur': 'صارف کا نام',
    },
    '5ybblr1d': {
      'en': 'Remove',
      'hi': 'हटाना',
      'ta': 'அகற்று',
      'ur': 'دور',
    },
    'epngmu69': {
      'en': 'UserName',
      'hi': 'उपयोगकर्ता नाम',
      'ta': 'பயனர்பெயர்',
      'ur': 'صارف کا نام',
    },
    '1qnvp80y': {
      'en': 'Remove',
      'hi': 'हटाना',
      'ta': 'அகற்று',
      'ur': 'دور',
    },
    'rxgjnrtl': {
      'en': 'Add Members',
      'hi': 'सदस्य जोड़ें',
      'ta': 'உறுப்பினர்களைச் சேர்க்கவும்',
      'ur': 'ممبرز کو شامل کریں۔',
    },
    'c69xi1a4': {
      'en': 'Assign',
      'hi': 'सौंपना',
      'ta': 'ஒதுக்க',
      'ur': 'تفویض',
    },
    'ac5i8pip': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    'bixtd6lt': {
      'en': 'View',
      'hi': 'राय',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    's1ekanj3': {
      'en': 'Username',
      'hi': 'उपयोगकर्ता नाम',
      'ta': 'பயனர் பெயர்',
      'ur': 'صارف نام',
    },
    'xtjlfcyr': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    '9rm7l3fs': {
      'en': 'View',
      'hi': 'राय',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    'chsej9xj': {
      'en': 'Username',
      'hi': 'उपयोगकर्ता नाम',
      'ta': 'பயனர் பெயர்',
      'ur': 'صارف نام',
    },
    'a1tcbxkr': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    'y6o0uvra': {
      'en': 'View',
      'hi': 'राय',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
    'fb7aygmy': {
      'en': 'user@domainname.com',
      'hi': 'user@domainname.com',
      'ta': 'user@domainame.com',
      'ur': 'user@domainname.com',
    },
    'ug774jqi': {
      'en': 'View',
      'hi': 'राय',
      'ta': 'காண்க',
      'ur': 'دیکھیں',
    },
  },
  // VisionCard
  {
    '4g8t4pum': {
      'en': '[Vision Name]',
      'hi': '',
      'ta': '',
      'ur': '',
    },
  },
  // Miscellaneous
  {
    'fi5o91qd': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'skzc79wn': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '0rnqst8h': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'nh43oztv': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'i4m03gv7': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '9h5b120r': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '2xxt8j1o': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    't7udujpl': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'zbbv93d3': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'cql4rcil': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    't9vh67yu': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'ac2c7a8c': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '43t0g3v5': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'hxsgfsan': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'zuih46g4': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '8oo00kio': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'f4h7j5e1': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'dka0mr3o': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'a9x09f52': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'q7jjmx75': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'b9gx9zp0': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    '3ogdlxsd': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
    'uxmsgxy2': {
      'en': '',
      'hi': '',
      'ta': '',
      'ur': '',
    },
  },
].reduce((a, b) => a..addAll(b));
