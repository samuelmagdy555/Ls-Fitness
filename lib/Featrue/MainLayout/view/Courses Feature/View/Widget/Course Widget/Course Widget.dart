import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Courses%20Feature/View/Course%20Video%20Screen/Model/Specific%20Model.dart';

import '../../../../../../../Core/Themes/Themes Cubit/themes_cubit.dart';
import '../../../../../../Auth Feature/login/view_mode/login_cubit.dart';
import '../../../Model/Courses Model/Courses Model.dart';
import '../../../View Model/courses_cubit.dart';
import '../../Specific Course/View/Specific Course.dart';
import '../Courses Details Dialog/Courses Details Dialog.dart';

class CourseWidget extends StatelessWidget {
  final Courses course;
  final double screenWidth;
  final double screenHeight;
  final bool isEnrolled;

  const CourseWidget(
      {super.key,
      required this.screenWidth,
      required this.screenHeight,
      required this.course,
      required this.isEnrolled});

  @override
  Widget build(BuildContext context) {
    final currentState = context.watch<ThemesCubit>().state;

    return GestureDetector(
      onTap: () {
        if (!isEnrolled) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SpecificCourse(
                courseId: course.id.toString(),
                isEnrolled: isEnrolled,
              ),
            ),
          );
        } else {
          CoursesCubit.get(context)
              .getSpecificCoursesLesson(id: course.id.toString());
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SpecificCourse(
                courseId: course.id.toString(),
                isEnrolled: isEnrolled,
              ),
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.circular(16),

        ),
        child: SizedBox(
          width: screenWidth * 0.45,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.network(
                  'https://img.freepik.com/free-photo/portrait-muscle-man-posing-grey-background_613910-7496.jpg?t=st=1737531896~exp=1737535496~hmac=056061919a4f8fe11b338b7d41c598c275e46f4feca908a0d89f168339dd0047&w=360',
                  height: screenHeight * 0.135,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.425,
                      height: screenHeight * 0.02,
                      child: Text(
                        course.title ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                          width: screenWidth * .12,
                          child: Text(
                            'Price: ',
                            maxLines: 1,
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.black
                            )
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * .25,
                          child: Text(
                            '${course.price ?? 0}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Colors.red,
                              decoration: TextDecoration.lineThrough,
                              decorationColor:  Colors.black
                            )
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: screenWidth * .2,
                          child: Text(
                            'Price After Discount: ',
                            maxLines: 2,
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Colors.black
                            )
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * .2,
                          child: Text(
                            '${course.priceAfterDiscount ?? 0}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Colors.green
                            )
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 7.5),
              isEnrolled
                  ? SizedBox()
                  : Center(
                      child: ElevatedButton(
                          onPressed: () {
                            CoursesCubit.get(context).buyCourse(
                                ID: course.id.toString(), context: context);
                          },
                          child: Text(
                            'Enroll Now',
                            style: Theme.of(context).textTheme.bodyMedium
                          )),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
