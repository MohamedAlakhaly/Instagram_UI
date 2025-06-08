import 'package:flutter/material.dart'; // استيراد حزمة Flutter الأساسية.

// هذا الـ Widget يعرض "حالة" (Status) للمستخدم.
class CustomStatusWidget extends StatelessWidget {
  // المُنشئ (Constructor) يطلب مسار الصورة واسم المستخدم.
  const CustomStatusWidget({
    super.key,
    required this.statusImage, // مسار صورة الحالة (البروفايل).
    required this.username, // اسم المستخدم.
  });

  final String statusImage; // متغير لتخزين مسار الصورة.
  final String username; // متغير لتخزين اسم المستخدم.

  @override
  Widget build(BuildContext context) {
    return Column( // يرتب العناصر بشكل عمودي.
      children: [
        Container( // الحاوية الخارجية للصورة.
          margin: const EdgeInsets.all(5), // هامش خارجي.
          padding: const EdgeInsets.all(3), // تبطين داخلي.
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80), // لجعل الحواف دائرية.
            gradient: const LinearGradient(colors: [Colors.red, Colors.orange]), // تدرج لوني كحدود.
          ),
          child: Container( // الحاوية الداخلية للصورة الفعلية.
            padding: const EdgeInsets.all(4), // تبطين داخلي آخر.
            decoration: BoxDecoration(
              color: Colors.black, // خلفية سوداء.
              borderRadius: BorderRadius.circular(80), // لجعل الحواف دائرية.
            ),
            child: CircleAvatar( // لعرض الصورة بشكل دائري.
              backgroundImage: AssetImage(statusImage), // مصدر الصورة من مجلد assets.
              radius: 40, // حجم الدائرة.
              backgroundColor: Colors.black, // لون احتياطي.
            ),
          ),
        ),
        // لعرض اسم المستخدم ومعالجة النصوص الطويلة.
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0), // تبطين جانبي للنص.
          child: SizedBox( // يحدد عرضًا ثابتًا للنص.
            width: 80, // عرض النص الأقصى، ليتناسب مع الصورة.
            child: Text(
              username, // عرض اسم المستخدم.
              style: const TextStyle(color: Colors.white), // لون النص أبيض.
              textAlign: TextAlign.center, // توسيط النص.
              overflow: TextOverflow.ellipsis, // يضيف "..." إذا كان النص أطول من العرض.
              maxLines: 1, // يضمن أن النص يكون في سطر واحد.
            ),
          ),
        ),
      ],
    );
  }
}