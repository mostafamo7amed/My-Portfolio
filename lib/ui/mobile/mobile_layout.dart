import 'package:flutter/material.dart';
import '../widgets/copy_right.dart';
import '/ui/mobile/widgets/mobile_contact_section_widget.dart';
import '/ui/mobile/widgets/mobile_experience_section_widget.dart';
import '/ui/mobile/widgets/mobile_skills_section_widget.dart';
import '/ui/mobile/widgets/mobile_about_me_section_widget.dart';
import '/ui/mobile/widgets/mobile_about_widget.dart';
import '/ui/mobile/widgets/mobile_app_bar_widget.dart';
import 'widgets/mobile_projects_section_widget.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
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
        const MobileAppBarWidget(),
        Expanded(
          child: ListView(
            controller: scrollController,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              MobileAboutWidget(scrollController: scrollController,),
              const MobileAboutMeSectionWidget(),
              const MobileSkillsSectionWidget(),
              const MobileExperienceSectionWidget(),
              const MobileProjectsSectionWidget(),
              MobileContactSectionWidget(),
              const CopyRightWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
