import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:ecommerce_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ecommerce_app/utils/constants/text_strings.dart';
import 'package:ecommerce_app/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      //* initialBinding: GeneralBindings(),
      home: const OnBoardingScreen(),
    );
  }
}
