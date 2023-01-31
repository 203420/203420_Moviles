import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContentBoarding extends StatelessWidget {
  const ContentBoarding({super.key, this.title, this.title2, this.image});
  final String? title, title2, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title!),
        SizedBox(
          width: 100,
          child: Image.asset(image!)
          ),
        Text(title2!),
      ],
    );
  }
}
