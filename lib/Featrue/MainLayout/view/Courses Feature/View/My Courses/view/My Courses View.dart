import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lsfitness/Core/Constant/Loading%20Indicator/Loading%20indecator.dart';

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

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'My Courses',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<CoursesCubit, CoursesState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return CoursesCubit.get(context).myCourses == null
              ? Center(
                  child: MyLoadingIndicator(
                      height: height * .3, color: Colors.deepPurple),
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
                  : MasonryGridView.count(
                      itemCount:
                          CoursesCubit.get(context).myCourses!.data.length,
                      itemBuilder: (context, index) {
                        final course =
                            CoursesCubit.get(context).myCourses!.data[index];
                        return CourseCard(
                          title: course.title,
                          subtitle: course.description,
                          duration: '',
                          rating: 0,
                          image: courses[index]['image'],
                        );
                      },
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    );
        },
      ),
    );
  }
}
