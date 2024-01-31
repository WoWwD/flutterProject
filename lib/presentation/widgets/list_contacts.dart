import 'package:flutter/material.dart';
import 'package:flutter_project/data/models/list_contacts_model.dart';
import 'package:flutter_project/presentation/widgets/contact_card.dart';
import 'package:flutter_project/theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class ListContacts extends StatelessWidget {
  final ListContactsModel model;

  const ListContacts({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: CircleAvatar(
                backgroundImage: AssetImage(model.icon),
              ),
            ),
            const SizedBox(width: 4),
            Text(
              model.country,
              style: AppTextStyles.title600.copyWith(fontSize: 15)
            ),
          ]
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: AppColors.secondBackgroundColor,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8
          ),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: model.contacts.length,
            itemBuilder: (context, index) {
              return ContactCard(model: model.contacts[index]);
            },
          ),
        )
      ],
    );
  }
}
