import 'package:flutter/material.dart'; // استيراد حزمة Flutter الأساسية.
import 'package:iconsax/iconsax.dart'; // استيراد أيقونات Iconsax.
import 'package:insta_image_viewer/insta_image_viewer.dart'; // استيراد حزمة لعرض الصور بملء الشاشة.

// هذا الـ Widget يمثل بطاقة (Card) منشور واحد في تطبيق انستجرام.
class CustomPostCard extends StatelessWidget {
  // تعريف المتغيرات التي سيتلقاها الـ Widget عند إنشائه.
  final String userImage; // صورة الملف الشخصي للمستخدم.
  final String username; // اسم المستخدم.
  final String post; // صورة المنشور.
  final String likes; // عدد الإعجابات.
  final String mainText; // النص الرئيسي للمنشور.
  final String subText; // نص إضافي (تعليق فرعي أو هاشتاجات).

  // المُنشئ (Constructor) يطلب جميع المتغيرات المحددة.
  const CustomPostCard({
    super.key,
    required this.userImage,
    required this.username,
    required this.post,
    required this.likes,
    required this.mainText,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    return Column( // يرتب العناصر بشكل عمودي.
      children: [
        //? جزء معلومات المستخدم (صورة واسم).
        Row( // يرتب العناصر بشكل أفقي.
          children: [
            Container( // حاوية لصورة المستخدم.
              padding: EdgeInsets.all(10), // تبطين حول الصورة.
              child: CircleAvatar( // لعرض صورة المستخدم بشكل دائري.
                backgroundImage: AssetImage(userImage), // مصدر الصورة من مجلد assets.
                radius: 25, // حجم الدائرة.
              ),
            ),
            Expanded( // يجعل الـ Text يأخذ المساحة المتبقية.
              child: Text(
                username, // عرض اسم المستخدم.
                style: TextStyle( // تنسيق النص.
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
            ),
            IconButton( // زر "المزيد" (ثلاث نقاط).
              onPressed: () {}, // لا يقوم بأي شيء حالياً.
              icon: Icon(Icons.more_vert, color: Colors.white, size: 30),
            ),
          ],
        ),

        SizedBox(height: 5), // مسافة فارغة عمودية.

        //? جزء صورة المنشور.
        // 'InstaImageViewer' يسمح للمستخدم بالنقر على الصورة لعرضها بملء الشاشة.
        InstaImageViewer(child: Image.asset(post)),

        SizedBox(height: 5), // مسافة فارغة عمودية.

        //? جزء أزرار التفاعل (الإعجاب، التعليق، الإرسال، الحفظ).
        Row( // يرتب العناصر بشكل أفقي.
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // يوزع العناصر مع مسافة متساوية بينها.
          children: [
            Row( // مجموعة الأزرار على اليسار.
              children: [
                IconButton( // زر الإعجاب (قلب).
                  onPressed: () {},
                  icon: Icon(Iconsax.heart, color: Colors.white, size: 30),
                ),
                Text(
                  likes, // عرض عدد الإعجابات.
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                IconButton( // زر التعليق.
                  onPressed: () {},
                  icon: Icon(Iconsax.message, color: Colors.white, size: 30),
                ),
                IconButton( // زر الإرسال (مشاركة).
                  onPressed: () {},
                  icon: Icon(Iconsax.send_1, color: Colors.white, size: 30),
                ),
              ],
            ),
            IconButton( // زر الحفظ (bookmark).
              onPressed: () {},
              icon: Icon(Icons.bookmark_outline, color: Colors.white, size: 30),
            ),
          ],
        ),

        //? جزء وصف المنشور.
        Container(
          padding: EdgeInsets.only(left: 15, top: 5), // تبطين من اليسار والأعلى.
          alignment: Alignment.bottomLeft, // محاذاة المحتوى للأسفل واليسار.
          child: Text.rich( // يسمح بعرض أجزاء من النص بتنسيقات مختلفة.
            TextSpan(
              children: [
                TextSpan( // الجزء الرئيسي من النص (اسم المستخدم + النص الرئيسي).
                  text: '$username $mainText', // دمج اسم المستخدم مع النص الرئيسي.
                  style: TextStyle( // تنسيق الجزء الرئيسي.
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                TextSpan( // الجزء الفرعي من النص (مثل التعليقات أو الهاشتاجات).
                  text: ' $subText', // مسافة قبل النص الفرعي.
                  style: TextStyle(color: Colors.grey, fontSize: 16), // تنسيق النص الفرعي.
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}