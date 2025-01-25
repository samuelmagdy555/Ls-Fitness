import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lsfitness/Featrue/MainLayout/view/trainer%20Feature/View%20Model/trainer_cubit.dart';
import 'package:uni_links/uni_links.dart';

import '../../Model/Trainer Details/Trainer Details.dart';

class TrainerSubscriptionPage extends StatefulWidget {
  final List<Plan> plans; // List of plans>
  final String ID;

  const TrainerSubscriptionPage({
    Key? key,
    required this.plans,
    required this.ID,
  }) : super(key: key);

  @override
  _TrainerSubscriptionPageState createState() =>
      _TrainerSubscriptionPageState();
}

class _TrainerSubscriptionPageState extends State<TrainerSubscriptionPage> {
  late TextEditingController _couponController;
  late TextEditingController _nameController;

  StreamSubscription? sub;

  void _initDeepLinkListener() async {
    print('initDeepLinkListener');
    sub = uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        uri.pathSegments.contains('complete')
            ? 'Payment Complete'
            : 'Payment Canceled';
        if (uri.pathSegments.contains('complete')) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Payment Complete'),
            ),
          );
          String? token = RegExp(r'token=([^&]+)')
              .firstMatch(TrainerCubit.get(context).buyCourseModel!.approvalUrl)
              ?.group(1);
          print('token =>>>>>>>>>>>>>>>>>>>> $token');
          TrainerCubit.get(context).CapturePaymentForLessonScreen(
            token: token!,
            Id: widget.ID,
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Payment Canceled'),
            ),
          );
        }
      }
    }, onError: (err) {
      print(err);
    });
  }

  bool _isLoading = false;
  double _finalPrice = -1;
  bool isApplyAdded = false;

  void _subscribe() {
    if (_nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter your name'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });
  }

  int press = 0;
  String couponCode = '';
  String planType = '';
  String planName = '';

  @override
  void initState() {
    super.initState();
    _initDeepLinkListener();
    _couponController = TextEditingController();
    _nameController = TextEditingController();
    _couponController.addListener(() {
      setState(() {
        isApplyAdded = _couponController.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Subscription',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_left,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Plan Details Card

              SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.plans.length,
                  itemBuilder: (context, index) => Card(
                    elevation: 3,
                    margin: const EdgeInsets.only(bottom: 8),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color:
                            press == index ? Colors.green : Colors.transparent,
                        width: 2, // سماكة الـ border
                      ),
                      borderRadius: BorderRadius.circular(8), // شكل الزوايا
                    ),
                    child: ListTile(
                      title: Text(
                        widget.plans[index].name.toUpperCase(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        setState(() {
                          press = index; // تحديث القيمة عند الضغط
                          planType = widget.plans[index].type;
                          planName = widget.plans[index].name;
                        });
                      },
                      subtitle: Text(widget.plans[index].description),
                      trailing: Text(
                        '${widget.plans[index].price} QAR / ${widget.plans[index].type}',
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Coupon Input
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextField(
                      onChanged: (coupon) {
                        setState(() {
                          couponCode = coupon;
                        });
                      },
                      controller: _couponController,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Coupon Code',
                        hintStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        labelStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white, // اللون الافتراضي للحواف
                            width: 1,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white, // اللون عند التركيز
                            width: 1, // زيادة سماكة الحواف عند التركيز
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.local_offer,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),

              SizedBox(height: 30),

              // Subscribe Button
              ElevatedButton(
                onPressed: () {
                  TrainerCubit.get(context).subScribeTrainer(
                      id: widget.ID,
                      planType: planType,
                      planName: planName,
                      coupon: couponCode);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minimumSize: Size.fromHeight(50),
                ),
                child: _isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text(
                        'Subscribe Now',
                        style: TextStyle(fontSize: 18),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
