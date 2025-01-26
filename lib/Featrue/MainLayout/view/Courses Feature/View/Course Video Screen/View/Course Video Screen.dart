import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lsfitness/Core/Constant/Loading%20Indicator/Loading%20indecator.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Courses%20Feature/View%20Model/courses_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../../Core/Themes/Themes Cubit/themes_cubit.dart';
import '../../../../Exercise/view/DetailsExercise/view/widget/Video Widget/videowidget.dart';

class CourseVideoScreen extends StatefulWidget {
  const CourseVideoScreen({super.key});

  @override
  State<CourseVideoScreen> createState() => _CourseVideoScreenState();
}

class _CourseVideoScreenState extends State<CourseVideoScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final currentState = context.watch<ThemesCubit>().state;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(currentState['backgroundImage']),
              fit: BoxFit.cover,
            ),
          ),
        ),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).focusColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Course Details'),
        centerTitle: true,
      ),
      body: BlocConsumer<CoursesCubit, CoursesState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          DateTime dateTime = DateTime.parse(
              CoursesCubit.get(context).specificLesson!.data!.createdAt!);
          String formattedDateTime = DateFormat('yyyy-MM-dd hh:mm a').format(dateTime);
          return CoursesCubit.get(context).specificLesson != null
              ? Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(currentState['backgroundImage']),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Video Player
                        SizedBox(
                          height: height * .3,
                          child: VideoWidget(
                            id: CoursesCubit.get(context)
                                .specificLesson!
                                .data!
                                .video!
                                .publicId
                                .toString(),
                          ),
                        ),
                        SizedBox(height: 20),

                        // Lesson Details
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [


                              // Created Date
                              Text(
                                'Created: ${formattedDateTime}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: width * .035,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 15),

                              // Course Details
                              _buildDetailCard(
                                'Course Title',
                                CoursesCubit.get(context)
                                    .specificLesson!
                                    .data!
                                    .course!
                                    .title,
                                width,context
                              ),
                              SizedBox(height: 10),
                              _buildDetailCard(
                                'Category',
                                CoursesCubit.get(context)
                                    .specificLesson!
                                    .data!
                                    .course!
                                    .category['title'],
                                width,context
                              ),
                              SizedBox(height: 10),

                              // Video Details

                              _buildImageCard(
                                'Video Thumbnail',
                                CoursesCubit.get(context)
                                    .specificLesson!
                                    .data!
                                    .video!
                                    .thumbnail,
                                width,context
                              ),
                              SizedBox(height: 10),

                              // Additional Resources
                              _buildImageCard(
                                'Lesson Image',
                                CoursesCubit.get(context)
                                    .specificLesson!
                                    .data!
                                    .image!,
                                width,context
                              ),
                              SizedBox(height: 10),
                              _buildPdfCard(
                                'Attachment',
                                CoursesCubit.get(context)
                                    .specificLesson!
                                    .data!
                                    .attachment!,
                                width,context
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(currentState['backgroundImage']),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: MyLoadingIndicator(
                      height: height * .4,
                      color: Colors.deepPurple,
                    ),
                  ),
                );
        },
      ),
    );
  }

  // Helper method to create consistent detail cards
  Widget _buildDetailCard(String title, String? content, double width , BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium
          ),
          SizedBox(height: 5),
          Text(
            content ?? 'N/A',
            style: TextStyle(
              fontSize: width * .035,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
  Widget _buildImageCard(String title, String? imageUrl, double width , BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Theme.of(context).primaryColor
            )
          ),
          SizedBox(height: 5),
          imageUrl != null
              ? Image.network(
            imageUrl,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Text('Failed to load image' , style:  TextStyle(
                  color: Theme.of(context).secondaryHeaderColor
              ));
            },
          )
              : Text('No image available'),
        ],
      ),
    );
  }


  Widget _buildPdfCard(String title, String? pdfUrl, double width , BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:  TextStyle(
                color: Theme.of(context).primaryColor
            )
          ),
          SizedBox(height: 5),
          pdfUrl != null
              ? ElevatedButton.icon(
            onPressed: () async {
              final Uri url = Uri.parse(pdfUrl);
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Could not launch PDF')),
                );
              }
            },
            icon: Icon(Icons.picture_as_pdf),
            label: Text('Open PDF'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepPurple,
            ),
          )
              : Text('No PDF available'),
        ],
      ),
    );
  }
}
