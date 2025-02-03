import 'dart:async';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/Constant/Loading%20Indicator/Loading%20indecator.dart';
import 'package:lsfitness/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Courses%20Feature/View/Widget/Course%20Widget/Course%20Widget.dart';
import 'package:uni_links/uni_links.dart';
import '../../../../../Core/Themes/Themes Cubit/themes_cubit.dart';
import '../../../../Auth Feature/login/view_mode/login_cubit.dart';
import '../View Model/courses_cubit.dart';
import 'My Courses/view/My Courses View.dart';
import 'SeeMoreCourses/View/SeeMorePage.dart';


class CoursePage extends StatefulWidget {
  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
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
          CoursesCubit.get(context).CapturePayment(token: token!);
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
    CoursesCubit.get(context).getCoursesCategories();
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final currentState = context.watch<ThemesCubit>().state;

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.95),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(currentState['backgroundImage']), // مسار الصورة
              fit: BoxFit.cover, // لجعل الصورة تغطي الخلفية بالكامل
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Row(
              children: [
                Text(
                    'COURSES',
                    style: Theme.of(context).textTheme.bodyLarge
                ),
                SizedBox(width: screenWidth * 0.01),
                Icon(Icons.fitness_center,
                ),
              ],
            ),


            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyCoursesView()),
                    );
                  },
                  child: Text(
                      'My Courses',
                      style: Theme.of(context).textTheme.bodyMedium
                  ),
                ),
                Icon(Icons.list_alt_outlined,
                    color: Theme.of(context).secondaryHeaderColor),

              ],
            )

          ],
        ),
        backgroundColor: Colors.white30,
        elevation: 0,
        centerTitle: false,
      ),
      body: BlocConsumer<CoursesCubit, CoursesState>(
        listener: (context, state) {},
        builder: (context, state) {
          return CoursesCubit.get(context).coursesCategoriesModel == null
              ? Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(currentState['backgroundImage']),
                  fit: BoxFit.cover),
            ),
                child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyLoadingIndicator(
                            height: screenHeight * .3, color: kSecondColor),
                      ],
                    ),
                  ),
              )
              : Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(currentState['backgroundImage']),
                  fit: BoxFit.cover),
            ),
                child: ListView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.04,
                      vertical: screenHeight * 0.03,
                    ),
                    itemCount: CoursesCubit.get(context)
                        .coursesCategoriesModel!
                        .data!
                        .length,
                    itemBuilder: (context, index) {
                      final category = CoursesCubit.get(context)
                          .coursesCategoriesModel!
                          .data![index];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Positioned(
                                    top: screenHeight * 0.025,
                                    child: Container(
                                      height: screenHeight * 0.01,
                                      width: screenWidth * 0.15,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                        Colors.orangeAccent,
                                        Colors.orangeAccent.withOpacity(0.6),
                                        Colors.white30
                                      ])),
                                      margin: EdgeInsets.only(
                                          bottom: screenHeight * 0.01),
                                    ),
                                  ),
                                  Text(
                                    category.title ?? '',
                                    style: Theme.of(context).textTheme.bodyLarge
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SeeMoreCourses(
                                              categoryId: category.id.toString(),
                                              categoryName:
                                                  category.title.toString(),
                                            )),
                                  );
                                },
                                child: Text(
                                  'See More',
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context).secondaryHeaderColor,
                                    decoration:  TextDecoration.underline,
                                    decorationColor: Theme.of(context).secondaryHeaderColor
                                  )
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          SizedBox(
                            width: screenWidth,
                            height: screenHeight * 0.35,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: category.courses?.length ?? 0,
                              itemBuilder: (context, courseIndex) {
                                final course = category.courses![courseIndex];
                                return Padding(
                                  padding:
                                      EdgeInsets.only(right: screenWidth * 0.04),
                                  child: CourseWidget(
                                    screenWidth: screenWidth,
                                    screenHeight: screenHeight,
                                    course: course,
                                    isEnrolled:
                                        course.users!.contains(LoginCubit.id),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                        ],
                      );
                    },
                  ),
              );
        },
      ),
    );
  }
}
