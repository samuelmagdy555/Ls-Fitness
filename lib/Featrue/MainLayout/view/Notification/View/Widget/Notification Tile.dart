import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {

  final String title;
  final String subtitle;
  final String time;
  final bool isRead;
  final VoidCallback? onTap;

  NotificationTile({
    required this.title,
    required this.subtitle,
    required this.time, required this.isRead, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(

        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(

          color: isRead != true ? Theme.of(context).disabledColor : Colors.white12,
          borderRadius: BorderRadius.circular(17.5)
        ),
        margin: EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/LogoLs.png',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.bodyMedium
                      ),
                      Text(
                        time,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.grey[600],
                        )                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.grey[600],
                    )
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
