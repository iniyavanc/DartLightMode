// ignore_for_file: prefer_const_constructors_in_immutables, use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Widget child;
  final double widthFactor;
  final double heightFactor;
  final VoidCallback? onPressed;
  final BorderSide borderColor;

  Button({
    Key? key,
    required this.child,
    this.onPressed,
    this.widthFactor = 0.4,
    this.heightFactor = 0.06,
    this.borderColor = BorderSide.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * heightFactor,
      width: widthFactor != 0 ? screenSize.width * widthFactor : null,
      decoration: BoxDecoration(
          color: Color(0xFFFF7D65), borderRadius: BorderRadius.circular(10)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFFF7D65),
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), side: borderColor)),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
