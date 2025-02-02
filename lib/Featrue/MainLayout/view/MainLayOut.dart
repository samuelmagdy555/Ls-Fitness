import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lsfitness/Core/DataBase/Local_database/cach_helper.dart';
import 'package:lsfitness/Core/DataBase/remote_database/EndPoints.dart';
import 'package:lsfitness/Featrue/Auth%20Feature/login/view_mode/login_cubit.dart';
import 'package:lsfitness/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Chat%20Feature/View/chat%20View.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Home/View/FoodCalculator/view/FoodCalculator.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Home/View/Nutrition%20Feature/View/Nutrition%20View.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Meals/view/meals.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Person/View/PersonView.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Profile/view/Profile.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Settings/view/Settings.dart';
import '../../../Core/Themes/Themes Cubit/themes_cubit.dart';
import 'Alarm Feature/View/Alarms Screen/Alarms Screen.dart';
import 'Chat Feature/View Model/chat_cubit.dart';
import 'Courses Feature/View/Courses View.dart';
import 'Home/View/HomeScreen.dart';
import 'Notification/View Model/notification_cubit.dart';
import 'Notification/View/Notification View.dart';
import 'Vitamins Features/Vitamin View/Vitamin View.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeView(),
    PersonView(),
    VitaminView(),
    CoursePage(),
    ChatView(),
    NotificationsPage(),
    FoodListPage(),
    FoodCalculator(mealCategory: ''),
    NutritionView(),
    TimerScreen(
      value: false,
    ),
  ];

  final String sseUrl = '${EndPoints.baseUrL}notifications/event';

  final Map<String, String> headers = {
    'Authorization':
        'Bearer ${LoginCubit.token ?? LoginCubit.loginModel?.token}',
    'Accept': 'text/event-stream',
    'Cache-Control': 'no-cache',
    'Connection': 'keep-alive'
  };

  @override
  void initState() {
    super.initState();

    // print('before connect ${LoginCubit.id}');
    // print('after connect ${LoginCubit.id}');
    //
    // print('sseUrl $sseUrl');
    // print('headers $headers');
    // NotificationCubit.get(context).connectToServer(sseUrl, headers);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final themeCubit = BlocProvider.of<ThemesCubit>(context);
    final currentState = context.watch<ThemesCubit>().state;

    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height *
                0.14, // ارتفاع الـ Navigation Bar
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  currentState['backgroundImage'],
                ),

                fit: BoxFit.fitWidth, // ملء الخلفية
              ),
            ),
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.transparent],
                ).createShader(bounds);
              },
              blendMode: BlendMode.dstOut,
              child: Container(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildTabItem(
                    index: 0,
                    label: 'Home',
                    path: SizedBox(
                      height: height * .03,
                      width: width * .11,
                      child: CashHelper.getBoolFromCash(key: 'isMan') == true
                          ? const Image(
                              image: AssetImage('assets/images/home.png'))
                          : const Image(
                              image: AssetImage('assets/images/home.png2.png'),
                            ),
                    ),
                  ),
                  _buildTabItem(
                    index: 1,
                    label: 'exercise',
                    path: SizedBox(
                      height: height * .03,
                      width: width * .11,
                      child: CashHelper.getBoolFromCash(key: 'isMan') == true
                          ? const Image(
                              image: AssetImage('assets/images/dumbbell.png'))
                          : const Image(
                              image:
                                  AssetImage('assets/images/dumbbell.png2.png'),
                            ),
                    ),
                  ),
                  _buildTabItem(
                    index: 2,
                    label: 'Vitamins',
                    path: SizedBox(
                      height: height * .03,
                      width: width * .11,
                      child: CashHelper.getBoolFromCash(key: 'isMan') == true
                          ? const Image(
                              image:
                                  AssetImage('assets/images/protein (1).png'))
                          : const Image(
                              image:
                                  AssetImage('assets/images/protein.png2.png'),
                            ),
                    ),
                  ),
                  _buildTabItem(
                    index: 3,
                    label: 'Courses',
                    path: SizedBox(
                      height: height * .03,
                      width: width * .11,
                      child: CashHelper.getBoolFromCash(key: 'isMan') == true
                          ? const Image(
                              image: AssetImage('assets/images/notebook.png'))
                          : const Image(
                              image:
                                  AssetImage('assets/images/notebook.png2.png'),
                            ),
                    ),
                  ),
                  _buildTabItem(
                    index: 4,
                    label: 'Chat',
                    path:SizedBox(
                      height: height * .03,
                      width: width * .11,
                      child: CashHelper.getBoolFromCash(key: 'isMan') == true
                          ? const Image(
                          image: AssetImage('assets/images/chat2.png'))
                          : const Image(
                        image:
                        AssetImage('assets/images/chat.png'),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildTabItem(
                    index: 5,
                    label: 'Notification',
                    path: SizedBox(
                      height: height * .03,
                      width: width * .11,
                      child: CashHelper.getBoolFromCash(key: 'isMan') == true
                          ? const Image(
                              image: AssetImage('assets/images/woman.png'))
                          : const Image(
                              image: AssetImage('assets/images/man.png'),
                            ),
                    ),
                  ),
                  _buildTabItem(
                    index: 6,
                    label: 'Meals',
                    path: SizedBox(
                      height: height * .03,
                      width: width * .11,
                      child: CashHelper.getBoolFromCash(key: 'isMan') == true
                          ? const Image(
                              image: AssetImage('assets/images/food.png'))
                          : const Image(
                              image: AssetImage('assets/images/food.png2.png'),
                            ),
                    ),
                  ),
                  _buildTabItem(
                    index: 7,
                    label: 'Calculator',
                    path: SizedBox(
                      height: height * .03,
                      width: width * .11,
                      child: CashHelper.getBoolFromCash(key: 'isMan') == true
                          ? const Image(
                              image: AssetImage('assets/images/calculator.png'))
                          : const Image(
                              image: AssetImage(
                                  'assets/images/calculator.png2.png'),
                            ),
                    ),
                  ),
                  _buildTabItem(
                    index: 8,
                    label: 'Nutrition',
                    path: SizedBox(
                      height: height * .03,
                      width: width * .11,
                      child: CashHelper.getBoolFromCash(key: 'isMan') == true
                          ? const Image(
                              image: AssetImage('assets/images/camera.png'))
                          : const Image(
                              image:
                                  AssetImage('assets/images/camera.png2.png'),
                            ),
                    ),
                  ),
                  _buildTabItem(
                    index: 9,
                    label: 'Reminder',
                    path: SizedBox(
                      height: height * .03,
                      width: width * .11,
                      child: CashHelper.getBoolFromCash(key: 'isMan') == true
                          ? const Image(
                              image: AssetImage('assets/images/alarm.png'))
                          : const Image(
                              image: AssetImage('assets/images/alarm.png2.png'),
                            ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(
      {required int index,
      required final String label,
      required final Widget path}) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          path,
          SizedBox(
            height: 3.5,
          ),
          Text(label,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: isSelected
                        ? Theme.of(context).secondaryHeaderColor
                        : Theme.of(context)
                            .secondaryHeaderColor
                            .withOpacity(.5),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  )),
        ],
      ),
    );
  }
}
