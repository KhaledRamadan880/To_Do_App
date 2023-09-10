import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_do_app/core/common/common.dart';
import 'package:to_do_app/core/database/cash/database.dart';
import 'package:to_do_app/core/services/service_locator.dart';
import 'package:to_do_app/core/widgets/custom_elevated_button.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/strings.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../data/model/on_boarding_model.dart';
import '../../../task/screens/home-screen/home_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  final PageController controller = PageController();

  OnBoardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: controller,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(24.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                //! Skip button
                index != 2
                    ? Align(
                        alignment: FractionalOffset.topLeft,
                        child: CustomTextButton(
                          text: AppStrings.skip,
                          onpressed: () {
                            controller.jumpToPage(2);
                          },
                        ))
                    : Container(
                        height: 50,
                      ),
                SizedBox(height: 70.h),

                //! Image
                Image.asset(OnBoardingModel.onBoardingScreen[index].image),
                SizedBox(height: 40.h),

                //! Dots
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: AppColors.white.withOpacity(0.88),
                    dotHeight: 4,
                    spacing: 8,
                  ),
                ),
                SizedBox(height: 10.h),

                //! Title
                Text(OnBoardingModel.onBoardingScreen[index].title,
                    style: Theme.of(context).textTheme.titleLarge),
                SizedBox(height: 10.h),

                //! Subtitle
                Text(
                  OnBoardingModel.onBoardingScreen[index].subTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 70.h),
                const Spacer(),
                //! bottom buttons
                Row(
                  children: [
                    //! back button
                    index != 0
                        ? CustomTextButton(
                            text: AppStrings.back,
                            onpressed: () {
                              controller.previousPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.bounceIn);
                            })
                        : Container(),
                    const Spacer(),

                    //! next button
                    index != 2
                        ? CustomElevatedButton(
                            text: AppStrings.next,
                            onpressed: () {
                              controller.nextPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.bounceIn);
                            })
                        : ElevatedButton(
                            onPressed: () async {
                              await serviceLocator<Cach>()
                                  .saveData(key: 'onBoarding', value: true)
                                  .then((value) {
                                navigator(
                                    context: context,
                                    screen: const HomeScreen());
                              });
                            },
                            style: Theme.of(context)
                                .elevatedButtonTheme
                                .style!
                                .copyWith(
                                  fixedSize: MaterialStatePropertyAll(
                                      Size(151.w, 48.h)),
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
