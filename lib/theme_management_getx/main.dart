import 'package:flutter/material.dart';
import 'package:flutter_academic_project_spectrum/theme_management_getx/utils/custom_theme.dart';
import 'package:flutter_academic_project_spectrum/theme_management_getx/view/theme_management.dart';
import 'package:get/get.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const ThemeSample(),
    );
  }
}
