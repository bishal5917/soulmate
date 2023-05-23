import 'package:flutter/material.dart';
import 'package:soulmate/src/core/app/colors.dart';
import 'package:soulmate/src/core/app/dimensions.dart';
import 'package:soulmate/src/widgets/custom_text.dart';

class ChooseHobbiesScreen extends StatefulWidget {
  @override
  _ChooseHobbiesScreenState createState() => _ChooseHobbiesScreenState();
}

class _ChooseHobbiesScreenState extends State<ChooseHobbiesScreen> {
  List<String> selectedInterests = [];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: interests.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2.0,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4),
      itemBuilder: (BuildContext context, int index) {
        final interest = interests[index].name;
        final icons = interests[index].icon;
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
          child: Container(
              decoration: BoxDecoration(
                color: isSelected
                    ? OColors.kPrimaryMainColor
                    : OColors.backgroundColor,
                borderRadius: BorderRadius.circular(16.0),
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icons,
                    size: 18,
                    color:
                        !isSelected ? OColors.kPrimaryMainColor : Colors.white,
                  ),
                  hSizedBox1,
                  CustomText.ourText(interest,
                      fontSize: 15,
                      color: isSelected ? Colors.white : Colors.black87)
                ],
              )),
        );
      },
    );
  }
}

class Interest {
  final String name;
  final IconData icon;

  Interest({required this.name, required this.icon});
}

List<Interest> interests = [
  Interest(name: "Sports", icon: Icons.sports_soccer),
  Interest(name: "Music", icon: Icons.music_note),
  Interest(name: "Reading", icon: Icons.book),
  Interest(name: "Art", icon: Icons.brush),
  Interest(name: "Travel", icon: Icons.airplanemode_active),
  Interest(name: "Cooking", icon: Icons.restaurant),
  Interest(name: "Fashion", icon: Icons.accessibility),
  Interest(name: "Gaming", icon: Icons.videogame_asset),
  Interest(name: "Fitness", icon: Icons.fitness_center),
  Interest(name: "Dancing", icon: Icons.music_note),
  Interest(name: "Movies", icon: Icons.movie),
  Interest(name: "Food", icon: Icons.fastfood),
  Interest(name: "Technology", icon: Icons.devices),
  Interest(name: "Nature", icon: Icons.nature),
  Interest(name: "Pets", icon: Icons.pets),
  Interest(name: "Cars", icon: Icons.directions_car),
  Interest(name: "Coding", icon: Icons.code),
  Interest(name: "Biking", icon: Icons.directions_bike),
  Interest(name: "Yoga", icon: Icons.spa),
];
