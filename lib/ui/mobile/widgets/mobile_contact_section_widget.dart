import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/data/my_data.dart';
import '../../../core/helpers/custom_text_form_field.dart';
import '../../../core/helpers/global_keys.dart';
import '../../../core/utils/cubit/contact_cubit.dart';

import '../../../core/helpers/spaces.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_text_styles.dart';
import '../../../core/utils/utils.dart';
import '../../widgets/floating_icon_widget.dart';
import '../../widgets/social_icons_widget.dart';
import '../../widgets/title_box_widget.dart';

class MobileContactSectionWidget extends StatelessWidget {
  MobileContactSectionWidget({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactCubit(),
      child: BlocConsumer<ContactCubit, ContactState>(
        listener: (context, state) {
          if (state is ContactSuccess) {
            nameController.clear();
            emailController.clear();
            messageController.clear();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Email sent successfully'),
              ),
            );
          }
          if (state is ContactError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Could not send email. Please try again later'),
              ),
            );
          }
        },
        builder: (context, state) {
          return Container(
            key: GlobalKeys.contactKey,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TitleBoxWidget(text: 'Get in touch'.tr()),
                  verticalSpace(15),
                  // Floating Icons Group
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingIconWidget(
                        distance: 6,
                        duration: const Duration(seconds: 4),
                        child: _MobileContactBadgeIcon(
                          icon: Icons.chat_bubble_outline_rounded,
                          color: AppColors.logoColor,
                        ),
                      ),
                      horizontalSpace(14),
                      FloatingIconWidget(
                        distance: 7,
                        duration: const Duration(milliseconds: 3500),
                        delay: const Duration(milliseconds: 600),
                        child: _MobileContactBadgeIcon(
                          icon: Icons.auto_awesome_rounded,
                          color: const Color(0xFF22D3EE),
                        ),
                      ),
                      horizontalSpace(14),
                      FloatingIconWidget(
                        distance: 5,
                        duration: const Duration(seconds: 4),
                        delay: const Duration(milliseconds: 1200),
                        child: _MobileContactBadgeIcon(
                          icon: Icons.rocket_launch_rounded,
                          color: const Color(0xFF7C5CFF),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(18),
                  Text(
                    'Contact me now to discuss your wonderful project or for more information. I am here to fulfill your vision through an exceptional and amazing design!'
                        .tr(),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.font20NormalDarkGray600(context),
                  ),
                  verticalSpace(20),

                  CustomTextFormField(
                    maxLines: 1,
                    controller: nameController,
                    hintText: 'Name'.tr(),
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'Please enter your name'.tr();
                      }
                      return null;
                    },
                  ),
                  verticalSpace(10),
                  CustomTextFormField(
                    maxLines: 1,
                    controller: emailController,
                    hintText: 'Email'.tr(),
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'Please enter your email'.tr();
                      }
                      return null;
                    },
                  ),
                  verticalSpace(10),
                  CustomTextFormField(
                    maxLines: 5,
                    controller: messageController,
                    hintText: 'Write your message'.tr(),
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'Please enter your message'.tr();
                      }
                      return null;
                    },
                  ),
                  verticalSpace(10),
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
                            if (formKey.currentState!.validate()) {
                              context.read<ContactCubit>().sendMessageToEmail(
                                name: nameController.text,
                                email: emailController.text,
                                message: messageController.text,
                              );
                            }
                          },
                          child: state is ContactLoading
                              ? const FittedBox(
                            child: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: CircularProgressIndicator(
                                color: AppColors.white,
                              ),
                            ),
                          )
                              : Text(
                            'Send Message'.tr(),
                            style: AppTextStyles.font16MediumDarkGray50(
                                context)
                                .copyWith(color: AppColors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(30),
                  Row(
                    children: [
                      const Spacer(),
                      const Icon(
                        Icons.email_outlined,
                        size: 22,
                      ),
                      horizontalSpace(5),
                      Text(
                        myData.email,
                        style: AppTextStyles.font18SemiBoldDarkGray900(context),
                        textAlign: TextAlign.center,
                      ),
                      horizontalSpace(5),
                      IconButton(
                        onPressed: () {
                          copyToClipboard(
                            context,
                            myData.email,
                          );
                        },
                        icon: const Icon(Icons.copy_rounded, size: 22),
                      ),
                      const Spacer(),

                    ],
                  ),
                  verticalSpace(20),
                  Text(
                    'You may also find me on these platforms!'.tr(),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.font20NormalDarkGray600(context),
                  ),
                  verticalSpace(10),
                  const SocialIconsWidget(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _MobileContactBadgeIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _MobileContactBadgeIcon({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        shape: BoxShape.circle,
        border: Border.all(
          color: color.withValues(alpha: 0.35),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.25),
            blurRadius: 12,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Icon(
        icon,
        color: color,
        size: 19,
      ),
    );
  }
}

