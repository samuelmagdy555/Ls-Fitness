import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MessageScreen(),
    );
  }
}

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen>
    with SingleTickerProviderStateMixin {
  OverlayEntry? _emojiOverlay;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _showEmojiPicker(BuildContext context, Offset offset) {
    final overlay = Overlay.of(context);
    final screenSize = MediaQuery.of(context).size;
    print(screenSize.width);

    // احسب المواضع بشكل ديناميكي
    double left = offset.dx; // الموضع الأفقي
    double top = offset.dy; // الموضع العمودي

    print(left);
    // منع القائمة من الخروج عن حواف الشاشة


    _emojiOverlay = OverlayEntry(
      builder: (context) {
        return Positioned(
          left: 0,
          top: top+35,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Material(
              color: Colors.transparent,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _emojiButton('👍'),
                  _emojiButton('❤️'),
                  _emojiButton('😂'),
                  _emojiButton('😮'),
                  _emojiButton('😢'),
                  _emojiButton('💪🏻'),
                  _emojiButton('🦍'),
                ],
              ),
            ),
          ),
        );
      },
    );

    overlay.insert(_emojiOverlay!);
    _animationController.forward(); // بدء الحركة
  }

  Widget _emojiButton(String emoji) {
    return GestureDetector(
      onTap: () {
        // تنفيذ إجراء عند اختيار الإيموجي
        _animationController.reverse().then((_) {
          _emojiOverlay?.remove();
          _emojiOverlay = null;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('You selected $emoji')),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          emoji,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message Screen'),
      ),
      body: Center(
        child: GestureDetector(
          onLongPressStart: (details) {
            _showEmojiPicker(context, details.globalPosition);
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'اضغط ضغطة طويلة هنا',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
