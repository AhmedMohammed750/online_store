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
          '11': 'السعر',
          '12':'المجموع',
          '13':'الدفع',
          '14':'الاسم:',
          '15':"تاريخ الانشاء:",
          "16":"البريد الإلكتروني:",
          '17':'تم التحقق من البريد الإلكتروني :',
          '18':'المفضل',
          '19':'حساب المشرف',
          '20':'حذف المنتج',
          '21':'اضافة المنتج'
        
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
          '11': 'Price',
          '12':'TOTAL',
          '13':'PAYMENT',
          '14':'Name:',
          '15':'Created:',
          '16':'Email:',
          '17':'Email verified:',
          '18':'Favorite',
          '19':'Admin Account',
          '20':'Delete Product',
          '21':'Add Product'

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
          '11': 'نرخ',
          '12':'TOTAL',
          '13':'PAYMENT',
          '14':'Name',
          '15':'Created',
          '16':'Email',
          '17':'Email verified',
          '18':'favorite',
          '19':'Admin',
          '20':'Delete Product',
          '21':'Add Product'
        }
      };
}
