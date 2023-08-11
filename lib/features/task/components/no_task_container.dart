 import 'package:flutter/material.dart';

import '../../../core/util/images.dart';
import '../../../core/util/strings.dart';

Center noTasksWidget(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(AppImages.noTask),
          Text(
            AppStrings.noTaskTitle,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 20,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            AppStrings.noTaskSubtitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
