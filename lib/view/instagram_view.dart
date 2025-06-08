import 'package:flutter/material.dart'; // استيراد حزمة Flutter الأساسية.
import 'package:iconsax/iconsax.dart'; // استيراد أيقونات Iconsax.
import 'package:instegram/widget/custom_status_widget.dart'; // استيراد الـ Widget الخاص بالحالات (الستوري).
import 'package:badges/badges.dart' as badges; // استيراد حزمة الـ Badges (شارات الإشعارات).
import '../widget/custom_post_card.dart'; // استيراد الـ Widget الخاص بالمنشورات.

// هذه هي شاشة العرض الرئيسية لتطبيق انستجرام الوهمي.
class InstagramView extends StatelessWidget {
  const InstagramView({super.key});

  @override
  Widget build(BuildContext context) {
    // قائمة بالبيانات الوهمية للحالات (الستوري).
    List status = [
      {
        'statusImage': 'assets/images/6.jpg',
        'username': 'Rehab_Ahmed',
      },
      {
        'statusImage': 'assets/images/7.jpg',
        'username': 'Ahmed',
      },
      {
        'statusImage': 'assets/images/8.jpg',
        'username': 'Layla',
      },
      {
        'statusImage': 'assets/images/9.jpg',
        'username': 'Khalid',
      },
      {
        'statusImage': 'assets/images/10.jpg',
        'username': 'Sara',
      },
    ];

    // قائمة بالبيانات الوهمية للمنشورات (البوستات).
    List posts = [
      {
        "userImage": "assets/images/6.jpg",
        "username": "Rehab",
        "post": "assets/images/1.jpg",
        "likes": "1.2K",
        "mainText": "A beautiful day in nature 🌳",
        "subText": "Enjoy every moment!",
      },
      {
        "userImage": "assets/images/7.jpg",
        "username": "Ahmed",
        "post": "assets/images/2.jpg",
        "likes": "850",
        "mainText": "New challenge 🏋️‍♂️",
        "subText": "Never give up!",
      },
      {
        "userImage": "assets/images/8.jpg",
        "username": "Layla",
        "post": "assets/images/3.jpg",
        "likes": "3.5K",
        "mainText": "The art of cooking 🍲",
        "subText": "Today's recipe was amazing!",
      },
      {
        "userImage": "assets/images/9.jpg",
        "username": "Khalid",
        "post": "assets/images/4.jpg",
        "likes": "2.1K",
        "mainText": "Sunset from my balcony 🌇",
        "subText": "Peaceful and beautiful moments.",
      },
      {
        "userImage": "assets/images/10.jpg",
        "username": "Sara",
        "post": "assets/images/5.jpg",
        "likes": "990",
        "mainText": "Enjoyable reading 📚",
        "subText": "What's your favorite book?",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.black, // تعيين خلفية الشاشة باللون الأسود.
      
      //! شريط التطبيق العلوي (AppBar)
      appBar: customAppBar(), // استدعاء دالة بناء الـ AppBar.

      //! محتوى الصفحة (الجسم)
      body: ListView( // 'ListView' لعرض قائمة قابلة للتمرير عمودياً.
        children: [
          // جزء عرض الحالات (الستوري) بشكل أفقي.
          SingleChildScrollView(
            scrollDirection: Axis.horizontal, // لجعل التمرير أفقياً فقط.
            child: Row( // يرتب الـ Widgets بشكل أفقي.
              children: [
                // 'List.generate' لإنشاء قائمة من CustomStatusWidget بناءً على بيانات 'status'.
                ...List.generate(
                  status.length,
                  (index) =>
                      CustomStatusWidget( // تمرير بيانات كل حالة إلى الـ Widget الخاص بها.
                        statusImage: status[index]['statusImage'],
                        username: status[index]['username'],
                      ),
                ),
              ],
            ),
          ),
          
          // 'ListView.separated' لعرض قائمة من المنشورات مع فاصل بين كل منها.
          ListView.separated(
            shrinkWrap: true, // يجعل الـ ListView يأخذ المساحة التي يحتاجها فقط.
            physics: BouncingScrollPhysics(), // يعطي تأثير ارتداد عند نهاية التمرير.
            itemBuilder: (context, index) {
              // بناء كل عنصر (منشور) باستخدام CustomPostCard.
              return CustomPostCard(
                userImage: posts[index]['userImage'],
                username: posts[index]['username'],
                post: posts[index]['post'],
                likes: posts[index]['likes'],
                mainText: posts[index]['mainText'],
                subText: posts[index]['subText'],
              );
            },
            separatorBuilder: (context, index) {
              // بناء الفاصل بين كل منشور وآخر (خط رمادي).
              return Divider(color: Colors.grey.shade700);
            },
            itemCount: posts.length, // عدد العناصر الكلي في القائمة.
          ),
        ],
      ),
    );
  }

  // دالة مخصصة لبناء شريط التطبيق العلوي (AppBar).
  AppBar customAppBar() {
    return AppBar(
      backgroundColor: Colors.black, // خلفية شريط التطبيق سوداء.
      title: Image.asset( // عرض شعار التطبيق كعنوان.
        'assets/images/logo.png',
        color: Colors.white, // تلوين الشعار بالأبيض.
        width: 150, // عرض الشعار.
      ),
      actions: [ // الأيقونات الموجودة على يمين الـ AppBar.
        badges.Badge( // أيقونة الإعجابات مع شارة (Badge) فارغة.
          position: badges.BadgePosition.topEnd(top: -10, end: 0),
          badgeContent: Text(''), // شارة فارغة (يمكن أن تحتوي على رقم).
          child: Icon(Iconsax.heart, size: 30, color: Colors.white), // أيقونة القلب.
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5), // تبطين جانبي.
          child: badges.Badge( // أيقونة الرسائل مع شارة تحتوي على رقم.
            badgeContent: Text('3', style: TextStyle(color: Colors.white)), // عدد الرسائل.
            child: Icon(Iconsax.message, size: 30, color: Colors.white), // أيقونة الرسائل.
          ),
        ),
        SizedBox(width: 10), // مسافة فارغة في النهاية.
      ],
    );
  }
}