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
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Course Details'),
        centerTitle: true,
      ),
      body: BlocBuilder<CoursesCubit, CoursesState>(
        builder: (context, state) {
          final specificLesson = CoursesCubit.get(context).specificLesson;

          // Show loading if data is null
          if (specificLesson?.data == null) {
            return Container(
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
          }

          // Once data is available, format the date
          final DateTime dateTime = DateTime.parse(specificLesson!.data!.createdAt!);
          final String formattedDateTime = DateFormat('yyyy-MM-dd hh:mm a').format(dateTime);

          return Container(
            height: double.infinity,
            width: double.infinity,
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
                  if (specificLesson.data?.video?.publicId != null)
                    SizedBox(
                      height: height * .3,
                      child: VideoWidget(
                        id: specificLesson.data!.video!.publicId.toString(),
                      ),
                    ),
                  const SizedBox(height: 20),

                  // Lesson Details
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Created: $formattedDateTime',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: width * .035,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 15),

                        _buildDetailCard(
                          'Course Title',
                          specificLesson.data?.course?.title,
                          width,
                          context,
                        ),
                        const SizedBox(height: 10),

                        if (specificLesson.data?.course?.category != null)
                          _buildDetailCard(
                            'Category',
                            specificLesson.data!.course!.category['title'],
                            width,
                            context,
                          ),
                        const SizedBox(height: 10),

                        if (specificLesson.data?.video?.thumbnail != null)
                          _buildImageCard(
                            'Video Thumbnail',
                            specificLesson.data!.video!.thumbnail,
                            width,
                            context,
                          ),
                        const SizedBox(height: 10),

                        if (specificLesson.data?.image != null)
                          _buildImageCard(
                            'Lesson Image',
                            specificLesson.data!.image,
                            width,
                            context,
                          ),
                        const SizedBox(height: 10),

                        if (specificLesson.data?.attachment != null)
                          _buildPdfCard(
                            'Attachment',
                            specificLesson.data!.attachment,
                            width,
                            context,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

// Rest of the widget methods remain the same...
}

  // Helper method to create consistent detail cards
  Widget _buildDetailCard(
      String title, String? content, double width, BuildContext context) {
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
          Text(title, style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(height: 5),
          Text(
            content ?? 'N/A',
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildImageCard(
      String title, String? imageUrl, double width, BuildContext context) {
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
          Text(title, style: Theme.of(context).textTheme.bodyMedium),
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
                    return Text('Failed to load image',
                        style: Theme.of(context).textTheme.bodyMedium
                    );
                  },
                )
              : Text('No image available'),
        ],
      ),
    );
  }

  Widget _buildPdfCard(
      String title, String? pdfUrl, double width, BuildContext context) {
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
          Text(title, style: TextStyle(color: Theme.of(context).primaryColor)),
          SizedBox(height: 5),
          pdfUrl != null
              ? ElevatedButton.icon(
                  onPressed: () async {
                    final Uri url = Uri.parse(pdfUrl);
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url,
                          mode: LaunchMode.externalApplication);
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

