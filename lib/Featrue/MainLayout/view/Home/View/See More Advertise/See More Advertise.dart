import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/Themes/Themes%20Cubit/themes_cubit.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../View Model/home_cubit.dart';

class SeeMoreAdvertise extends StatefulWidget {
  const SeeMoreAdvertise({super.key});

  @override
  State<SeeMoreAdvertise> createState() => _SeeMoreAdvertiseState();
}

class _SeeMoreAdvertiseState extends State<SeeMoreAdvertise> {
  late NumberPaginatorController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = NumberPaginatorController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final currentState = context.watch<ThemesCubit>().state;

    return  Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(currentState['backgroundImage']),
              // مسار الصورة
              fit: BoxFit.cover, // لجعل الصورة تغطي الخلفية بالكامل
            ),
          ),
        ),
        elevation: 0,
        title: Text('Advertise', style: Theme.of(context).textTheme.bodyLarge),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(currentState['backgroundImage']),
            // مسار الصورة
            fit: BoxFit.cover, // لجعل الصورة تغطي الخلفية بالكامل
          ),
        ),
      child: BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Column(
        children: [
          SizedBox(
            height: height * .02,
          ),
          HomeCubit.get(context)
              .advertiseModel!
              .data!
              .isNotEmpty
              ? NumberPaginator(
            showNextButton: true,
            showPrevButton: true,

            controller: controller,
            numberPages: HomeCubit.get(context)
                .advertiseModel
                ?.paginationResult
                ?.numberOfPages ??
                0,
            onPageChange: (int index) {
              HomeCubit.get(context)
                  .changeVitaminsPage(
                  controller: controller, index: index);

            },
          )
              : Center(
            child: Text('',
                style: Theme.of(context).textTheme.bodyMedium),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: HomeCubit.get(context)
                    .advertiseModel!
                    .data
                    .length,
                itemBuilder: (context, index) {
                  DateTime dateTime = DateTime.parse(
                      HomeCubit.get(context)
                          .advertiseModel!
                          .data[index]
                          .createdAt);
                  String timeAgo = timeago.format(dateTime);
            
                  return GestureDetector(
                    onTap: () {
                      HomeCubit.get(context)
                          .useAdvertiseFunction(
                        title: HomeCubit.get(context)
                            .advertiseModel!
                            .data[index]
                            .targetModel,
                        id: HomeCubit.get(context)
                            .advertiseModel!
                            .data[index]
                            .targetModelId,
                        context: context,
                        index: index,
                      );
                    },
                    child: Container(
                        height: height * .25,
                        width: width * .425,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(20),
                          image: DecorationImage(
                              image: NetworkImage(
                                HomeCubit.get(context)
                                    .advertiseModel!
                                    .data[index]
                                    .image,
                              ),
                              fit: BoxFit.cover,
                              opacity: .5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.symmetric(
                            horizontal: width * 0.05,
                            vertical: height * 0.01),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.end,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                  HomeCubit.get(context)
                                      .advertiseModel!
                                      .data[index]
                                      .title,
                                  maxLines: 2,
                                  overflow:
                                  TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium),
                              Text(timeAgo,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall)
                            ],
                          ),
                        )),
                  );
                }),
          ),
        ],
      );
  },
)
      ),

    );
  }
}
