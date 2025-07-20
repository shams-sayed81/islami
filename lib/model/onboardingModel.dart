import 'package:islamic13/style/assets_manager.dart';

class OnboardingModel {
  String path;
  String title;
  String? disc;
  OnboardingModel({required this.title, required this.path , this.disc});

static List<OnboardingModel> onboardingList =[
  OnboardingModel(title: 'Welcome To Islami App', path: AssetsManager.onboarding1),
  OnboardingModel(title: 'Welcome To Islami App', path: AssetsManager.onboarding2, disc: 'We Are Very Excited To Have You In Our Community') ,
  OnboardingModel(title: 'Reading the Quran', path: AssetsManager.onboarding3, disc: 'Read, and your Lord is the Most Generous'),
  OnboardingModel(title: 'Bearish', path: AssetsManager.onboarding4, disc: 'Praise the name of your Lord, the Most High'),
  OnboardingModel(title: 'Holy Quran Radio', path: AssetsManager.onboarding5,disc: 'You can listen to the Holy Quran Radio through the application for free and easily'),

];

}