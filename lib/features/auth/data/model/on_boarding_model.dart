
import '../../../../core/util/images.dart';
import '../../../../core/util/strings.dart';

class OnBoardingModel {
  final image;
  final title;
  final subTitle;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.subTitle,
  });

  static List<OnBoardingModel> onBoardingScreen = [
    OnBoardingModel(
      image: AppImages.on_1,
      title: AppStrings.onBoardingTitleOne,
      subTitle: AppStrings.onBoardingSubtitleOne,
    ),
    OnBoardingModel(
      image: AppImages.on_2,
      title: AppStrings.onBoardingTitleTwo,
      subTitle: AppStrings.onBoardingSubtitleTwo,
    ),
    OnBoardingModel(
      image: AppImages.on_3,
      title: AppStrings.onBoardingTitleThree,
      subTitle: AppStrings.onBoardingSubtitleThree,
    ),
  ];
}
