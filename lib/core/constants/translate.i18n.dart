import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static final _t = Translations.byText('en-US') +
      {
        'en-US': 'Next',
        'hi-IN': 'अगला',
      } +
      {
        'en-US': 'Skip',
        'hi-IN': 'छोड़ें',
      } +
      {
        'en-US': 'Discover, engage and read the latest articles\nor as well as share your own thoughts and\nideas with the community',
        'hi-IN': 'नवीनतम लेख खोजें, जुड़ें और पढ़ें\nया समुदाय के साथ अपने विचार और\nसुझाव साझा करें',
      } +
      {
        'en-US': 'Explore, connect, and dive into fresh articles\nor share your own insights and ideas\nwith the community',
        'hi-IN': 'अन्वेषण करें, जुड़ें, और नवीनतम लेख पढ़ें\nया अपने विचार और सुझाव समुदाय के साथ साझा करें',
      } +
      {
        'en-US': 'Stay informed with fresh and engaging \ncontent or contribute your unique thoughts\nand ideas with ease',
        'hi-IN': 'नए और रोचक सामग्री के साथ अपडेट रहें\nया अपने अनोखे विचार और सुझाव आसानी से साझा करें',
      } +
      {
        'en-US': 'Settings',
        'hi-IN': 'सेटिंग्स',
      } +
      {
        'en-US': 'Language',
        'hi-IN': 'भाषा',
      } +
      {
        'en-US': 'Email',
        'hi-IN': 'ईमेल',
      } +
      {
        'en-US': 'Password',
        'hi-IN': 'पासवर्ड',
      } +
      {
        'en-US': 'Remember me',
        'hi-IN': 'मुझे याद रखें',
      } +
      {
        'en-US': 'Will be available soon, working on API :)',
        'hi-IN': 'जल्द ही उपलब्ध होगा, एपीआई पर काम कर रहे हैं :)',
      } +
      {
        'en-US': 'Forgot Password?',
        'hi-IN': 'पासवर्ड भूल गए?',
      } +
      {
        'en-US': "Don't have an account?",
        'hi-IN': 'खाता नहीं है?',
      } +
      {
        'en-US': 'Name',
        'hi-IN': 'नाम',
      } +
      {
        'en-US': 'Already have an account?',
        'hi-IN': 'पहले से ही खाता है?',
      } +    {
        'en-US': 'Login',
        'hi-IN': 'लॉग इन करें',
      } + {
        'en-US': 'Register',
        'hi-IN': 'पंजीकरण करवाना',
      } + {
        'en-US': 'Explore the world,\nBillions of thoughts.',
        'hi-IN': 'दुनिया का अन्वेषण करें,\nअरबों विचार।',
      } + {
        'en-US': 'Browse Casually',
        'hi-IN': 'आराम से ब्राउज़ करें',
      } + {
        'en-US': "Don't want to create",
        'hi-IN': 'बनाना नहीं चाहते',
      } + {
        'en-US': 'This feature isn\'t available yet!',
        'hi-IN': 'यह सुविधा अभी उपलब्ध नहीं है!',
      } + {
        'en-US': 'Get Started!',
        'hi-IN': 'शुरू करें!',
      };

  String get i18n => localize(this, _t);
}
