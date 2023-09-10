import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/database/cash/database.dart';
import 'package:to_do_app/core/database/sqlflite_helper/sqlflite_helper.dart';
import 'package:to_do_app/core/services/service_locator.dart';

import 'app/app.dart';
import 'features/task/cubit/task_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await serviceLocator<SqlFLiteHelper>().initDB();  
  await serviceLocator<Cach>().init();  
  runApp(BlocProvider(
    create: (context) => TaskCubit()..getTheme()..getTasks(),
    child: const MyApp(),
  ));
}
