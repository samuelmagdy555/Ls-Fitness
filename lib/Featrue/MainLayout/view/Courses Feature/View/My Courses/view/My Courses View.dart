import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lsfitness/Core/Constant/Loading%20Indicator/Loading%20indecator.dart';

import '../../../../../../../Core/Themes/Themes Cubit/themes_cubit.dart';
import '../../../View Model/courses_cubit.dart';
import '../../Courses View.dart';

class MyCoursesView extends StatefulWidget {
  const MyCoursesView({super.key});

  @override
  State<MyCoursesView> createState() => _MyCoursesViewState();
}

class _MyCoursesViewState extends State<MyCoursesView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      CoursesCubit.get(context).getMyCourses();
    });
    super.initState();
  }

  @override
  void dispose() {
    CoursesCubit.get(context).myCourses = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
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

        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title:  Text(
          'My Courses',
          style: Theme.of(context).textTheme.bodyMedium
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<CoursesCubit, CoursesState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return CoursesCubit.get(context).myCourses == null
              ? Container(

            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(currentState['backgroundImage']),
                  fit: BoxFit.cover),
            ),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(currentState['backgroundImage']),
                        fit: BoxFit.cover),
                  ),
                  child: Center(
                              child: MyLoadingIndicator(
                    height: height * .3, color: Theme.of(context).primaryColor),
                            ),
                ),
              )
              : CoursesCubit.get(context).myCourses!.data.isEmpty
              ? Center(
              child: Text(
                'No Courses Yet',
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ))
              : Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(currentState['backgroundImage']),
                  fit: BoxFit.cover),
            ),
                child: ListView.builder(
                            itemCount:
                            CoursesCubit.get(context).myCourses!.data.length,
                            itemBuilder: (context, index) {
                final course =
                CoursesCubit.get(context).myCourses!.data[index];
                return CourseCard(
                  image: 'https://img.freepik.com/free-photo/portrait-muscle-man-posing-grey-background_613910-7496.jpg?t=st=1737531896~exp=1737535496~hmac=056061919a4f8fe11b338b7d41c598c275e46f4feca908a0d89f168339dd0047&w=360',
                  title: course.title,
                  description: course.description,
                  price: course.price, // Assuming price field exists
                  discountedPrice: course.priceAfterDiscount, // Assuming discountedPrice field exists
                );
                            },
                          ),
              );
        },
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final int price;
  final int discountedPrice;

  const CourseCard({
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.discountedPrice,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left side - Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                image,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            // Right side - Text information
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [

                      Text(
                        'price',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: 4,),
                      Text(
                        '\$$price',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(width: 5),

                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Price After Discount :',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        '\$$discountedPrice',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
