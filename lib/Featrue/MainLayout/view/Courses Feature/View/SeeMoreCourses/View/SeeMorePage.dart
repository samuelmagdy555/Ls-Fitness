import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/Constant/Loading%20Indicator/Loading%20indecator.dart';
import '../../../../../../../Core/Themes/Themes Cubit/themes_cubit.dart';
import '../ViewModel/more_courses_cubit.dart';

class SeeMoreCourses extends StatefulWidget {
  final String categoryId;
  final String categoryName;
  const SeeMoreCourses({super.key, required this.categoryId, required this.categoryName});

  @override
  State<SeeMoreCourses> createState() => _SeeMoreCoursesState();
}

class _SeeMoreCoursesState extends State<SeeMoreCourses> {
  @override
  void initState() {
    super.initState();
    MoreCoursesCubit.get(context).SeeMoreCourses(ID: widget.categoryId);
  }
  @override
  void deactivate(){
    super.deactivate();
    MoreCoursesCubit.get(context).seeMoreCourses = null;
  }

  @override
  Widget build(BuildContext context) {
    final cubit = MoreCoursesCubit.get(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final currentState = context.watch<ThemesCubit>().state;

    return Scaffold(
      backgroundColor: Colors.white,
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
        title: Text(
          widget.categoryName,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: true,

      ),
      body: BlocConsumer<MoreCoursesCubit, MoreCoursesState>(
        listener: (context, state) {
        },
        builder: (context, _) {
          final courses = cubit.seeMoreCourses?.data ?? [];

          return
            cubit.seeMoreCourses != null ?  cubit.seeMoreCourses!.data.isNotEmpty ?Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(currentState['backgroundImage']),
                  fit: BoxFit.cover),
            ),
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                final imageSize = screenWidth * 0.2; // حجم الصورة يعتمد على عرض الشاشة

                return Card(
                  color: Colors.white38,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            course.image!,
                            height: screenHeight*.1,
                            width: screenWidth*0.3,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              height: screenHeight*.1,
                              width: screenWidth*0.3,

                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                course.title,
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Colors.black
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                course.description ?? "",
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Theme.of(context).secondaryHeaderColor
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: screenWidth *.25,
                                    child: Text(
                                      "Price: ${course.price}",
                                      style:Theme.of(context).textTheme.bodyMedium!.copyWith(
                                        color: Colors.green
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth *.25,
                                    child: Text(
                                      "Discount: ${course.priceAfterDiscount}",
                                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                          color: Theme.of(context).primaryColor
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,

                                    ),

                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ) :const Center(
              child: Text(
                "No Available Courses Right Now",
                style: TextStyle(color: Colors.black),
              ),
            )
          : Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(currentState['backgroundImage']),
                    fit: BoxFit.cover),
              ),
              child: Center(child: MyLoadingIndicator(height:  300, color:Theme.of(context).secondaryHeaderColor )),
            );
        },
      ),
    );
  }
}
