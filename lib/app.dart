import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_personal_portfolio/core/helpers/route_config.dart';
import 'core/themes/app_theme.dart';

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'My Personal Portfolio',
      theme: lightAppTheme(context),
      darkTheme: darkAppTheme(context),
      themeMode: ThemeMode.dark,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: RouteConfig.returnRouter(),
    );
  }
}
