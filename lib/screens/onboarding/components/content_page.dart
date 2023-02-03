import 'package:flutter/material.dart';

AnimatedContainer page(int? index, int? currentPage) {
  return AnimatedContainer(
    duration: kThemeAnimationDuration,
    margin: const EdgeInsets.only(right: 15.0),
    height: 6,
    width: currentPage == index ? 25 : 18,
    decoration: BoxDecoration(
      color: currentPage == index ? const Color.fromARGB(255, 240, 46, 104): const Color.fromARGB(255, 209, 209, 209),
      borderRadius: BorderRadius.circular(16.5)
    ),
  );
}
