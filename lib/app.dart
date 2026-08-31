import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_personal_portfolio/core/helpers/route_config.dart';
import 'core/di/dependency_injection.dart';
import 'core/themes/app_theme.dart';
import 'core/utils/cubit/theme_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (_) => getIt<ThemeCubit>(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Mostafa Portfolio',
            theme: lightAppTheme(context),
            darkTheme: darkAppTheme(context),
            themeMode: themeMode,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            routerConfig: RouteConfig.returnRouter(),
          );
        },
      ),
    );
  }
}
