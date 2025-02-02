import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/Constant/Loading%20Indicator/Loading%20indecator.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Exercise/view/DetailsExercise/View%20Model/exercises_details_cubit.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Exercise/view/DetailsExercise/view/widget/About%20Screen/About%20Screen.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Exercise/view/DetailsExercise/view/widget/Charts%20Screen/Charts%20Screen.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Exercise/view/DetailsExercise/view/widget/History%20Screen/History%20Screen.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Exercise/view/DetailsExercise/view/widget/Progress%20Widget/Progress%20Widget.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Exercise/view/DetailsExercise/view/widget/Records%20Screen/Records%20Screen.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Exercise/view/DetailsExercise/view/widget/Video%20Widget/videowidget.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Home/View/Progress%20Feature/View%20Model/progress_cubit.dart';
import 'package:video_player/video_player.dart';
import 'package:lsfitness/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';

import '../../../../../../../Core/Themes/Themes Cubit/themes_cubit.dart';

class ExercisePage extends StatefulWidget {
  final String ID;

  // final String videoPath;

  ExercisePage({
    required this.ID,
  });

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage>
    with TickerProviderStateMixin {
  CustomSegmentedController<int>? _tabViewController;
  TabController? tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ExercisesDetailsCubit.get(context)
        .getExercisesDetails(
            id: widget.ID, context: context, isAdvertise: false);

    _tabViewController = CustomSegmentedController();
    tabController = TabController(length: 4, vsync: this);

    _tabViewController!.addListener(() {
      if (_tabViewController!.value == 1) {
        tabController!.animateTo(0);
      } else if (_tabViewController!.value == 2) {
        tabController!.animateTo(1);
      } else if (_tabViewController!.value == 3) {
        tabController!.animateTo(2);
      } else if (_tabViewController!.value == 4) {
        tabController!.animateTo(3);
      }
    });
  }

  String selectedTab = 'Progress';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    final currentState = context.watch<ThemesCubit>().state;

    return BlocConsumer<ProgressCubit, ProgressState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return BlocConsumer<ExercisesDetailsCubit, ExercisesDetailsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ExercisesDetailsCubit.get(context).exerciseDetailsModel ==
                    null ||
                ProgressCubit.get(context).progressModel == null
            ? Scaffold(
                body: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(currentState['backgroundImage']),
                        fit: BoxFit.cover),
                  ),
                  child: Center(
                    child: MyLoadingIndicator(
                      color: Theme.of(context).secondaryHeaderColor, height: 300,
                    ),
                  ),
                ),
              )
            : Scaffold(
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
                  title: Text(
                    ExercisesDetailsCubit.get(context)
                            .exerciseDetailsModel
                            ?.data
                            .title ??
                        '',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  centerTitle: true,
                ),
                body: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(currentState['backgroundImage']),
                        fit: BoxFit.cover),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomSlidingSegmentedControl<int>(
                          controller: _tabViewController!,
                          fromMax: true,
                          fixedWidth: width * .225,
                          children: {
                            1: Center(
                              child: Text(
                                'About',
                                textAlign: TextAlign.center,
                                style: tabController!.index == 0
                                    ? Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: Colors.white)
                                    : Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            color: Colors.black), // حجم النص
                              ),
                            ),
                            2: Center(
                              child: Text(
                                'History',
                                textAlign: TextAlign.center,
                                style: tabController!.index == 1
                                    ? Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: Colors.white)
                                    : Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            color: Colors.black), // حجم النص
                              ),
                            ),
                            3: Center(
                              child: Text(
                                'Charts',
                                textAlign: TextAlign.center,
                                style: tabController!.index == 2
                                    ? Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: Colors.white)
                                    : Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            color: Colors.black), // حجم النص
                              ),
                            ),
                            4: Center(
                              child: Text(
                                'Records',
                                textAlign: TextAlign.center,
                                style: tabController!.index == 3
                                    ? Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: Colors.white)
                                    : Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            color: Colors.black), // حجم النص
                              ),
                            ),
                          },
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.white, width: .5),
                          ),
                          thumbDecoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.3),
                                blurRadius: 4.0,
                                spreadRadius: 1.0,
                                offset: const Offset(
                                  0.0,
                                  2.0,
                                ),
                              ),
                            ],
                          ),
                          onValueChanged: (int value) {
                            setState(() {});
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            height: height * .2,
                            width: width,
                            child: VideoWidget(
                              id: ExercisesDetailsCubit.get(context)
                                  .exerciseDetailsModel!
                                  .data
                                  .video
                                  .publicId
                                  .toString(),
                            )),
                        SizedBox(height: 20),
                        Expanded(
                          child: TabBarView(
                              physics: NeverScrollableScrollPhysics(),
                              controller: tabController,
                              children: [
                                AboutScreen(),
                                ProgressCubit.get(context)
                                    .progressModel!
                                    .data!
                                    .isNotEmpty? HistoryScreen(
                                  volumes: ProgressCubit.get(context)
                                      .progressModel!
                                      .data!
                                      .first
                                      .volumes ?? [],
                                ) : SizedBox(),
                                SizedBox(),
                                // ChartsScreen(
                                //   id: ExercisesDetailsCubit.get(context)
                                //       .exerciseDetailsModel!
                                //       .data
                                //       .id,
                                // ),
                                SizedBox(),
                              ]),
                        )
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  },
);
  }
//
// Widget _buildTabButton(String text, bool isSelected) {
//   return Expanded(
//     child: GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedTab = text;
//         });
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: isSelected ? kSecondColor : Colors.transparent,
//           borderRadius: BorderRadius.circular(50),
//         ),
//         padding: EdgeInsets.symmetric(vertical: 10),
//         child: Text(
//           text,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             color: isSelected ? Colors.white : kThirdColor,
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     ),
//   );
// }
//
// Widget _buildContent() {
//   if (selectedTab == 'Progress') {
//     return ProgressWidget(
//       id: ExercisesDetailsCubit.get(context).exerciseDetailsModel!.data.id,
//     );
//   } else if (selectedTab == 'Muscle') {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               'REPEATS',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: kSecondColor,
//               ),
//             ),
//             Text(
//               'x12',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             Text(
//               'Sets',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: kSecondColor,
//               ),
//             ),
//             Text(
//               'x3',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 20),
//         Text(
//           'INSTRUCTIONS',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: kSecondColor,
//           ),
//         ),
//         SizedBox(height: 10),
//         Text(
//           ExercisesDetailsCubit.get(context)
//               .exerciseDetailsModel!
//               .data.Description??'',
//           style: TextStyle(
//             fontSize: 16,
//             color: Colors.white,
//           ),
//         ),
//         SizedBox(height: 20),
//         Text(
//           'FOCUS AREA',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: kSecondColor,
//           ),
//         ),
//         SizedBox(height: 10),
//         Text(
//           ExercisesDetailsCubit.get(context)
//               .exerciseDetailsModel!
//               .data.bodyPart.title??'',
//           style: TextStyle(
//             fontSize: 16,
//             color: Colors.white,
//           ),
//         ),
//         Text(
//           ExercisesDetailsCubit.get(context)
//               .exerciseDetailsModel!
//               .data.deepAnatomy[0]??'',
//           style: TextStyle(
//             fontSize: 16,
//             color: Colors.white,
//           ),
//         ),
//       ],
//     );
//   } else if (selectedTab == 'How to do') {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'How to do content: Step by step instructions.',
//           style: TextStyle(fontSize: 16, color: Colors.white),
//         ),
//       ],
//     );
//   }
//   return Container();
// }
}
