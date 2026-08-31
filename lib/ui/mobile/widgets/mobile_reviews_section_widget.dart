import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_personal_portfolio/core/themes/app_colors.dart';
import 'package:my_personal_portfolio/core/themes/app_text_styles.dart';
import '../../../core/helpers/global_keys.dart';
import '../../../core/helpers/spaces.dart';
import '../../../core/utils/cubit/portfolio_cubit.dart';
import '../../widgets/add_review_dialog.dart';
import '../../widgets/review_card_widget.dart';
import '../../widgets/title_box_widget.dart';

class MobileReviewsSectionWidget extends StatelessWidget {
  const MobileReviewsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: GlobalKeys.reviewsKey,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
      child: Column(
        children: [
          TitleBoxWidget(text: 'Reviews'.tr()),
          verticalSpace(12),
          Text(
            'What clients, team leads, and project collaborators say about my work'
                .tr(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white70
                  : Colors.black87,
              fontSize: 14,
            ),
          ),
          verticalSpace(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.logoColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => BlocProvider.value(
                        value: context.read<PortfolioCubit>(),
                        child: const AddReviewDialog(),
                      ),
                    );
                  },
                  child: Text(
                    'Leave a Review'.tr(),
                    style: AppTextStyles.font16MediumDarkGray50(
                        context)
                        .copyWith(color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(30),
          BlocBuilder<PortfolioCubit, PortfolioDataState>(
            builder: (context, state) {
              final reviews = state.reviews;
              if (reviews.isEmpty) {
                return const SizedBox();
              }

              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: reviews.length,
                separatorBuilder: (_, __) => verticalSpace(16),
                itemBuilder: (context, index) {
                  return ReviewCardWidget(review: reviews[index]);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
