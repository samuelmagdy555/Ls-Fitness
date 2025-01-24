import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../goals/Widgets/View/ProgressIndicator.dart';
import '../View Model/trainer_request_cubit.dart';

class CertificatesPage extends StatefulWidget {
  @override
  _CertificatesPageState createState() => _CertificatesPageState();
}

class _CertificatesPageState extends State<CertificatesPage> {
  final List<File> _certificates = []; // To store the uploaded images
  final ImagePicker _picker = ImagePicker();

  // Function to pick an image
  Future<void> _addCertificate() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _certificates.add(File(pickedFile.path)); // Add image to the list
      });
    }
  }

  // Function to delete a certificate
  void _deleteCertificate(int index) {
    setState(() {
      _certificates.removeAt(index); // Remove image from the list
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: size.height * 0.05),

          Padding(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
            child: ProgressSingleIndicatorWidget(
              currentStep: 9,
              totalSteps: 10,
            ),
          ),

          // Display certificates in a ListView
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              style:
              ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: _addCertificate,
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              label: Text(
                _certificates.isEmpty
                    ? 'Add Certificate'
                    : 'Add Another Certificate',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          // Display certificates in a ListView
          Expanded(
            child: _certificates.isEmpty
                ? Center(child: Text('No certificates added yet.'))
                : ListView.builder(
              itemCount: _certificates.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  shadowColor: Colors.black,
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                      vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: Image.file(
                      _certificates[index],
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text('Certificate ${index + 1}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteCertificate(index),
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: _certificates.isNotEmpty
                  ? () {
                TrainerRequestCubit.get(context).requestToBeTrainer(
                  _certificates,
                  context ,
                  TrainerRequestCubit.get(context).trainerName,
                  TrainerRequestCubit.get(context).trainerEmail,
                  TrainerRequestCubit.get(context).trainerPhone,
                  TrainerRequestCubit.get(context).trainerNationality,
                  TrainerRequestCubit.get(context).trainerExperience,
                  TrainerRequestCubit.get(context).trainerAge,
                  TrainerRequestCubit.get(context).trainerAbout,
                  TrainerRequestCubit.get(context).trainerCurrentLocation,
                  TrainerRequestCubit.get(context).trainerNumberOfTrainees,
                );
              }
                  : null,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.325, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                backgroundColor:
                _certificates.isNotEmpty ? Colors.black : Colors.grey,
              ),
              child: Text(
                "Continue",
                style: TextStyle(
                  fontSize: size.width * 0.045,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
}}
