import 'package:flutter/material.dart';
import 'package:flutter_project/data/models/contact_model.dart';
import 'package:flutter_project/presentation/widgets/circle_button.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class ContactCard extends StatelessWidget {
  final ContactModel model;

  const ContactCard({
    super.key,
    required this.model
  });

  @override
  Widget build(BuildContext context) {
    const borderColor = Color(0xffD4D9E0);
    const trailingItemStyle = TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w600,
      color: AppColors.titleColor
    );

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleButton(
        icon: Image.asset(
          'assets/icons/navBar/tablet.png',
          color: AppColors.subtitleColor,
          width: 24,
          height: 24,
        ),
        onPressed: () {},
        backgroundColor: AppColors.backgroundColor
      ),
      title: Text(
        model.phoneNumber,
        style: AppTextStyles.title600.copyWith(fontSize: 15)
      ),
      subtitle: Text(
        model.city,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppColors.subtitleColor,
        ),
      ),
      trailing: Wrap(
        spacing: 9,
        children: [
          CircleButton(
            icon: const Center(
              child: Text(
                'S',
                style: trailingItemStyle
              ),
            ),
            onPressed: () {},
            backgroundColor: AppColors.secondBackgroundColor,
            border: Border.all(color: borderColor),
          ),
          if (model.isVerificated) ...[
            CircleButton(
              icon: const Center(
                child: Text(
                  'V',
                  style: trailingItemStyle
                ),
              ),
              onPressed: () {},
              backgroundColor: AppColors.secondBackgroundColor,
              border: Border.all(color: borderColor),
            )
          ]
        ],
      )
    );
  }
}
