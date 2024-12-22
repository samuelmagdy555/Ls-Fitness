// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:lsfitness/Core/Constant/Loading%20Indicator/Loading%20indecator.dart';
// import 'package:lsfitness/Featrue/MainLayout/view/Courses%20Feature/View%20Model/courses_cubit.dart';
// import 'package:lsfitness/Featrue/MainLayout/view/Courses%20Feature/View/Specific%20Course/View/Specific%20Course.dart';
// import 'My Courses/view/My Courses View.dart';
//
//
// class CoursesView extends StatefulWidget {
//   const CoursesView({super.key});
//
//   @override
//   State<CoursesView> createState() => _CoursesViewState();
// }
//
// class _CoursesViewState extends State<CoursesView> {
//   @override
//   void initState() {
//     CoursesCubit.get(context).getAllCourses();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.sizeOf(context).width;
//     final height = MediaQuery.sizeOf(context).height;
//
//     return Scaffold(
//       backgroundColor: const Color(0xFFF7F8FC),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: SizedBox(),
//         title: const Text(
//           'Our Courses',
//           style: TextStyle(
//               color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         actions: const [
//           Icon(Icons.notifications_outlined, color: Colors.black),
//           SizedBox(width: 16),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 16),
//             // Banner
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: const Color(0xFF785EF0),
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         width: width * 0.8,
//                         height: height * .075,
//                         child: Text(
//                           'Gain More Skills With L.S Fitness Courses',
//                           maxLines: 2,
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       CategoryChip(
//                           label: 'My Courses',
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => const MyCoursesView(),
//                                 ));
//                           },
//                           isActive: false),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 24),
//             // Categories
//
//             Text('Available Courses',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 24),
//             // Courses
//             BlocConsumer<CoursesCubit, CoursesState>(
//               listener: (context, state) {
//                 // TODO: implement listener
//               },
//               builder: (context, state) {
//                 return CoursesCubit.get(context).allCoursesModel == null
//                     ? Center(
//                         child: MyLoadingIndicator(
//                             height: height * .1, color: Colors.deepPurple),
//                       )
//                     : Expanded(
//                         child: MasonryGridView.count(
//                           itemCount: 4,
//                           itemBuilder: (context, index) {
//                             final course = CoursesCubit.get(context)
//                                 .allCoursesModel!
//                                 .data[index];
//                             return CourseCard(
//                               onTap: () {
//                                 CoursesCubit.get(context).getSpecificCoursesLesson(id: course.id);
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) =>
//                                           const SpecificCourse(),
//                                     ));
//                               },
//                               title: course.title,
//                               subtitle: course.description,
//                               duration: course.price.toString(),
//                               PriceAfterDiscount:
//                                   course.priceAfterDiscount.toString(),
//                               rating: 0,
//                               image: courses[index]['image'],
//                             );
//                           },
//                           crossAxisCount: 2,
//                           mainAxisSpacing: 10,
//                           crossAxisSpacing: 10,
//                         ),
//                       );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class CategoryChip extends StatelessWidget {
//   final String label;
//   final bool isActive;
//   final VoidCallback? onTap;
//
//   const CategoryChip({
//     Key? key,
//     required this.label,
//     this.isActive = false,
//     this.onTap,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         decoration: BoxDecoration(
//           color: isActive ? const Color(0xFF785EF0) : Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           border: Border.all(
//               color: isActive ? Colors.transparent : const Color(0xFFD3D3D3)),
//         ),
//         child: Text(
//           label,
//           style: TextStyle(
//             color: isActive ? Colors.white : Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class CourseCard extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final String duration;
//   final double rating;
//   final String image;
//   final String? PriceAfterDiscount;
//   final VoidCallback? onTap;
//
//   const CourseCard({
//     Key? key,
//     required this.title,
//     required this.subtitle,
//     required this.duration,
//     required this.rating,
//     required this.image,
//     this.PriceAfterDiscount,
//     this.onTap,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.sizeOf(context).width;
//     final height = MediaQuery.sizeOf(context).height;
//
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.2),
//               spreadRadius: 2,
//               blurRadius: 6,
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image(
//               image: NetworkImage(image),
//               height: height * .08,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//             const SizedBox(height: 16),
//             Text(
//               title,
//               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             Row(
//               children: [
//                 Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                   decoration: BoxDecoration(
//                     color: Colors.deepPurpleAccent,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Text(
//                     PriceAfterDiscount ?? '',
//                     style: const TextStyle(fontSize: 12, color: Colors.white),
//                   ),
//                 ),
//                 SizedBox(
//                   width: width * .025,
//                 ),
//                 Text(
//                   duration,
//                   style: const TextStyle(
//                       fontSize: 12,
//                       color: Colors.grey,
//                       decoration: TextDecoration.lineThrough),
//                 )
//               ],
//             ),
//             const SizedBox(height: 8),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SizedBox(
//                   width: width * .275,
//                   child: Text(
//                     subtitle,
//                     style: const TextStyle(fontSize: 12, color: Colors.grey),
//                   ),
//                 ),
//                 const Icon(
//                   Iconsax.arrow_circle_right4,
//                   color: Colors.deepPurpleAccent,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// List<Map<String, dynamic>> courses = [
//   {
//     'title': 'Horse Riding',
//     'subtitle': 'Become a professional horse rider ',
//     'duration': '5h 30min',
//     'rating': 4.9,
//     'image':
//         'https://img.freepik.com/free-photo/fashion-model-white-dress-walking-with-horse_114579-8549.jpg?t=st=1732927408~exp=1732931008~hmac=fa96dadb3fc02c7972cb7eccb0abc5c385db14fe08bfede7d6e4c5418b8b1232&w=900'
//   },
//   {
//     'title': 'Boxing course',
//     'subtitle': 'Learning is empowerment.',
//     'duration': '5h 30min',
//     'rating': 4.9,
//     'image':
//         'https://img.freepik.com/free-vector/sport-landing-page-template-with-photo_23-2148212576.jpg?t=st=1732928081~exp=1732931681~hmac=8770f777e98ae57809ecbf3faf985dad3f0fc67d6691b3bc757cb650d74f62fb&w=900'
//   },
//   {
//     'title': 'Judo',
//     'subtitle': 'Basic Judo Techniques.',
//     'duration': '5h 30min',
//     'rating': 4.9,
//     "image":
//         'https://img.freepik.com/free-psd/taekwondo-practice-landing-page_23-2149999092.jpg?t=st=1732928342~exp=1732931942~hmac=b099aea488a76ac91ab73a62f356c047ae0161ceddc92902c8d7f2219a7bc247&w=1060'
//   },
//   {
//     'title': 'Dance course',
//     'subtitle': 'A Journey to Excellence.',
//     'duration': '5h 30min',
//     'rating': 4.9,
//     'image':
//         'https://img.freepik.com/free-vector/hand-drawn-dance-school-sale-banner_23-2149416106.jpg?t=st=1732928261~exp=1732931861~hmac=03aa491642e794939d22e7786bd66392c5d96403461bd73343205a5b9f694cda&w=1060'
//   },
// ];
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/Constant/Loading%20Indicator/Loading%20indecator.dart';
import 'package:lsfitness/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';
import '../Model/Courses Model/Courses Model.dart';
import '../View Model/courses_cubit.dart';

class CoursePage extends StatefulWidget {
  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  void initState() {
    super.initState();
    CoursesCubit.get(context).CoursesCategories();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'COURSES',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.fitness_center, color: Colors.black),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: BlocConsumer<CoursesCubit, CoursesState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          final categories =
              CoursesCubit.get(context).coursesCategoriesModel!.data;

          return CoursesCubit.get(context).coursesCategoriesModel == null
              ? Center(
                  child: MyLoadingIndicator(height: screenHeight *.3, color: kSecondColor),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: categories!.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Positioned(
                              top: 20.5,
                              child: Container(
                                height: 10,
                                width:
                                    60,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                  Colors.orangeAccent,
                                  Colors.orangeAccent.withOpacity(0.6),
                                  Colors.white30
                                ])),
                                margin: const EdgeInsets.only(
                                    bottom: 5),
                              ),
                            ),
                            Text(
                              category.title ?? 'No Category Name',
                              style: TextStyle(
                                fontSize: screenWidth * 0.05,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: screenWidth,
                          height: screenHeight * 0.4,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: category.courses?.length ?? 0,
                            itemBuilder: (context, courseIndex) {
                              final course = category.courses![courseIndex];
                              return Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: workoutCard(
                                    course, screenWidth, screenHeight),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    );
                  },
                );
        },
      ),
    );
  }

  Widget workoutCard(Courses course, double screenWidth, double screenHeight) {
    return Container(
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
        width: screenWidth * 0.35,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              course.image ?? 'https://via.placeholder.com/200',
              height: screenHeight * 0.135,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenWidth * 0.3,
                    child: Text(
                      course.title ?? 'No Title',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Wrap(
                    children: [
                      Text(
                        'Price: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.035,
                        ),
                      ),
                      Text(
                        '${course.price ?? 0}',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: screenWidth * 0.035,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    children: [
                      Text(
                        'Price After Discount: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.035,
                        ),
                      ),
                      Text(
                        '${course.priceAfterDiscount ?? 0}',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.04,
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
  }
}
