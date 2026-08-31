import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/helpers/global_keys.dart';
import '../../../core/helpers/spaces.dart';
import '../../../core/utils/cubit/portfolio_cubit.dart';
import '../../widgets/title_box_widget.dart';
import 'project_card_widget.dart';

class ProjectsSectionWidget extends StatelessWidget {
  const ProjectsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: GlobalKeys.projectsKey,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 60),
      child: Column(
        children: [
          TitleBoxWidget(text: 'Projects'.tr()),
          verticalSpace(10),
          BlocBuilder<PortfolioCubit, PortfolioDataState>(
            builder: (context, state) {
              return Column(
                children: state.projects
                    .asMap()
                    .entries
                    .map((entry) => ProjectCardWidget(
                          project: entry.value,
                          index: entry.key,
                        ))
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
