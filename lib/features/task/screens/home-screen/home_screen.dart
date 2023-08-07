import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/util/colors.dart';
import 'package:to_do_app/core/util/strings.dart';
import 'package:to_do_app/core/widgets/custom_elevated_button.dart';

import '../../../../core/util/images.dart';
import '../Add_Task_Screen/add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Floating Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  AddTaskScreen(),
              ));
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // date
              Text(
                DateFormat.yMMMd().format(DateTime.now()),
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 24,
                    ),
              ),
              const SizedBox(height: 12),
              // Today text
              Text(
                AppStrings.today,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 24,
                    ),
              ),
              const SizedBox(height: 14),
              // Date picker
              DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColors.primary,
                selectedTextColor: AppColors.white,
                dateTextStyle: Theme.of(context).textTheme.titleMedium!,
                monthTextStyle: Theme.of(context).textTheme.titleMedium!,
                dayTextStyle: Theme.of(context).textTheme.titleMedium!,
                onDateChange: (date) {
                  // New date selected
                  // setState(() {
                  //   _selectedValue = date;
                  // });
                },
              ),
              const SizedBox(height: 30),

              // no task
              // noTasksWidget(context),

              // Tasks
              InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: const EdgeInsets.all(24),
                          width: double.maxFinite,
                          height: 240,
                          color: AppColors.deepGrey,
                          child: Column(
                            children: [
                              // Task Complete
                              SizedBox(
                                height: 48,
                                width: double.infinity,
                                child: CustomElevatedButton(
                                  text: AppStrings.taskComplete,
                                  onpressed: () {},
                                ),
                              ),
                              const SizedBox(height: 24),
                              // Task Delete
                              SizedBox(
                                height: 48,
                                width: double.infinity,
                                child: CustomElevatedButton(
                                  text: AppStrings.taskDelete,
                                  onpressed: () {},
                                  backgroundColor: AppColors.pink,
                                ),
                              ),
                              const SizedBox(height: 24),
                              // Cancel
                              SizedBox(
                                height: 48,
                                width: double.infinity,
                                child: CustomElevatedButton(
                                  text: AppStrings.cancel,
                                  onpressed: () {},
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: const TaskContainer()),
            ],
          ),
        ),
      ),
    );
  }

  Center noTasksWidget(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(AppImages.no_task),
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
}

class TaskContainer extends StatelessWidget {
  const TaskContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 24),
      width: double.maxFinite,
      height: 128,
      decoration: BoxDecoration(
        color: AppColors.pink,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Column
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.task_1,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    Icons.timer,
                    color: AppColors.white,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '09:33 PM - 09:48 PM',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                AppStrings.learnDart,
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
              'TODO',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
