import 'package:daisy_frontend/page/login/screens/login.dart';
import 'package:daisy_frontend/page/main/screens/main.dart';
import 'package:daisy_frontend/page/pageStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:daisy_frontend/page/register/screens/register.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget page;
    PageState pageState = getPageState(ref);

    if (pageState == PageState.login) {
      page = LoginPage();
    } else if (pageState == PageState.main) {
      page = const MainPage();
    } else if (pageState == PageState.register) {
      page = const RegisterPage();
    } else {
      page = Container();
    }

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
      child: page,
    );
  }
}
