import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class PaymentPage extends StatefulWidget {
  final String paymentId;

  const PaymentPage({Key? key, required this.paymentId}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late StreamSubscription _deepLinkSubscription;

  @override
  void initState() {
    super.initState();
    _listenToDeepLink();
    
  }

  @override
  void dispose() {
    _deepLinkSubscription.cancel();
    super.dispose();
  }

  Future<void> _startPayment() async {
    final paymentUrl =
        "https://www.sandbox.paypal.com/checkoutnow?token=4D2904852A860613Y";

    await launchUrl(Uri.parse(paymentUrl));
  }

  void _listenToDeepLink() {
    const deepLinkChannel = MethodChannel('deep_link');
    deepLinkChannel.setMethodCallHandler((MethodCall call) async {
      if (call.method == 'onDeepLink') {
        final String? deepLink = call.arguments as String?;
        if (deepLink != null) {
          if (deepLink.startsWith("lsfitness://payment/complete")) {
            Navigator.pushReplacementNamed(context, "/paymentSuccess");
          } else if (deepLink.startsWith("lsfitness://payment/cancel")) {
            Navigator.pushReplacementNamed(context, "/paymentFailed");
          }
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
      ),
      body:  Center(
        child: ElevatedButton(onPressed: (){_startPayment();}, child: Text('f;ka')),
      ),
    );
  }
}




class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Successful"),
      ),
      body: const Center(
        child: Text("Thank you! Your payment was successful."),
      ),
    );
  }
}



class PaymentFailedPage extends StatelessWidget {
  const PaymentFailedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Failed"),
      ),
      body: const Center(
        child: Text("Payment was cancelled or failed. Please try again."),
      ),
    );
  }
}


