import 'package:flutter/material.dart';
import 'package:flutter_project/theme/app_text_styles.dart';
import '../../theme/app_colors.dart';

class MyDropdown extends StatefulWidget {
  const MyDropdown({super.key});

  @override
  State<MyDropdown> createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  static const List<String> dropdownItems = [
    'Landline or Mobile',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5'
  ];

  String _selectedValue = dropdownItems.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      width: MediaQuery.of(context).size.width - 64,
      initialSelection: dropdownItems.first,
      onSelected: (String? value) {
        setState(() {
          _selectedValue = value!;
        });
      },
      trailingIcon: Image.asset(
        'assets/icons/chevron_down.png',
        color: AppColors.subtitleColor,
        width: 24,
        height: 24,
      ),
      selectedTrailingIcon: Image.asset(
        'assets/icons/chevron_top.png',
        color: AppColors.subtitleColor,
        width: 24,
        height: 24,
      ),
      textStyle: AppTextStyles.title600.copyWith(fontSize: 15),
      menuStyle: const MenuStyle(
        backgroundColor: MaterialStatePropertyAll(AppColors.backgroundColor)
      ),
      inputDecorationTheme: dropdownTheme(),
      dropdownMenuEntries: generateDropdownItems(),
    );
  }

  InputDecorationTheme dropdownTheme() {
    return InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.backgroundColor,
          width: 2
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.backgroundColor,
          width: 2
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      filled: true,
      fillColor: AppColors.backgroundColor,
    );
  }

  List<DropdownMenuEntry<String>> generateDropdownItems() {
    List<DropdownMenuEntry<String>> items = [];
    for (int i = 0; i < dropdownItems.length; i++) {
      items.add(
        DropdownMenuEntry<String>(
          value: dropdownItems[i],
          label: dropdownItems[i],
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(AppColors.backgroundColor)
          )
        )
      );
    }
    return items;
  }
}
