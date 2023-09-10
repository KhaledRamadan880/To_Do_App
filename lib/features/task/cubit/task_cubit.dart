import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/database/cash/database.dart';
import 'package:to_do_app/core/database/sqlflite_helper/sqlflite_helper.dart';
import 'package:to_do_app/features/task/cubit/task_state.dart';

import '../../../core/services/service_locator.dart';
import '../data/model/task_model.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime currentDate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(hours: 1)));
  Color? avatarColor;
  num currentIndex = 0;
  List<TaskModel> taskList = [];

  //! Get Date
  void getDate(context) async {
    emit(GetDataLoadingState());
    DateTime? datePicker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (datePicker != null) {
      currentDate = datePicker;
      emit(GetDataSuccussedState());
    }
  }

  //! Get Start Time
  void getStartTime(context) async {
    emit(GetStartTimeLoadingState());
    TimeOfDay? timePicker = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );
    if (timePicker != null) {
      startTime = timePicker.format(context);
      emit(GetStartTimeSuccussedState());
    }
  }

  //! Get End Time
  void getEndTime(context) async {
    emit(GetEndTimeLoadingState());
    TimeOfDay? timePicker = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );
    if (timePicker != null) {
      endTime = timePicker.format(context);
      emit(GetEndTimeSuccussedState());
    }
  }

  //! Mark Task Color
  void getColorCheck(index) {
    currentIndex = index;
    emit(GetColorIndexState());
  }

  //! Get Date for Task
  void getSelectedDate(date) {
    emit(GetDataSelectedLoadingState());
    selectedDate = date;
    emit(GetDataSelectedSuccussedState());
    getTasks();
  }

  //! Insert
  void insertTask() async {
    emit(InsertTaskLoadingState());
    try {
      await serviceLocator<SqlFLiteHelper>().insertToDb(TaskModel(
        title: titleController.text,
        note: noteController.text,
        date: DateFormat.yMd().format(currentDate),
        startTime: startTime,
        endTime: endTime,
        complete: 0,
        color: currentIndex.toInt(),
      ));
      getTasks();
      titleController.clear();
      noteController.clear();
      emit(InsertTaskSuccessedState());
    } catch (e) {
      emit(InsertTaskErrorState());
    }
  }

  //! GEt
  getTasks() async {
    emit(GetTaskLoadingState());
    await serviceLocator<SqlFLiteHelper>().getFromDB().then((value) {
      taskList = value
          .map((e) => TaskModel.fromJson(e))
          .toList()
          .where((element) =>
              element.date == DateFormat.yMd().format(selectedDate))
          .toList();
      emit(GetTaskSuccessedState());
    }).catchError((e) {
      print(e.toString());
      emit(GetTaskErrorState());
    });
  }

  //! Update
  void updateTasks(id) async {
    emit(UpdateTaskLoadingState());
    await serviceLocator<SqlFLiteHelper>().updateDB(id).then((value) {
      emit(UpdateTaskSuccessedState());
      getTasks();
    }).catchError((e) {
      print(e.toString());
      emit(UpdateTaskErrorState());
    });
  }

  //! Delete
  void deleteTasks(id) async {
    try {
      emit(DeleteTaskLoadingState());
    await serviceLocator<SqlFLiteHelper>().deleteFromDB(id);
    emit(DeleteTaskSuccessedState());
    await getTasks();
    } catch (e) {
      print(e.toString());      
    }

  }

  final switchController = ValueNotifier<bool>(false);
  bool isDark = false;

  switchButton() {
    switchController.addListener(() {
      if (switchController.value) {
        isDark = true;
      } else {
        isDark = false;
      }
    });
  }

  changeTheme(newVal) {
    isDark = !isDark;
    serviceLocator<Cach>().saveData(key: 'isDark', value: newVal);
    emit(ChangeThemeState());
  }

  void getTheme() {
    isDark = serviceLocator<Cach>().getData(key: 'isDark') ?? true;
    emit(GetThemeState());
  }
}
