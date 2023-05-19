import 'package:flutter/material.dart';

class ChooseHobbiesScreen extends StatefulWidget {
  @override
  _ChooseHobbiesScreenState createState() => _ChooseHobbiesScreenState();
}

class _ChooseHobbiesScreenState extends State<ChooseHobbiesScreen> {
  List<String> interests = [
    'Travel',
    'Food',
    'Fashion',
    'Fitness',
    'Art',
    'Music',
    'Sports',
    'Technology',
    'Gaming',
    'Pets',
  ];

  List<String> selectedInterests = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Your Interests'),
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              // Perform action on Done button press
            },
          ),
        ],
      ),
      body: GridView.builder(
        itemCount: interests.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          final interest = interests[index];
          final isSelected = selectedInterests.contains(interest);

          return GestureDetector(
            onTap: () {
              setState(() {
                if (isSelected) {
                  selectedInterests.remove(interest);
                } else {
                  selectedInterests.add(interest);
                }
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue : Colors.grey,
                borderRadius: BorderRadius.circular(16.0),
              ),
              alignment: Alignment.center,
              child: Text(
                interest,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
