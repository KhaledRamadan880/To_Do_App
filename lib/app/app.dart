import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/features/task/cubit/task_cubit.dart';
import 'package:to_do_app/features/task/cubit/task_state.dart';
import '../core/util/theme.dart';
import '../features/auth/presentation/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        return ScreenUtilInit(
            designSize: const Size(375, 812),
            builder: (context, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: appLightTheme(),
                darkTheme: appDarkTheme(),
                themeMode: BlocProvider.of<TaskCubit>(context).isDark 
                    ? ThemeMode.dark
                    : ThemeMode.light,
                home: const SplashScreen(),
              );
            });
      },
    );
  }
}
