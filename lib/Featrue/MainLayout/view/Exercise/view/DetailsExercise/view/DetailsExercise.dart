import 'package:flutter/material.dart';

class ExercisePage extends StatefulWidget {
  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  String selectedTab = 'Animation';
  String? selectedFocusArea;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Barbell Bench Press',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey[200],
                ),
                child: Image.asset(
                  'assets/images/Barbell-Bench-Press.png',
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(height: 20),


              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTabButton('Animation', selectedTab == 'Animation'),
                    _buildTabButton('Muscle', selectedTab == 'Muscle'),
                    _buildTabButton('How to do', selectedTab == 'How to do'),
                  ],
                ),
              ),

              SizedBox(height: 20),

              _buildContent(),

              SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text(
                  'CLOSE',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabButton(String text, bool isSelected) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedTab = text;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.transparent,
            borderRadius: BorderRadius.circular(50),
          ),
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (selectedTab == 'Animation') {
      return Text(
        'Animation content: Here is where the animation related content will be displayed.',
        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
      );
    } else if (selectedTab == 'Muscle') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'REPEATS',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Text(
                'x12',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),Text(
                'Sets',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Text(
                'x3',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),

          SizedBox(height: 20),

          Text(
            'INSTRUCTIONS',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Start in the regular push-up position but with your hands spread wider than your shoulders.\n\n'
                'Then push your body up and down. Remember to keep your body straight.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),

          SizedBox(height: 20),

          Text(
            'FOCUS AREA',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildFocusChip('Chest'),
              SizedBox(width: 10),
              _buildFocusChip('Triceps'),
            ],
          ),
        ],
      );


    } else if (selectedTab == 'How to do') {
      return Text(
        'How to do content: Detailed instructions on how to perform this exercise correctly.',
        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
      );
    } else {
      return Container();
    }
  }
  Widget _buildFocusChip(String label) {
    bool isSelected = selectedFocusArea == label;

    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      selectedColor: Colors.blue,
      backgroundColor: Colors.grey[200],
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.grey[700],
        fontWeight: FontWeight.bold,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),

      onSelected: (bool selected) {
        setState(() {
          selectedFocusArea = selected ? label : null;
        });
      },
    );
  }



}
