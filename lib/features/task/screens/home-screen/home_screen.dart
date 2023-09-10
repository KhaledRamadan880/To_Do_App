import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/util/colors.dart';
import 'package:to_do_app/core/util/strings.dart';
import 'package:to_do_app/core/widgets/custom_elevated_button.dart';
import 'package:to_do_app/features/task/cubit/task_cubit.dart';
import '../../components/no_task_container.dart';
import '../../components/task_container.dart';
import '../../cubit/task_state.dart';
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
      //! Floating Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddTaskScreen(),
              ));
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add),
      ),
      //! Body
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.h),
          child: BlocBuilder<TaskCubit, TaskState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //! date
                  Row(
                    children: [
                      Text(
                        DateFormat.yMMMd().format(DateTime.now()),
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 24),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.light_mode,
                        color: AppColors.background,
                      ),
                      //! Switch Button
                      Switch(                        
                        value: BlocProvider.of<TaskCubit>(context).isDark,
                        onChanged: (newValue) {
                          BlocProvider.of<TaskCubit>(context)
                              .changeTheme(newValue);
                        },
                        activeColor: AppColors.white,
                      ),
                      const Icon(
                        Icons.dark_mode,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),

                  //! Today text
                  Text(
                    AppStrings.today,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 24,
                        ),
                  ),
                  SizedBox(height: 14.h),

                  //! Date picker
                  DatePicker(
                    DateTime.now(),
                    initialSelectedDate: DateTime.now(),
                    selectionColor: AppColors.primary,
                    selectedTextColor: AppColors.white,
                    dateTextStyle: Theme.of(context).textTheme.titleMedium!,
                    monthTextStyle: Theme.of(context).textTheme.titleMedium!,
                    dayTextStyle: Theme.of(context).textTheme.titleMedium!,
                    onDateChange: (date) {
                      return BlocProvider.of<TaskCubit>(context)
                          .getSelectedDate(date);
                    },
                  ),
                  SizedBox(height: 30.h),

                  //!  Tasks
                  BlocProvider.of<TaskCubit>(context).taskList.isEmpty
                      ? noTasksWidget(context)
                      : Expanded(
                          child: ListView.builder(
                            itemCount: BlocProvider.of<TaskCubit>(context)
                                .taskList
                                .length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          padding: const EdgeInsets.all(24),
                                          width: double.maxFinite,
                                          height: 250.h,
                                          color: AppColors.deepGrey,
                                          child: Column(
                                            children: [
                                              // Task Complete
                                              BlocProvider.of<TaskCubit>(context)
                                                          .taskList[index]
                                                          .complete ==
                                                      0
                                                  ? SizedBox(
                                                      height: 48.h,
                                                      width: double.infinity,
                                                      child:
                                                          CustomElevatedButton(
                                                        text: AppStrings
                                                            .taskComplete,
                                                        onpressed: () {
                                                          BlocProvider.of<
                                                                      TaskCubit>(
                                                                  context)
                                                              .updateTasks(
                                                                  BlocProvider.of<
                                                                              TaskCubit>(
                                                                          context)
                                                                      .taskList[
                                                                          index]
                                                                      .id);
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                    )
                                                  : Container(),
                                              SizedBox(height: 24.h),
                                              // Task Delete
                                              BlocProvider.of<TaskCubit>(context).taskList.isEmpty
                                              ? Container()
                                              : SizedBox(
                                                height: 48.h,
                                                width: double.infinity,
                                                child: CustomElevatedButton(
                                                  text: AppStrings.taskDelete,
                                                  onpressed: () {
                                                    BlocProvider.of<TaskCubit>(
                                                            context)
                                                        .deleteTasks(BlocProvider
                                                                .of<TaskCubit>(
                                                                    context)
                                                            .taskList[index]
                                                            .id);
                                                    Navigator.pop(context);
                                                  },
                                                  backgroundColor:
                                                      AppColors.pink,
                                                ),
                                              ),
                                              SizedBox(height: 24.h),
                                              // Cancel
                                              SizedBox(
                                                height: 48.h,
                                                width: double.infinity,
                                                child: CustomElevatedButton(
                                                  text: AppStrings.cancel,
                                                  onpressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: TaskContainer(
                                    taskModel:
                                        BlocProvider.of<TaskCubit>(context)
                                            .taskList[index],
                                  ));
                            },
                          ),
                        ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
