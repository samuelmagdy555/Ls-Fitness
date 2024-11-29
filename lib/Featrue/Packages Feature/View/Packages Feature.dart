import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'Widget/Packages Card.dart';

class PackagesView extends StatefulWidget {
  const PackagesView({super.key});

  @override
  State<PackagesView> createState() => _PackagesViewState();
}

class _PackagesViewState extends State<PackagesView>
    with SingleTickerProviderStateMixin {
  late final PageController _pageController1;
  late final PageController _pageController2;

  @override
  void initState() {
    super.initState();
    _pageController1 = PageController(
      initialPage: 0,
      viewportFraction: 0.85,
    );
    _pageController2 = PageController(
      initialPage: 0,
      viewportFraction: 0.85,
    );

    _pageController1.addListener(() {
      if (_pageController1.hasClients && _pageController2.hasClients) {
        _pageController2.jumpTo(_pageController1.offset,);
      }
    });
  }

  @override
  void dispose() {
    _pageController1.dispose();
    _pageController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.9),
      body: Column(
        children: [
          Expanded(
              child: SizedBox(
            child: PageView.builder(
              controller: _pageController2,
              itemCount: 5,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(20.0), child: PricingCard()),
            ),
          )),
          Container(
            height: height * .35,
            width: width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35), topRight: Radius.circular(35)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: height * .0085,
                      width: width * .075,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.black38),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      "Choose a plan",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: width * .04,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: height * .015,
                  ),
                  SizedBox(
                    height: height * .175,
                    child: PageView.builder(
                      allowImplicitScrolling: true,
                      controller: _pageController1,
                      itemCount: 5,
                      physics: AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: width * .8,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.deepPurpleAccent,
                                  width: width * .002),
                              borderRadius: BorderRadius.circular(25)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Monthly",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: width * .04,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: width * .02,
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        decoration: BoxDecoration(
                                            color: Colors.deepPurpleAccent,
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        child: Center(
                                          child: Text(
                                            'New',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: width * .03),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * .01,
                                  ),
                                  Text(
                                    "Selver Plan",
                                    style: TextStyle(
                                        color: Colors.black26,
                                        fontSize: width * .04,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "1 month",
                                    style: TextStyle(
                                        color: Colors.black26,
                                        fontSize: width * .04,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "125\$",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: width * .04,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: height * .01,
                                  ),
                                  Text(
                                    "For 6 Months",
                                    style: TextStyle(
                                        color: Colors.black26,
                                        fontSize: width * .04,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Save 25\$",
                                    style: TextStyle(
                                        color: Colors.black26,
                                        fontSize: width * .04,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * .015,
                  ),
                  Container(
                    width: width,
                    height: height * .06,
                    decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(25)),
                    child: Center(
                      child: Text(
                        'Subscribe',
                        style: TextStyle(
                            color: Colors.white, fontSize: width * .04),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget MyRow(String title, IconData icon, double height, double width) =>
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: height * .1,
                width: width * .4,
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.5,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            Icon(
              icon,
              color: Colors.green,
            )
          ],
        ),
      );
}
