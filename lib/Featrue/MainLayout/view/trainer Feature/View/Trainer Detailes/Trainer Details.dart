import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lsfitness/Featrue/MainLayout/view/trainer%20Feature/View%20Model/trainer_cubit.dart';

import '../../Model/Trainer Details/Trainer Details.dart';

class TrainerProfilePage extends StatelessWidget {
  TrainerProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TrainerCubit.get(context).detailsTrainerProfile!.name),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            _buildHeaderSection(context),

            // Bio Section
            _buildBioSection(context),

            // Certificates Section
            if (TrainerCubit.get(context)
                .detailsTrainerProfile!
                .certificates
                .isNotEmpty)
              _buildCertificatesSection(context),

            // Plans Section
            if (TrainerCubit.get(context)
                .detailsTrainerProfile!
                .plans
                .isNotEmpty)
              _buildPlansSection(context),

            // Subscribers Section
            if (TrainerCubit.get(context)
                .detailsTrainerProfile!
                .subscribers
                .isNotEmpty)
              _buildSubscribersSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.blueGrey[700],
      child: Row(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/default_trainer.png'),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TrainerCubit.get(context).detailsTrainerProfile!.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${TrainerCubit.get(context).detailsTrainerProfile!.yearsOfExperience} Years Experience',
                  style: const TextStyle(color: Colors.white70),
                ),
                Text(
                  TrainerCubit.get(context).detailsTrainerProfile!.location,
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBioSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About Me',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            TrainerCubit.get(context).detailsTrainerProfile!.bio,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildCertificatesSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Certificates',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: TrainerCubit.get(context)
                  .detailsTrainerProfile!
                  .certificates
                  .length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CachedNetworkImage(
                    imageUrl: TrainerCubit.get(context)
                        .detailsTrainerProfile!
                        .certificates[index],
                    width: 100,
                    height: 120,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlansSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Training Plans',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ...TrainerCubit.get(context)
              .detailsTrainerProfile!
              .plans
              .map((plan) => Card(
                    elevation: 3,
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      title: Text(
                        plan.name.toUpperCase(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(plan.description),
                      trailing: Text(
                        '${plan.price} EGP / ${plan.type}',
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )),
        ],
      ),
    );
  }

  Widget _buildSubscribersSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Subscribers (${TrainerCubit.get(context).detailsTrainerProfile!.totalTrainees})',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Total Active Trainees: ${TrainerCubit.get(context).detailsTrainerProfile!.subscribers.length}',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
