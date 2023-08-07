import 'package:flutter/material.dart';

import '../util/colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onpressed,
  });

  final String text;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onpressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.white.withOpacity(0.44),
              ),
        ));
  }
}
