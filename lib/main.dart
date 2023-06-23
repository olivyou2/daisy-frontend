import 'package:daisy_frontend/init/screens/init.dart';
import 'package:daisy_frontend/login/screens/login.dart';
import 'package:daisy_frontend/main/screens/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:daisy_frontend/page/register/register.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ko'),
            Locale('en'),
          ],
          debugShowCheckedModeBanner: false,
          title: "Daisy",
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
      child: MainPage(),
    );
  }
}
