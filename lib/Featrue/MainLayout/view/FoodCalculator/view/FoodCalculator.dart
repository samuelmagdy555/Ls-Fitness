import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Featrue/MainLayout/view/FoodCalculator/view_Model/food_calculator_cubit.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Calculator'),
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
          } else if (state is FoodCalculatorInitial || state is FoodCalculatorLoading) {
            final foodCalculatorModel = context.read<FoodCalculatorCubit>().foodCalculatorModel;
            if (foodCalculatorModel == null || foodCalculatorModel.data.isEmpty) {
              return const Center(child: Text('No Data To Show'));
            }
            return ListView.builder(
              itemCount: foodCalculatorModel.data.length,
              itemBuilder: (context, index) {
                final foodItem = foodCalculatorModel.data[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(foodItem.title),
                    subtitle: Text('Calories: ${foodItem.calories.toInt()}'),
                  ),
                );
              },
            );
          }
          return const Center(child: Text('UnKnown Error'));
        },
      ),
    );
  }
}
