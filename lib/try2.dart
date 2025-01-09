import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: DynamicContainer(),
        ),
      ),
    );
  }
}

class DynamicContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // النصوص للـContainers
        final topText = "Top Containeeeeeeeeeeeeer";
        final bottomText = "Bottom Container .";

        // Widget العلوي
        final topChild = Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.red,
          child: Text(
            topText,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
        );

        // Widget السفلي
        final bottomChild = Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.green,
          child: Text(
            bottomText,
            textAlign: bottomText.length > topText.length ? TextAlign.left : TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
        );

        // حساب الحجم الافتراضي للـContainers
        final topHeight = calculateTextHeight(topText, constraints.maxWidth);
        final bottomHeight = calculateTextHeight(bottomText, constraints.maxWidth);

        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: bottomHeight > topHeight ? bottomHeight : null,
                child: topChild,
              ),
              Container(
                height: bottomHeight > topHeight ? null : topHeight,
                child: bottomChild,
              ),
            ],
          ),
        );
      },
    );
  }

  // دالة لحساب ارتفاع النص بناءً على عرضه
  double calculateTextHeight(String text, double maxWidth) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: const TextStyle(fontSize: 14)),
      maxLines: null,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: maxWidth);
    return textPainter.size.height + 16; // إضافة الـPadding
  }
}
