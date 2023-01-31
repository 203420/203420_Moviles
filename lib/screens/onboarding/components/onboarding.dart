import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_app/screens/onboarding/components/content_boarding.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentPage = 0;
  List<Map<dynamic, dynamic>> boardingData = [
    {"title": "A", "title2": "test", "image": "assets/images/image.jpg"},
    {"title": "B", "title2": "test2", "image": "assets/images/image2.jpg"},
    {"title": "C", "title2": "test3", "image": "assets/images/image3.jpg"}
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: PageView.builder(
              itemBuilder: (context, index) => ContentBoarding(
                title: boardingData[index]["title"],
                title2: boardingData[index]["title2"],
                image: boardingData[index]["image"],
              ),
              itemCount: boardingData.length,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: Text("Hola"),
          ),
        ],
      ),
    );
  }
}
