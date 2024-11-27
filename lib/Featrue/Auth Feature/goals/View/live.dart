import 'package:flutter/material.dart';

class WhereDidYouLive extends StatefulWidget {
  const WhereDidYouLive({super.key});

  @override
  State<WhereDidYouLive> createState() => _WhereDidYouLiveState();
}

class _WhereDidYouLiveState extends State<WhereDidYouLive> {
  // إنشاء TextEditingController للتحكم في النص
  final TextEditingController _nationalityController = TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    // إضافة مستمع لتحديث حالة الزر عند تغيير النص
    _nationalityController.addListener(() {
      setState(() {
        isButtonEnabled = _nationalityController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    // التأكد من التخلص من الـ controller عند انتهاء الصفحة
    _nationalityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // صورة الخلفية
          Positioned(
            top: size.height * 0.027,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/Nationalty.png',
              width: size.width,
              height: size.height * 0.4,
              fit: BoxFit.cover,
            ),
          ),
          // محتويات الصفحة
          Column(
            children: [
              SizedBox(height: size.height * 0.4), // ترك مساحة للصورة
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.08, vertical: size.height * 0.05),
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // السؤال
                      Text(
                        "Where do you live?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: size.width * 0.06,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      // حقل النص لإدخال الجنسية
                      TextFormField(
                        controller: _nationalityController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          prefixIcon: Icon(Icons.flag, color: Colors.blue),
                        ),
                      ),
                      SizedBox(height: size.height * 0.2),
                      // زر متابعة
                      ElevatedButton(
                        onPressed: isButtonEnabled
                            ? () {
                          // وضع الأكشن عند الضغط على زر المتابعة
                          print("User Input: ${_nationalityController.text}");
                        }
                            : null,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.3, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          backgroundColor: isButtonEnabled
                              ? Colors.black
                              : Colors.grey,
                        ),
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: size.width * 0.045,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
