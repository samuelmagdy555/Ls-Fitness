import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScrollEndDemo(),
    );
  }
}

class ScrollEndDemo extends StatefulWidget {
  @override
  _ScrollEndDemoState createState() => _ScrollEndDemoState();
}

class _ScrollEndDemoState extends State<ScrollEndDemo> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Listen for scroll events
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        bool isAtBottom = _scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent;
        if (isAtBottom) {
          print('Reached the end of the list');
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Clean up the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView Scroll End')),
      body: ListView.builder(
        controller: _scrollController, // Attach the controller
        itemCount: 50, // Example item count
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index'),
          );
        },
      ),
    );
  }
}
