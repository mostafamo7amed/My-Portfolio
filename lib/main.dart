import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app.dart';
import 'core/di/dependency_injection.dart';
import 'core/helpers/app_localizations.dart';
import 'core/helpers/bloc_observer.dart';
import 'firebase_options.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGetIt();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    EasyLocalization(
      supportedLocales: AppLocalizations.supportedLocales,
      fallbackLocale: AppLocalizations.english,
      path: AppLocalizations.translationsPath,
      startLocale: AppLocalizations.english,
      saveLocale: true,
      child: const MyApp(),
    ),
  );
}
