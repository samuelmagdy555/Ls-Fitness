import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/Constant/Loading%20Indicator/Loading%20indecator.dart';
import 'package:lsfitness/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Notification/View%20Model/notification_cubit.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../../../Core/Themes/Themes Cubit/themes_cubit.dart';
import 'Widget/Notification Tile.dart';

class NotificationsPage extends StatefulWidget {
  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  void initState() {
    NotificationCubit.get(context).getAllNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentState = context.watch<ThemesCubit>().state;

    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(currentState['backgroundImage']), // مسار الصورة
                fit: BoxFit.cover, // لجعل الصورة تغطي الخلفية بالكامل
              ),
            ),
          ),

          title: Text('Notifications',
              style:
                  Theme.of(context).textTheme.bodyLarge),
          centerTitle: true,
          backgroundColor: Colors.black,
          elevation: 1,
          shadowColor: Colors.white24,
          actions: [
            TextButton(
              onPressed: () {
                NotificationCubit.get(context).MarkAllNotificationAsRead();
              },
              child: Text(
                'Read All',
                style:
                Theme.of(context).textTheme.bodyMedium,
              ),
            )
          ],
        ),
        body: BlocConsumer<NotificationCubit, NotificationState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return NotificationCubit.get(context).allNotificationModel == null
                ? Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(currentState['backgroundImage']),
                    fit: BoxFit.cover),
              ),
                  child: Center(
                      child: MyLoadingIndicator(height: 300, color: kSecondColor)),
                )
                : NotificationCubit.get(context)
                        .allNotificationModel!
                        .data
                        .isEmpty
                    ? Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(currentState['backgroundImage']),
                    fit: BoxFit.cover),
              ),

                      child: Center(
                          child: Text(
                          'No Notifications',
                          style: Theme.of(context).textTheme.bodyMedium,
                        )),
                    )
                    : Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(currentState['backgroundImage']),
                    fit: BoxFit.cover),
              ),

                      child: ListView.builder(
                          padding: EdgeInsets.only(top: 15),
                          itemCount: NotificationCubit.get(context)
                              .allNotificationModel!
                              .data
                              .length,
                          itemBuilder: (context, index) {
                            DateTime dateTime = DateTime.parse(
                                NotificationCubit.get(context)
                                    .allNotificationModel!
                                    .data[index]
                                    .createdAt);
                            String timeAgo = timeago.format(dateTime);
                            return NotificationTile(
                              onTap: () {
                                if (NotificationCubit.get(context)
                                        .allNotificationModel!
                                        .data[index]
                                        .read ==
                                    false) {
                                  NotificationCubit.get(context)
                                      .MarkNotificationAsRead(
                                          id: NotificationCubit.get(context)
                                              .allNotificationModel!
                                              .data[index]
                                              .id,
                                          isRead: NotificationCubit.get(context)
                                              .allNotificationModel!
                                              .data[index]
                                              .read);
                                }
                              },
                              title: NotificationCubit.get(context)
                                  .allNotificationModel!
                                  .data[index]
                                  .type,
                              subtitle: NotificationCubit.get(context)
                                  .allNotificationModel!
                                  .data[index]
                                  .message,
                              time: timeAgo,
                              isRead: NotificationCubit.get(context)
                                  .allNotificationModel!
                                  .data[index]
                                  .read,
                            );
                          }),
                    );
          },
        ));
  }
}
