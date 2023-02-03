import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_app/pages/login.dart';
import 'package:new_app/screens/onboarding/components/content_boarding.dart';
import 'package:new_app/screens/onboarding/components/content_page.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentPage = 0;
  final PageController pageCtrl = PageController();
  List<Map<dynamic, dynamic>> boardingData = [
    {
      "title": "ESPARCIMIENTO",
      "text": "Brindamos todos los servicios para consentir a tu mascota",
      "image": "assets/images/B1.png"
    },
    {
      "title": "ADOPCIÓN",
      "text":
          "Nulla facibus tellus ut odio scelerisque, vitae molestie lectus feugiat",
      "image": "assets/images/B2.png"
    },
    {
      "title": "HOSPITALIDAD",
      "text":
          "Nulla facibus tellus ut odio scelerisque, vitae molestie lectus feugiat",
      "image": "assets/images/B3.png"
    },
    {
      "title": "VETERINARIA",
      "text":
          "Nulla facibus tellus ut odio scelerisque, vitae molestie lectus feugiat",
      "image": "assets/images/B4.png"
    },
    {
      "title": "TIENDA",
      "text": "Compra todas las necesidades de tu mascota sin salir de casa",
      "image": "assets/images/B5.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              controller: pageCtrl,
              itemBuilder: (context, index) => ContentBoarding(
                title: boardingData[index]["title"],
                text: boardingData[index]["text"],
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
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(boardingData.length,
                        (index) => page(index, currentPage)),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 60, bottom: 40),
              child: SizedBox(
                width: 320,
                child: OutlinedButton(
                  onPressed: () {
                    if (currentPage == boardingData.length-1){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                    }  
                    pageCtrl.nextPage(duration: kThemeAnimationDuration, curve: Curves.ease);
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                    backgroundColor: currentPage == boardingData.length -1 ? const Color.fromRGBO(117,167,86,1.000) : null, 
                    side: BorderSide(width: 1.5, color: currentPage == boardingData.length -1 ? Colors.white : const Color.fromARGB(255, 116, 116, 116),)
                  ),
                  child: Text(
                    currentPage == boardingData.length -1 ? 'Continuar' : 'Siguiente',
                    style: TextStyle(
                      fontSize: 17,
                      color: currentPage == boardingData.length -1 ? Colors.white : const Color.fromARGB(255, 97, 97, 97),
                      
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
