import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/helpers/global_keys.dart';
import '../../../core/helpers/spaces.dart';
import '../../../core/utils/cubit/portfolio_cubit.dart';
import '../../widgets/title_box_widget.dart';
import 'experience_card_widget.dart';

class ExperienceSectionWidget extends StatelessWidget {
  const ExperienceSectionWidget({super.key});
  static const String id = '/ExperienceSectionWidget';

  @override
  Widget build(BuildContext context) {
    return Container(
      key: GlobalKeys.experienceKey,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 60),
      child: Column(
        children: [
          TitleBoxWidget(text: 'Experience'.tr()),
          verticalSpace(20),
          BlocBuilder<PortfolioCubit, PortfolioDataState>(
            builder: (context, state) {
              return Column(
                children: state.experiences
                    .map((e) => ExperienceCardWidget(experience: e))
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
