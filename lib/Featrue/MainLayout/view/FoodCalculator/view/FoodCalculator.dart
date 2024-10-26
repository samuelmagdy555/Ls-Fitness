import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';
import 'package:lsfitness/Featrue/MainLayout/view/FoodCalculator/view_Model/food_calculator_cubit.dart';
import 'package:lsfitness/Featrue/MainLayout/view/FoodCalculatorDetails/view/FoodCalulatorDetails.dart';
import 'package:lsfitness/Featrue/MainLayout/view/FoodCalculatorDetails/viewmodel/food_calculator_Details_cubit.dart';

class FoodCalculator extends StatefulWidget {
  const FoodCalculator({super.key});

  @override
  State<FoodCalculator> createState() => _FoodCalculatorState();
}

class _FoodCalculatorState extends State<FoodCalculator> {
  @override
  void initState() {
    super.initState();
    context.read<FoodCalculatorCubit>().getFoodCalculator();
  }

 List <String>nutrientsList = [
   "calories",
   "proteins",
   "carbohydrates",
   "fats",
   "fibers",
 ];
  List <String> imageList = [
    'calories.png',
    'protein.png',
    'carb.png',
    'fats.png',
    'fiber.png'

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
      body: BlocConsumer<FoodCalculatorCubit, FoodCalculatorState>(
        listener: (context, state) {
          if (state is FoodCalculatorError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Error Loading')),
            );
          }
        },
        builder: (context, state) {
          if (state is FoodCalculatorLoading) {
            return const Center(child: CircularProgressIndicator());
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
                final foodItem = foodCalculatorModel?.data[index];
                final foodId = foodItem?.id ?? '';
                final calories = foodItem?.calories ?? 0;
                final quantities = foodItem?.quantities ?? 0;
                final proteins = foodItem?.proteins ?? 0;
                final carbohydrates = foodItem?.carbohydrates ?? 0;
                final fats = foodItem?.fats ?? 0;
                final fibers = foodItem?.fibers ?? 0;
                List<String>? foodDetails = [
                 '$calories c',
                 '$proteins g',
                 '$carbohydrates g',
                 '$fats g',
                 '$fibers g',
                ];
                return GestureDetector(
                  onTap: () {
                    FoodCalculatorDetailsCubit.get(context)
                        .fetchFoodCalculatorDetails(
                            mealId: foodId, quantities: 100.toString());
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
                          Text(
                            foodItem?.title ?? '',
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: height * .25,
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 5,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      childAspectRatio: 1.15,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10),
                              itemBuilder: (context, index) => Container(
                                decoration:
                                    BoxDecoration(
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
    );
  }

  Widget _buildNutrientRow(String label, int value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.teal[900],
            ),
          ),
          Text(
            '$value g',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.teal[700],
            ),
          ),
        ],
      ),
    );
  }
}
