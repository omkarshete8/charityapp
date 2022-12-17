import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  const Circle({super.key, required this.num, required this.colorScheme});

  final int num;
  final Color colorScheme;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 40,
      width: 40,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: colorScheme,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          num.toString(),
          textAlign: TextAlign.center,
        ),
      ),
      duration: const Duration(milliseconds: 200),
    );
  }
}
