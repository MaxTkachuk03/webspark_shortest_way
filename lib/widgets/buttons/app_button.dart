import 'package:flutter/material.dart';
import 'package:webspark_shortest_way/resources/colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              width: 2.5, color: AppColors.borderButton),
          borderRadius: const BorderRadius.all(Radius.circular(19))),
      child: FloatingActionButton.extended(
        enableFeedback: true,
        extendedPadding: const EdgeInsets.symmetric(horizontal: 80.0),
        backgroundColor: AppColors.button,
        onPressed: onPressed,
        label: Text(
          text,
          style: const TextStyle(
            color: AppColors.blockedBox,
          ),
        ),
      ),
    );
  }
}
