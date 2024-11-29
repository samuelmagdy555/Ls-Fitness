import 'package:flutter/material.dart';

class SubscriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
       
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title Section
                Text(
                  'Train smarter with LS Fitness PRO.',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: width*.04,
                    fontWeight: FontWeight.bold,
                    color: Colors.white60,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Unlock the most intuitive and powerful workout tracker, designed to push you towards your fitness goals.',
                  style: TextStyle(
                    fontSize: width*.05,
                    color: Colors.white,
                    fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 30),
                // Subscription Options
                buildSubscriptionOption(
                  title: 'QAR 17.99 MONTHLY',
                  subtitle: 'Start 1-Month Free Trial',
                  backgroundColor: Colors.white,
                  borderColor: Colors.black26,
                  textColor: Colors.black,
                  onPressed: () {},
                ),
                SizedBox(height: 16),
                buildSubscriptionOption(
                  title: 'QAR 109.99 YEARLY',
                  subtitle: 'Start 1-Year Subscription',
                  backgroundColor: Colors.blue,
                  borderColor: Colors.transparent,
                  textColor: Colors.white,
                  onPressed: () {},
                ),
                SizedBox(height: 16),
                buildSubscriptionOption(
                  title: 'QAR 399.99 ONCE',
                  subtitle: 'Unlock PRO Forever',
                  backgroundColor: Colors.white,
                  borderColor: Colors.black26,
                  textColor: Colors.black,
                  onPressed: () {},
                ),
                SizedBox(height: 24),
                // Policy Text
                Text(
                  'LS Fitness PRO. PRO is available as a monthly or yearly subscription. LS Fitness will automatically charge your iTunes Account at the end of your subscription or free trial period unless auto-renew is turned off at least 24 hours before the end of your current period. Subscriptions renew at the original price. LS Fitness PRO Forever is a one time in-app purchase.',

                  style: TextStyle(fontSize: 14, color: Colors.white60),
                ),
                SizedBox(height: 16),
                Text(
                  'You can turn off auto-renew at any time and still receive full functionality until the end of your current period, but we can’t refund unused portions of the subscription. In-app purchases and subscriptions cannot be shared using Family Sharing.',
                  style: TextStyle(fontSize: 14, color: Colors.white60),
                ),
                // Footer Links
                SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    footerLink('Restore Purchases', () {}),
                    footerLink('Manage Subscriptions', () {}),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    footerLink('Privacy Policy', () {}),
                    footerLink('Terms of Service', () {}),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSubscriptionOption({
    required String title,
    required String subtitle,
    required Color backgroundColor,
    required Color borderColor,
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 14,
                color: textColor.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget footerLink(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
