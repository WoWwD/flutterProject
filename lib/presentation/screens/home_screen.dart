import 'package:flutter/material.dart';
import 'package:flutter_project/presentation/widgets/list_contacts.dart';
import 'package:flutter_project/testData.dart';
import 'package:flutter_project/theme/app_text_styles.dart';
import '../../theme/app_colors.dart';
import '../widgets/circle_button.dart';
import '../widgets/my_checkbox.dart';
import '../widgets/my_dropdown.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        surfaceTintColor: AppColors.backgroundColor,
        title: _AppBar().title(),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(children: _AppBar().generateActions())
          )
        ]
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16
        ),
        child: Column(
          children: [
            const _Header(),
            const SizedBox(height: 16),
            _contacts()
          ],
        )
      )
    );
  }

  Widget _contacts() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: TestData.listContactsModel.length,
      itemBuilder: (context, index) {
        return ListContacts(model: TestData.listContactsModel[index]);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16),
    );
  }
}

class _AppBar {
  List<Widget> actionAssets = [
    Image.asset(
      'assets/icons/appBar/chart.png',
      color: AppColors.titleColor
    ),
    Image.asset(
      'assets/icons/appBar/chat.png',
      color: AppColors.titleColor
    ),
    Image.asset(
      'assets/icons/appBar/notifications.png',
      color: AppColors.titleColor
    )
  ];

  List<Widget> generateActions() {
    List<Widget> items = [];
    for (int i = 0; i < actionAssets.length; i++) {
      items.add(
        CircleButton(
          icon: actionAssets[i],
          onPressed: () {},
          backgroundColor: AppColors.secondBackgroundColor
        ),
      );
      if (i != actionAssets.length - 1) {
        items.add(const SizedBox(width: 8));
      }
    }
    return items;
  }

  Widget title() {
    return Row(
      children: [
        CircleButton(
          icon: Image.asset(
            'assets/icons/appBar/burger_menu_left.png',
            color: AppColors.titleColor
          ),
          onPressed: () {},
          backgroundColor: AppColors.secondBackgroundColor,
          borderRadius: 12,
        ),
        const SizedBox(width: 8),
        Text(
          '+12021234567',
          style: AppTextStyles.title600.copyWith(fontSize: 16)
        )
      ],
    );
  }
}

class _Header extends StatefulWidget {
  const _Header();

  @override
  State<_Header> createState() => _HeaderState();
}

class _HeaderState extends State<_Header> {
  static const List<String> textButtons = [
    'SMS',
    'MMS',
    'Voice'
  ];

  int selectedIndex = 0;
  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: AppColors.secondBackgroundColor,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: generateButtons(),
          ),
          const SizedBox(height: 16),
          const MyDropdown(),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyCheckBox(
                value: checkBoxValue,
                onChanged: (value) {
                  setState(() {
                    checkBoxValue = value;
                  });
                },
              ),
              const SizedBox(width: 8),
              const Text(
                'Show number without verification',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.titleColor,
                )
              )
            ],
          )
        ],
      ),
    );
  }

  List<Widget> generateButtons() {
    List<Widget> items = [];
    for (int i = 0; i < textButtons.length; i++) {
      items.add(
        button(
          selectedIndex == i,
          textButtons[i],
          () {
            setState(() {
              selectedIndex = i;
            });
          }
        )
      );
    }
    return items;
  }

  Widget button(bool isSelected, String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 12
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: isSelected
            ? AppColors.thirdBackgroundColor
            : AppColors.backgroundColor
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: isSelected
              ? AppColors.titleColor
              : AppColors.subtitleColor
          )
        )
      ),
    );
  }
}
