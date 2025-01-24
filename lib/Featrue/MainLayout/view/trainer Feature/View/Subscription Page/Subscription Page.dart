import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Model/Trainer Details/Trainer Details.dart';

class TrainerSubscriptionPage extends StatefulWidget {
  final List<Plan> plans; // List of plans>

  const TrainerSubscriptionPage({
    Key? key,
    required this.plans,
  }) : super(key: key);

  @override
  _TrainerSubscriptionPageState createState() =>
      _TrainerSubscriptionPageState();
}

class _TrainerSubscriptionPageState extends State<TrainerSubscriptionPage> {
  final TextEditingController _couponController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _isLoading = false;
  double _finalPrice = 0;

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

    // Simulate API call
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Subscription Successful'),
          content: Text('Thank you, ${_nameController.text}!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            )
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Subscription'),
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
                height:height*.3 ,
                child: ListView.builder(
                  itemCount: widget.plans.length,
                    itemBuilder: (context, index) => Card(
                          elevation: 3,
                          margin: const EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            title: Text(
                              widget.plans[index].name.toUpperCase(),
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(widget.plans[index].description),
                            trailing: Text(
                              '${widget.plans[index].price} QAR / ${widget.plans[index].type}',
                              style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )),
              ),

              SizedBox(height: 20),

              // Name Input
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),

              SizedBox(height: 20),

              // Coupon Input
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextField(
                      controller: _couponController,
                      decoration: InputDecoration(
                        labelText: 'Coupon Code',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.local_offer),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey[700],
                        minimumSize: Size.fromHeight(55),
                        textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      child: Text('Apply'),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),

              // Subscribe Button
              ElevatedButton(
                onPressed: _isLoading ? null : _subscribe,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
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
