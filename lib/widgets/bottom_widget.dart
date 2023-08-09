import 'package:flutter/material.dart';

class BottomWidget extends StatelessWidget {
  final String? title;

  const BottomWidget({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0),
        backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromRGBO(255, 255, 255, 0.40)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            color: Colors.white.withOpacity(0.12),
            strokeAlign: StrokeAlign.inside,
            width: 2,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Text(
          title ?? "",
          textAlign: TextAlign.center,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 10,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
