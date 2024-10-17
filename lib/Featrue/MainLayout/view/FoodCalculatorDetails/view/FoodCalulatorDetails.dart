import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Featrue/MainLayout/view/FoodCalculatorDetails/viewmodel/food_calculator_Details_cubit.dart';

class FoodCalculatorDetails extends StatefulWidget {
  final String id;

  const FoodCalculatorDetails({super.key, required this.id});

  @override
  State<FoodCalculatorDetails> createState() => _FoodCalculatorDetailsState();
}

class _FoodCalculatorDetailsState extends State<FoodCalculatorDetails> {
  final TextEditingController _quantityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Calculator Details'),
        backgroundColor: Colors.teal,
      ),
      body:
          BlocConsumer<FoodCalculatorDetailsCubit, FoodCalculatorDetailsState>(
              listener: (context, state) {
        if (state is FoodCalculatorDetailsError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Error loading details')),
          );
        }
      }, builder: (context, state) {
            if (state is FoodCalculatorDetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
        final calculationData = FoodCalculatorDetailsCubit.get(context)
            .foodCalculatorDetails!
            .data
            .calculationData;

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter the quantity in grams:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _quantityController,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    labelText: 'Quantity (grams)',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a quantity';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context
                          .read<FoodCalculatorDetailsCubit>()
                          .fetchFoodCalculatorDetails(
                            mealId: widget.id,
                            quantities: _quantityController.text,
                          );
                    }
                  },
                  child: const Text('Calculate'),
                ),
                const SizedBox(height: 20),
                if (calculationData != null) ...[
                  _buildNutrientRow(
                    'Proteins',
                    calculationData.protein,
                  ),
                  _buildNutrientRow('Calories', calculationData.calories),
                  _buildNutrientRow('Carbohydrates', calculationData.carbs),
                  _buildNutrientRow('Fats', calculationData.fats),
                  _buildNutrientRow('Fibers', calculationData.fibers),
                ] else ...[
                  const Center(
                      child: Text('No Data Available',
                          style: TextStyle(color: Colors.black))),
                ],
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildNutrientRow(String label, num value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label:',
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          Text(
            '$value g',
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
