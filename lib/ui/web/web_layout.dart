import 'package:flutter/material.dart';
import '../widgets/copy_right.dart';
import '/ui/web/widgets/projects_section_widget.dart';
import '/ui/web/widgets/contact_section_widget.dart';
import '/ui/web/widgets/experience_section_widget.dart';
import '/ui/web/widgets/about_me_widget.dart';

import '/core/helpers/spaces.dart';
import '/ui/web/widgets/about_section_widget.dart';

import '/ui/web/widgets/web_header_widget.dart';

class WebLayout extends StatefulWidget {
  const WebLayout({super.key});

  @override
  State<WebLayout> createState() => _WebLayoutState();
}

class _WebLayoutState extends State<WebLayout> {
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WebHeaderWidget(scrollController: scrollController,),
        Expanded(
          child: ListView(
            controller: scrollController,
            children: [
              AboutSectionWidget(scrollController: scrollController,),
              verticalSpace(30),
              const AboutMeWidget(),
              //const SkillsSectionWidget(),
              verticalSpace(30),
              const ExperienceSectionWidget(),
              const ProjectsSectionWidget(),
              ContactSectionWidget(),
              const CopyRightWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
