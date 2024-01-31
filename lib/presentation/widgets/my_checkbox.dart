import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class MyCheckBox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const MyCheckBox({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _value = !_value;
        });
        widget.onChanged(_value);
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: _value? AppColors.thirdBackgroundColor: Colors.transparent,
          border: _value? null: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(48),
        ),
        width: 20,
        height: 20,
        child: _value
          ? const Icon(Icons.check, size: 16, color: AppColors.titleColor)
          : null,
      ),
    );
  }
}
