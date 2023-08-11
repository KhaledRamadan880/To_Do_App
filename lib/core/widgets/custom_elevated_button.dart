import 'package:flutter/material.dart';

import '../util/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      required this.text,
      required this.onpressed,
      this.backgroundColor = AppColors.primary});

  final String text;
  final VoidCallback onpressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
      ),
      child: Text(text),
    );
  }
}
