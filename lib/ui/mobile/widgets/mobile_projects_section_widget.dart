import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../core/helpers/global_keys.dart';
import '/core/data/my_data.dart';

import '../../../core/helpers/spaces.dart';
import '../../widgets/title_box_widget.dart';
import 'mobile_project_card_widget.dart';

class MobileProjectsSectionWidget extends StatelessWidget {
  const MobileProjectsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: GlobalKeys.projectsKey,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
      child: Column(
        children: [
          TitleBoxWidget(text: 'Projects'.tr()),
          verticalSpace(10),
          Column(
            children: myData.projects
                .map((e) => MobileProjectCardWidget(project: e))
                .toList(),
          ),
        ],
      ),
    );
  }
}
