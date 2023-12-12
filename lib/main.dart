import 'package:chargemod_assignment/features/SplashScreen/Widgets/splash_screen.dart';
import 'package:chargemod_assignment/features/WelcomeScreens/Widgets/welcome_page_3.dart';
import 'package:flutter/material.dart';

import 'features/LoginScreens/Widgets/phone_number_screen.dart';
import 'features/ProfilePage/Widgets/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ProfilePage(),
    );
  }
}
