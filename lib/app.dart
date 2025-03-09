import 'package:fitpass_kz/features/authentication/screens/authentication.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "Roboto",
        textTheme: const TextTheme(
          // Үлкен тақырыптар үшін (ExtraBold)
          displayLarge: TextStyle(fontSize: 48, fontWeight: FontWeight.w800), // ExtraBold
          displayMedium: TextStyle(fontSize: 40, fontWeight: FontWeight.w700), // Bold
          displaySmall: TextStyle(fontSize: 34, fontWeight: FontWeight.w600), // SemiBold

          // Орташа тақырыптар үшін (Bold, Medium)
          headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w700), // Bold
          headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w500), // Medium
          headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w400), // Regular

          // Кіші тақырыптар үшін (Regular, Light)
          titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w500), // Medium
          titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w400), // Regular
          titleSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w300), // Light

          // Негізгі мәтіндер үшін (Regular, ExtraLight)
          bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400), // Regular
          bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w300), // Light
          bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w200), // ExtraLight

          // Субтитрлар үшін (Light, ExtraLight)
          labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w300), // Light
          labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w200), // ExtraLight
          labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w200), // ExtraLight
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Authentication(),
    );
  }
}
