import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
void main() => runApp(MaterialApp(home: MyHomePage()));

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _latestLink = 'Waiting for an initial link...';
  final String paypalLink = 'https://www.sandbox.paypal.com/checkoutnow?token=851475793A4233631';

  @override
  void initState() {
    super.initState();
    initUniLinks();
  }

  Future<void> initUniLinks() async {
    // ... (راجع توثيق الحزمة لمعرفة كيفية الإعداد بالتفصيل)
    getInitialLink().then((value) {
      if (value != null) {
        setState(() {
          _latestLink = value;
        });
        _handleDeepLink(value);
      }
    }).catchError((error) {
      print('error: $error');
    });
  }

  void _handleDeepLink(String link) {
    if (link.contains('payment/complete')) {
      // عملية الدفع تمت بنجاح
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('تمت العملية بنجاح'),
            content: Text('شكراً لك'),
          );
        },
      );
    } else if (link.contains('payment/cancel')) {
      // تم إلغاء عملية الدفع
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('لم تتم'),
            content: Text('شكراً لك'),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyApp'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            launch(paypalLink);
          },
          child: Text('ادفع الآن'),
        ),
      ),
    );
  }
}