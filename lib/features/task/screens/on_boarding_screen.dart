import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_do_app/core/database/database.dart';
import 'package:to_do_app/core/services/service_locator.dart';

import '../../../core/util/colors.dart';
import '../../../core/util/strings.dart';
import '../../auth/data/model/on_boarding_model.dart';
import 'home_screen.dart';

// ignore: must_be_immutable
class OnBoardingScreen extends StatelessWidget {
  PageController controller = PageController();

  OnBoardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: controller,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // skip button
                index != 2
                    ? Align(
                        alignment: FractionalOffset.topLeft,
                        child: TextButton(
                          onPressed: () {
                            controller.jumpToPage(2);
                          },
                          child: Text(
                            AppStrings.skip,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: AppColors.white.withOpacity(0.44),
                                ),
                          ),
                        ),
                      )
                    : Container(),
                const SizedBox(height: 15),
                // image
                Image.asset(OnBoardingModel.onBoardingScreen[index].image),
                const SizedBox(height: 40),
                // Dots
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: AppColors.white.withOpacity(0.88),
                    dotHeight: 4,
                    spacing: 8,
                  ),
                ),
                const SizedBox(height: 10),
                //title
                Text(OnBoardingModel.onBoardingScreen[index].title,
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 10),
                // subtitle
                Text(
                  OnBoardingModel.onBoardingScreen[index].subTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 70),
                // next button
                Row(
                  children: [
                    // back button
                    index != 0
                        ? TextButton(
                            onPressed: () {
                              controller.previousPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.bounceIn);
                            },
                            child: Text(
                              AppStrings.back,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: AppColors.white.withOpacity(0.44)),
                            ),
                          )
                        : Container(),
                    const Spacer(),
                    // next button
                    index != 2
                        ? ElevatedButton(
                            onPressed: () {
                              controller.nextPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.bounceIn);
                            },
                            child: const Text(AppStrings.next),
                          )
                        : ElevatedButton(
                            onPressed: () async {
                              await serviceLocator<Cach>().saveData(
                                      key: 'onBoarding', value: 'true')
                                  .then((value) {
                                print('visited');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen()));
                              });
                            },
                            style: Theme.of(context)
                                .elevatedButtonTheme
                                .style!
                                .copyWith(
                                  fixedSize: const MaterialStatePropertyAll(
                                      Size(151, 48)),
                                ),
                            child: const Text(AppStrings.getStart),
                          ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
