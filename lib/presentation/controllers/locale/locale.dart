// Packages
import 'package:get/get.dart';

class Locale implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': {
          '1': "الصفحة الرئيسية",
          '2': " ARA  مرحبا بكم في متجر",
          '3': "العربية",
          '4': "English",
          '5': "الكردية",
          '6': "الملف الشخصي",
          '7': "اتصل بنا",
          '8': "سياسةوالخصوصية",
          '9': "مشتريات",
          '10': 'افضل مكان لشراء منتجات الكترونية',
          '11': 'السعر'
        },
        'en': {
          '1': 'Home page',
          '2': "Welcome to ARA store",
          '3': "Arbic",
          '4': "English",
          '5': "Kurdish",
          '6': "Profile",
          '7': "Connect Us",
          '8': "Privacy Policy",
          '9': 'purchases',
          '10': 'Best place to buy electronic products',
          '11': 'Price'
        },

        // Persian or Farsi ==> fa
        'fa': {
          '1': 'پەرەیی سەرەکی',
          '2': "  ARA بەخێربێن بۆ بازاری ",
          '3': "عەرەبی",
          '4': "English",
          '5': "کوردی",
          '6': "پرۆفایل",
          '7': " پەیوەندیمان پێوە بکە",
          '8': " تایبەتمەندی و رێنمایی ",
          '9': 'کڕینەکان',
          '10': 'باشترین شوێن بۆ کرینی بەرهەمەکانی تەکنەلۆژیا',
          '11': 'نرخ'
        }
      };
}
