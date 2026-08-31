import 'package:flutter/material.dart';
import '../../../core/data/my_data.dart';
import '../../../core/helpers/global_keys.dart';
import '../../../core/helpers/spaces.dart';
import '../../widgets/theme_toggle_button.dart';

class MobileAppBarWidget extends StatelessWidget {
  const MobileAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          Image.asset(
            myData.logo,
            height: 45,
            width: 45,
            fit: BoxFit.contain,
          ),
          const Spacer(),
          const ThemeToggleButton(),
          horizontalSpace(8),
          IconButton(
            onPressed: () {
              GlobalKeys.mainKey.currentState!.openEndDrawer();
            },
            icon: const Icon(Icons.menu_rounded),
          ),
        ],
      ),
    );
  }
}
