import 'package:flutter/material.dart';

import '../../../Model/Courses Model/Courses Model.dart';
import '../Courses Details Dialog/Courses Details Dialog.dart';

class CourseWidget extends StatelessWidget {
  final Courses course;
  final double screenWidth;
  final double screenHeight;

  const CourseWidget(
      {super.key,
      required this.screenWidth,
      required this.screenHeight,
      required this.course});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => CoursesDetailsDialog(
            course: course,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 6,
            ),
          ],
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
                  course.image ?? 'https://via.placeholder.com/200',
                  height: screenHeight * 0.135,
                  width: double.infinity,
                  fit: BoxFit.cover,
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
                        course.title ?? 'No Titleeeeeeeeeee',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.04,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        SizedBox(
                          width: screenWidth * .12,
                          child: Text(
                            'Price: ',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.035,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * .25,
                          child: Text(
                            '${course.price ?? 0}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: screenWidth * 0.035,
                              decoration: TextDecoration.lineThrough,
                            ),
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
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.035,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * .2,
                          child: Text(
                            '${course.priceAfterDiscount ?? 0}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    course.description ?? '',
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
