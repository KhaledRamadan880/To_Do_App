import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/util/colors.dart';

import '../../../../core/util/strings.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../components/add_task_text_field.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  DateTime currentDate = DateTime.now();
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(hours: 1)));
  Color? avatarColor;
  num currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task', style: Theme.of(context).textTheme.titleLarge),
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //! Tite TextField
              AddTaskTxtField(
                controller: titleController,
                title: AppStrings.titelTxtField,
                hintText: AppStrings.enterTitle,
              ),
              //! Note TextField
              AddTaskTxtField(
                controller: noteController,
                title: AppStrings.note,
                hintText: AppStrings.enterNote,
              ),
              //! Date TextField
              AddTaskTxtField(
                title: AppStrings.date,
                hintText: DateFormat('yMd').format(currentDate),
                enabled: true,
                suffixIcon: IconButton(
                  onPressed: () async {
                    DateTime? datePicker = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2025),
                    );
                    setState(() {
                      if (datePicker != null) {
                        currentDate = datePicker;
                      }
                    });
                  },
                  icon: const Icon(Icons.calendar_month_outlined),
                ),
              ),
              //! start & end time
              Row(
                children: [
                  //! Start Time
                  Expanded(
                    child: AddTaskTxtField(
                      title: AppStrings.startTime,
                      hintText: startTime,
                      enabled: true,
                      suffixIcon: IconButton(
                        onPressed: () async {
                          TimeOfDay? timePicker = await showTimePicker(
                            context: context,
                            initialTime:
                                TimeOfDay.fromDateTime(DateTime.now()),
                          );
                          setState(() {
                            if (timePicker != null) {
                              startTime = timePicker.format(context);
                            }
                          });
                        },
                        icon: const Icon(Icons.timer_sharp),
                      ),
                    ),
                  ),
                  const SizedBox(width: 27),
                  //! End Time
                  Expanded(
                    child: AddTaskTxtField(
                      title: AppStrings.endTime,
                      hintText: endTime,
                      enabled: true,
                      suffixIcon: IconButton(
                        onPressed: () async {
                          TimeOfDay? timePicker = await showTimePicker(
                            context: context,
                            initialTime:
                                TimeOfDay.fromDateTime(DateTime.now()),
                          );
                          setState(() {
                            if (timePicker != null) {
                              endTime = timePicker.format(context);
                            }
                          });
                        },
                        icon: const Icon(Icons.timer_sharp),
                      ),
                    ),
                  ),
                ],
              ),
              //! Color Select
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.color,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.maxFinite,
                    height: 50,
                    child: Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            switch (index) {
                              case 0:
                                avatarColor = AppColors.pink;
                              case 1:
                                avatarColor = AppColors.green;
                              case 2:
                                avatarColor = AppColors.mint;
                              case 3:
                                avatarColor = AppColors.blue;
                              case 4:
                                avatarColor = AppColors.brown;
                              case 5:
                                avatarColor = AppColors.purple;
                              default:
                                avatarColor = AppColors.pink;
                            }

                            return Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      currentIndex = index;
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: avatarColor,
                                    child: index == currentIndex
                                        ? const Icon(
                                            Icons.check,
                                            color: AppColors.white,
                                          )
                                        : const Text(''),
                                  ),
                                ),
                                const SizedBox(width: 12),
                              ],
                            );
                          }),
                    ),
                  ),
                ],
              ),
              //! Create Task Button
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: double.maxFinite,
                height: 48,
                child: CustomElevatedButton(
                  onpressed: () {},
                  text: AppStrings.createTask,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
