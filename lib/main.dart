import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic13/model/PrefHelper.dart';
import 'package:islamic13/ui/HadithDetails/hadithDetails.dart';
import 'package:islamic13/ui/home/screen/home_screen.dart';
import 'package:islamic13/ui/onboarding/screen/onboarding.dart';
import 'package:islamic13/ui/splash/screen/splash_screen.dart';
import 'package:islamic13/ui/suraDetails/screen/suraDetails.dart';


void main() async{
 WidgetsFlutterBinding.ensureInitialized();
  await PrefHelper.init();

   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    bool? isOnboarding= PrefHelper.getBool('isOnboarding') ?? true;

    return  MaterialApp(
     debugShowCheckedModeBanner: false,
      routes: {
      SplashScreen.routeName  : (_)=> const SplashScreen(),
       HomeScreen.routeName : (_)=> const HomeScreen(),
        Suradetails.routeName:(_)=> Suradetails(),
        HadithDetails.routeName:(_)=>const HadithDetails(),
        Onboarding.routeName:(_)=>Onboarding(),
      } ,
      initialRoute:isOnboarding? HomeScreen.routeName : Onboarding.routeName,
    );
  }
}
