import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lsfitness/Core/Constant/Loading%20Indicator/Loading%20indecator.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Courses%20Feature/View%20Model/courses_cubit.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Courses%20Feature/View/Course%20Video%20Screen/View/Course%20Video%20Screen.dart';
import 'package:uni_links/uni_links.dart';

import '../../../../../../../Core/Themes/Themes Cubit/themes_cubit.dart';

class SpecificCourse extends StatefulWidget {
  bool isEnrolled;
  final String courseId;

  SpecificCourse({super.key, required this.courseId, required this.isEnrolled});

  @override
  State<SpecificCourse> createState() => _SpecificCourseState();
}

class _SpecificCourseState extends State<SpecificCourse> {
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
              .firstMatch(CoursesCubit.get(context).buyCourseModel!.approvalUrl)
              ?.group(1);
          print('token =>>>>>>>>>>>>>>>>>>>> $token');
          CoursesCubit.get(context).CapturePaymentForLessonScreen(
            token: token!,
            Id: widget.courseId,
            isEnrolled: widget.isEnrolled,
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

  @override
  void initState() {
    _initDeepLinkListener();
    super.initState();
    if (widget.isEnrolled == true) {
      CoursesCubit.get(context).getSpecificCoursesLesson(id: widget.courseId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final currentState = context.watch<ThemesCubit>().state;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(currentState['backgroundImage']),
                // مسار الصورة
                fit: BoxFit.cover, // لجعل الصورة تغطي الخلفية بالكامل
              ),
            ),
          ),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text('Course', style: Theme.of(context).textTheme.bodyLarge),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Iconsax.arrow_left_2,
              color: Theme.of(context).focusColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: widget.isEnrolled == true
            ? BlocConsumer<CoursesCubit, CoursesState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return CoursesCubit.get(context).specificCourseLessonModel !=
                          null
                      ? CoursesCubit.get(context)
                              .specificCourseLessonModel!
                              .data!
                              .isNotEmpty
                          ? Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        currentState['backgroundImage']),
                                    fit: BoxFit.cover),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: width,
                                    margin: EdgeInsets.all(12),
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Theme.of(context)
                                          .secondaryHeaderColor,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: height * .01,
                                        ),
                                        Text(
                                          CoursesCubit.get(context)
                                              .specificCourseLessonModel!
                                              .data![0]
                                              .course!
                                              .title!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(color: Colors.black),
                                        ),
                                        Text(
                                          '${CoursesCubit.get(context).specificCourseLessonModel!.data!.length.toString()} Lessons',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: height * .01,
                                        ),
                                        Text(
                                          CoursesCubit.get(context)
                                              .specificCourseLessonModel!
                                              .data![0]
                                              .type!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * .01,
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Lessons',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge),
                                            Text('Videos',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * .01,
                                      ),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: CoursesCubit.get(context)
                                            .specificCourseLessonModel!
                                            .data!
                                            .length,
                                        itemBuilder: (context, index) => Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 10),
                                                  padding: EdgeInsets.all(15),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          color: Colors.grey)),
                                                  child: Center(
                                                    child: Text('${index + 1}',
                                                        style: TextStyle(
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width * .25,
                                                  child: Text(
                                                      CoursesCubit.get(context)
                                                          .specificCourseLessonModel!
                                                          .data![index]
                                                          .title!,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium),
                                                ),
                                                Spacer(),
                                                GestureDetector(
                                                  onTap: () async {
                                                    print(CoursesCubit.get(
                                                            context)
                                                        .specificCourseLessonModel!
                                                        .data![index]
                                                        .video!
                                                        .thumbnail!);
                                                    CoursesCubit.get(context)
                                                        .getSpecificLesson(
                                                            id: CoursesCubit
                                                                    .get(
                                                                        context)
                                                                .specificCourseLessonModel!
                                                                .data![index]
                                                                .id!);
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              CourseVideoScreen(),
                                                        ));
                                                  },
                                                  child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 30,
                                                              vertical: 10),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 20,
                                                              vertical: 12),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          border: Border.all(
                                                              color: Theme.of(
                                                                      context)
                                                                  .focusColor)),
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Iconsax.play,
                                                            size: 17.5,
                                                          ),
                                                          Text(' Play Video',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyMedium)
                                                        ],
                                                      )),
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              thickness: 1,
                                              color:
                                                  Theme.of(context).focusColor,
                                              endIndent: height * .025,
                                              indent: height * .025,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          : Center(
                              child:
                                  Text('No Lessons Available for this course'))
                      : Center(
                          child: MyLoadingIndicator(
                              height: height * .3, color: Colors.deepPurple),
                        );
                },
              )
            : Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(currentState['backgroundImage']),
                fit: BoxFit.cover),
          ),

              child: Center(
                  child: Container(
                    height: height * .2,
                    width: width * .85,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'You are not enrolled in this course',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: width * .04,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                    Colors.deepPurpleAccent)),
                            onPressed: () {
                              CoursesCubit.get(context).buyCourse(
                                  ID: widget.courseId, context: context);
                            },
                            //9KA80247WN3486405
                            child: Text(
                              'Enroll Now',
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    ),
                  ),
                ),
            ),
      ),
    );
  }
}
