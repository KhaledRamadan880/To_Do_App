import 'package:flutter/material.dart';
import 'package:to_do_app/features/task/screens/home-screen/home_screen.dart';
import '../../../../core/database/cash/database.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/util/images.dart';
import '../../../../core/util/strings.dart';
import '../OnBoarding_Screens/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    bool isVisited = serviceLocator<Cach>().getData(key: 'onBoarding') ?? false;
    Future.delayed(
      const Duration(seconds: 5),
      () => Navigator.push(context, MaterialPageRoute(builder: (context) {
        return isVisited == true ? const HomeScreen() : OnBoardingScreen();
      })),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.logo),
            const SizedBox(height: 19),
            Text(
              AppStrings.title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
