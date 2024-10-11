import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';

import '../viewmodel/category_cubit.dart';

class FilterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CategoryCubit categoryCubit = CategoryCubit.get(context);
    return Scaffold(
      backgroundColor: kThirdColor,
      appBar: AppBar(
        backgroundColor: kThirdColor,
        title: Text('Filter ', style: TextStyle(fontSize: 24, color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                'Body part',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 10),
              BlocConsumer<CategoryCubit, CategoryState>(
                listener: (context, state) {
                  if (state is getBodyPartsError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to load Body Parts!')),
                    );
                  }
                },
                builder: (context, state) {


                    return Wrap(
                      spacing: 10.0,
                      runSpacing: 10.0,
                      children: categoryCubit.bodyPartsModel!.data
                          .map((bodyparts) => _buildChip(bodyparts.title))
                          .toList(),
                    );
                  }

              ),

              SizedBox(height: 20),

              Text(
                'Category',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 10),
              BlocConsumer<CategoryCubit, CategoryState>(
                listener: (context, state) {
                  if (state is getCategoryError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to load categories!')),
                    );
                  }
                },
                builder: (context, state) {

                    return Wrap(
                      spacing: 10.0,
                      runSpacing: 10.0,
                      children: categoryCubit.categoryModel!.data
                          .map((category) => _buildChip(category.title))
                          .toList(),
                    );

                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.blueGrey,
      labelStyle: TextStyle(color: Colors.white),
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
    );
  }
}
