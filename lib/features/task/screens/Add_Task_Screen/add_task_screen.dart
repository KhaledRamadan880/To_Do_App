import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/common/common.dart';
import 'package:to_do_app/core/util/colors.dart';
import 'package:to_do_app/features/task/cubit/task_state.dart';

import '../../../../core/util/strings.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../components/add_task_text_field.dart';
import '../../cubit/task_cubit.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //! AppBar
      appBar: AppBar(
        title: Text(
          'Add Task',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      //! Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.h),
          child: BlocBuilder<TaskCubit, TaskState>(
            builder: (context, state) {
              final cubit = BlocProvider.of<TaskCubit>(context);
              return Form(
                key: BlocProvider.of<TaskCubit>(context).formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! Tite TextField
                    AddTaskTxtField(
                      controller:
                          BlocProvider.of<TaskCubit>(context).titleController,
                      title: AppStrings.titelTxtField,
                      hintText: AppStrings.enterTitle,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.titeleValid;
                        }
                        return null;
                      },
                    ),

                    //! Note TextField
                    AddTaskTxtField(
                      controller:
                          BlocProvider.of<TaskCubit>(context).noteController,
                      title: AppStrings.note,
                      hintText: AppStrings.enterNote,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.noteValid;
                        }
                        return null;
                      },
                    ),

                    //! Date TextField
                    AddTaskTxtField(
                      title: AppStrings.date,
                      hintText: DateFormat('yMd').format(cubit.currentDate),
                      enabled: true,
                      suffixIcon: IconButton(
                        onPressed: () {
                          cubit.getDate(context);
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
                            hintText: cubit.startTime,
                            enabled: true,
                            suffixIcon: IconButton(
                              onPressed: () async {
                                cubit.getStartTime(context);
                              },
                              icon: const Icon(Icons.timer_sharp),
                            ),
                          ),
                        ),
                        SizedBox(width: 27.w),

                        //! End Time
                        Expanded(
                          child: AddTaskTxtField(
                            title: AppStrings.endTime,
                            hintText: cubit.endTime,
                            enabled: true,
                            suffixIcon: IconButton(
                              onPressed: () async {
                                cubit.getEndTime(context);
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
                        //! Color Text
                        Text(
                          AppStrings.color,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(height: 8.h),
                        //! Colors Row
                        SizedBox(
                          width: double.maxFinite,
                          height: 50,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                switch (index) {
                                  case 0:
                                    cubit.avatarColor = AppColors.pink;
                                  case 1:
                                    cubit.avatarColor = AppColors.green;
                                  case 2:
                                    cubit.avatarColor = AppColors.mint;
                                  case 3:
                                    cubit.avatarColor = AppColors.blue;
                                  case 4:
                                    cubit.avatarColor = AppColors.brown;
                                  case 5:
                                    cubit.avatarColor = AppColors.purple;
                                }
                                return Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        cubit.getColorCheck(index);
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: cubit.avatarColor,
                                        child: index == cubit.currentIndex
                                            ? const Icon(
                                                Icons.check,
                                                color: AppColors.white,
                                              )
                                            : const Text(''),
                                      ),
                                    ),
                                    SizedBox(width: 12.w),
                                  ],
                                );
                              }),
                        ),
                      ],
                    ),

                    //! Create Task Button
                    SizedBox(height: 130.h),
                    // const Spacer(),
                    state is InsertTaskLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        : SizedBox(
                            width: double.maxFinite,
                            height: 48.h,
                            child: CustomElevatedButton(
                              onpressed: () {
                                if (BlocProvider.of<TaskCubit>(context)
                                    .formKey
                                    .currentState!
                                    .validate()) {
                                  BlocProvider.of<TaskCubit>(context)
                                      .insertTask();
                                  showToast(
                                    massage: 'Added Successfully',
                                    state: ToastStates.success,
                                  );
                                  Navigator.pop(context);
                                }
                              },
                              text: AppStrings.createTask,
                            ),
                          ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
