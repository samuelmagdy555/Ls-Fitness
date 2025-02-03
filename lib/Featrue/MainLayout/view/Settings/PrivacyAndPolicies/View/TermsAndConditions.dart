import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Settings/PrivacyAndPolicies/ViewModel2/terms_and_conditions_cubit.dart';
///

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  void initState() {
    super.initState();
    // استدعاء الدالة لجلب البيانات عند فتح الصفحة
    context.read<TermsAndConditionsCubit>().termsandConditions();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Terms And Conditions",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: BlocConsumer<TermsAndConditionsCubit, TermsAndConditionsState>(
        listener: (context, state) {
          if (state is TermsAndConditionsError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("حدث خطأ أثناء تحميل البيانات!")),
            );
          }
        },
        builder: (context, state) {
          var cubit = TermsAndConditionsCubit.get(context);

          if (state is TermsAndConditionsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (cubit.privacyModel == null || cubit.privacyModel!.data.isEmpty) {
            return const Center(child: Text("لا توجد بيانات متاحة حاليًا."));
          }

          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
            child: ListView.builder(
              itemCount: cubit.privacyModel!.data.length,
              itemBuilder: (context, index) {
                var item = cubit.privacyModel!.data[index];
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.only(bottom: screenHeight * 0.02),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title ?? "عنوان غير متوفر",
                          style: TextStyle(
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          item.content ?? "لا يوجد وصف متاح",
                          style: TextStyle(fontSize: screenWidth * 0.04),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
