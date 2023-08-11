import 'package:flutter/material.dart';
import 'package:to_do_app/core/util/strings.dart';

import '../../../core/util/colors.dart';
import '../data/model/task_model.dart';

class TaskContainer extends StatelessWidget {
  final TaskModel taskModel;
  const TaskContainer({
    super.key,
    required this.taskModel,
  });

  Color getColor(index) {
    switch (index) {
      case 0:
        return AppColors.pink;
      case 1:
        return AppColors.green;
      case 2:
        return AppColors.mint;
      case 3:
        return AppColors.blue;
      case 4:
        return AppColors.brown;
      case 5:
        return AppColors.purple;
    }
    return AppColors.darkGrey;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 24),
      width: double.maxFinite,
      height: 128,
      decoration: BoxDecoration(
        color: getColor(taskModel.color),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Column 1
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                taskModel.title,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 8),
              // Time
              Row(
                children: [
                  const Icon(
                    Icons.timer,
                    color: AppColors.white,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${taskModel.startTime} - ${taskModel.endTime}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // note
              Text(
                taskModel.note,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
          const Spacer(),
          // Divider
          Container(
            height: 60,
            width: 1,
            color: AppColors.white,
          ),
          const SizedBox(width: 9),
          // Text
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              taskModel.complete == 0 ? AppStrings.todo : AppStrings.completed,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}