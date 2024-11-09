import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Home/View/FoodCalculator/view/FoodCalculatorFilter/View/FoodCalculatorFilter.dart';
import '../view_Model/food_calculator_cubit.dart';
import 'FoodCalculatorDetails/view/FoodCalulatorDetails.dart';
import 'FoodCalculatorDetails/viewmodel/food_calculator_Details_cubit.dart';

class FoodCalculator extends StatefulWidget {
  final String mealCategory;
  const FoodCalculator({super.key, required this.mealCategory});

  @override
  State<FoodCalculator> createState() => _FoodCalculatorState();
}

class _FoodCalculatorState extends State<FoodCalculator> {
  @override
  void initState() {
    super.initState();
    context.read<FoodCalculatorCubit>().getFoodCalculator(mealCategory: widget.mealCategory);
  }

  List<String> nutrientsList = [
    "calories", "proteins", "carbohydrates", "fats", "fibers", "sugar",
    "VitaminA", "VitaminB1", "VitaminB2", "VitaminB3", "VitaminB5", "VitaminB6",
    "VitaminB7", "VitaminB9", "VitaminB12", "VitaminC", "VitaminD", "VitaminE",
    "VitaminK", "calcium", "iron", "magnesium", "potassium", "sodium", "zinc",
    "copper", "manganese", "selenium"
  ];

  List<String> imageList = [
    'calories.png', 'protein.png', 'carb.png', 'fats.png', 'fiber.png', 'sugar.png',
    'vitamin-a.png', 'vitamin-b.png', 'vitamin-b.png', 'vitamin-b.png', 'vitamin-b.png',
    'vitamin-b.png', 'vitamin-b.png', 'vitamin-b.png', 'vitamin-b.png', 'vitamin-c.png',
    'vitamin-d.png', 'vitamin-e.png', 'Vitamin K.png', 'calcium.png', 'iron.png',
    'magnesium.png', 'potassium.png', 'sodium.png', 'zinc.png', 'copper.png',
    'manganese.png', 'selenium.png'
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Food Calculator',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: kThirdColor,
        elevation: 4.0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: Icon(Icons.search, color: kThirdColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.filter_list, color: Colors.white),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>FoodCalculatorFilter()));
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocConsumer<FoodCalculatorCubit, FoodCalculatorState>(
              listener: (context, state) {
                if (state is FoodCalculatorError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Error Loading')),
                  );
                }
              },
              builder: (context, state) {
                if (state is FoodCalculatorLoading) {
                  return const Center(child: CircularProgressIndicator(
                    color: kSecondColor,
                  ));
                } else if (state is FoodCalculatorSuccess) {
                  final foodCalculatorModel = state.foodCalculatorModel;
                  if (foodCalculatorModel.data.isEmpty) {
                    return const Center(
                      child: Text(
                        'No Data To Show',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: foodCalculatorModel.data.length,
                    itemBuilder: (context, index) {
                      final foodItem = foodCalculatorModel.data[index];
                      final foodId = foodItem.id;
                      List<String> foodDetails = [
                        '${foodItem.Calories} c',
                        '${foodItem.Protein ?? 0} g',
                        '${foodItem.Carbohydrates ?? 0} g',
                        '${foodItem.Fats ?? 0} g',
                        '${foodItem.Fiber ?? 0} g',
                        '${foodItem.Sugar ?? 0} g',
                        '${foodItem.VitaminA ?? 0} g',
                        '${foodItem.VitaminB1} g',
                        '${foodItem.VitaminB2} g',
                        '${foodItem.VitaminB3} g',
                        '${foodItem.VitaminB5 ?? 0} g',
                        '${foodItem.VitaminB6} g',
                        '${foodItem.VitaminB7 ?? 0} g',
                        '${foodItem.VitaminB9 ?? 0} g',
                        '${foodItem.VitaminB12} g',
                        '${foodItem.VitaminC ?? 0} g',
                        '${foodItem.VitaminD} g',
                        '${foodItem.VitaminE ?? 0} g',
                        '${foodItem.VitaminK ?? 0} g',
                        '${foodItem.Calcium} mg',
                        '${foodItem.Iron} mg',
                        '${foodItem.Magnesium} mg',
                        '${foodItem.Potassium} mg',
                        '${foodItem.Sodium} mg',
                        '${foodItem.Zinc} mg',
                        '${foodItem.Copper} mg',
                        '${foodItem.Manganese} mg',
                        '${foodItem.Selenium ?? 0} mg',
                      ];
                      return GestureDetector(
                        onTap: () {
                          FoodCalculatorDetailsCubit.get(context)
                              .fetchFoodCalculatorDetails(
                              mealId: foodId, quantities: '100');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FoodCalculatorDetails(id: foodId),
                            ),
                          );
                        },
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 15.0),
                          color: kSecondColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 6.0,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  foodItem.image,
                                  width: width * 0.8,
                                  height: height * 0.3,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  foodItem.TitleEN,
                                  maxLines: 3,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  height: height * 0.50,
                                  child: GridView.builder(
                                    itemCount: nutrientsList.length,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        childAspectRatio: 1.15,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10),
                                    itemBuilder: (context, index) => Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.asset(
                                            'assets/images/${imageList[index]}',
                                            height: 30,
                                          ),
                                          Text(
                                            nutrientsList[index],
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: kThirdColor,
                                            ),
                                          ),
                                          Text(
                                            foodDetails[index],
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: kThirdColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is FoodCalculatorError) {
                  return const Center(child: Text('Failed to load data'));
                }
                return const Center(child: Text('Unknown Error'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
