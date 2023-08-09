import 'package:flutter/material.dart';
import 'package:healthypet/utils/color_themes.dart';

class ItemCategoryServiceWidget extends StatelessWidget {
  final String? name;
  final int index;
  final int currentIndex;
  final Function() onPressed;

  const ItemCategoryServiceWidget(
      {super.key,
      this.name,
      required this.index,
      required this.currentIndex,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 36,
        decoration: BoxDecoration(
          color: currentIndex == index
              ? ColorsThemes.primaryColor
              : const Color.fromRGBO(246, 246, 246, 1),
          borderRadius: BorderRadius.circular(10),
          border: currentIndex == index
              ? Border.all(
                  width: 2,
                  color: const Color.fromRGBO(241, 229, 229, 0.22),
                  strokeAlign: StrokeAlign.inside,
                )
              : Border.all(
                  width: 0,
                  color: Colors.transparent,
                ),
        ),
        child: Center(
          child: Text(
            name ?? '',
            style: TextStyle(
              color: currentIndex == index
                  ? Colors.white
                  : ColorsThemes.primaryTextColor.withOpacity(0.3),
              fontSize: 12,
              fontWeight: FontWeight.bold,
              fontFamily: 'manrope',
            ),
          ),
        ),
      ),
    );
  }
}
