import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContentBoarding extends StatelessWidget {
  const ContentBoarding({super.key, this.image, this.title, this.text});
  final String? image, title, text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 150, left: 35, right: 35),
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             SizedBox(
              width: 225,
              child: Image.asset(image!, height: 205,)
              ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 13),
              child: Text(
                textAlign: TextAlign.center,
                title!, 
                style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w700, color:Color.fromARGB(255, 72, 34, 138) ),
              ),
            ),
            Text(
              textAlign: TextAlign.center, 
              text!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color:Color.fromARGB(255, 73, 73, 73) ),
            ),
          ],
        ),
      ),
    );
  }
}
