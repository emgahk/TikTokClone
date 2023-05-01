import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/utils.dart';

class FormButton1 extends StatelessWidget {
  const FormButton1({
    super.key,
    required this.disabled,
    required this.buttonTitle,
  });
  final String buttonTitle;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sizes.size5),
            color: disabled
                ? isDarkMode(context)
                    ? Colors.grey.shade800
                    : Colors.grey.shade300
                : Theme.of(context).primaryColor),
        padding: const EdgeInsets.symmetric(vertical: Sizes.size16),
        child: AnimatedDefaultTextStyle(
          style: TextStyle(
              color: disabled ? Colors.grey.shade400 : Colors.white,
              fontWeight: FontWeight.w600),
          duration: const Duration(milliseconds: 200),
          child: Text(
            buttonTitle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
