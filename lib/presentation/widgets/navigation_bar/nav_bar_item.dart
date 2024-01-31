import 'package:flutter/cupertino.dart';
import '../../../theme/app_colors.dart';

class NavBarItem extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const NavBarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: isSelected
          ? const EdgeInsets.symmetric(vertical: 8, horizontal: 16)
          : null,
        decoration: isSelected
          ? BoxDecoration(
            color: AppColors.thirdBackgroundColor,
            borderRadius: BorderRadius.circular(100),
        )
          : const BoxDecoration(),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          child: isSelected
            ? _selectedItem(icon, label)
            : _unselectedItem(icon, label)
        ),
      ),
    );
  }

  Widget _unselectedItem(String icon, String label) {
    return Column(
      children: [
        Image.asset(
          icon,
          color: AppColors.subtitleColor,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: AppColors.subtitleColor,
          ),
        )
      ],
    );
  }

  Widget _selectedItem(String icon, String label) {
    return Row(
      children: [
        Image.asset(
          icon,
          color: AppColors.titleColor,
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: AppColors.titleColor,
          ),
        )
      ],
    );
  }
}
