import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/di/dependency_injection.dart';
import '/core/helpers/global_keys.dart';
import '/core/utils/cubit/portfolio_cubit.dart';
import '/ui/adaptive_layout.dart';
import '/ui/mobile/widgets/custom_drawer.dart';
import '/ui/mobile/mobile_layout.dart';
import '/ui/web/web_layout.dart';
import '/ui/widgets/animated_background.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PortfolioCubit>(
      create: (_) => getIt<PortfolioCubit>(),
      child: Scaffold(
        key: GlobalKeys.mainKey,
        backgroundColor: Colors.transparent,
        endDrawer: MediaQuery.sizeOf(context).width < 1000
            ? const CustomDrawer()
            : null,
        body: SelectionArea(
          child: AnimatedBackground(
            child: AdaptiveLayout(
              mobileLayout: (context) => const MobileLayout(),
              webLayout: (context) => const WebLayout(),
            ),
          ),
        ),
      ),
    );
  }
}
