import 'package:flutter/material.dart';
import 'package:islamic13/ui/home/screen/home_screen.dart';
import 'package:islamic13/ui/splash/screen/splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
     debugShowCheckedModeBanner: false,
      routes: {
      SplashScreen.routeName  : (_)=> const SplashScreen(),
       HomeScreen.routeName : (_)=> const HomeScreen()
      } ,
      initialRoute:SplashScreen.routeName ,
    );
  }
}
