import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uyjoy/config/router/router.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'core/dp/dp_injection.dart';
import 'core/extensions/num_extensions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // Pastki tugmalar foni
      systemNavigationBarIconBrightness:
          Brightness.dark, // Icon ranglari (qora)
      statusBarColor: Colors.transparent, // Yuqoridagi status bar fon
      statusBarIconBrightness: Brightness.dark, // Status bar icon ranglari
    ),
  );
  AndroidYandexMap.useAndroidViewSurface = false;
  await EasyLocalization.ensureInitialized();
  await setupDependencies();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('uz'), Locale('ru'), Locale('en')],
      path: 'lib/core/l10/localization',
      fallbackLocale: const Locale('uz'),
      child: MyApp(),
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeUtilsExtension.instance.init(context);
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              systemNavigationBarColor: Colors.white,
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
          ),
        ),
        routerConfig: router,
      ),
    );
  }
}
