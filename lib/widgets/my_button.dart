//لێره‌ میسۆدی بۆتۆنمان دروست كردیه هه‌تا هه‌ر كاته‌ك بمانه‌وێ به‌كاری بینین به‌ ئاسانی ده‌ستمان بكه‌وی
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({required this.color, required this.title, required this.onPressed});
  final Color color;
  final String title;
  //لێره داتا داواناكاته‌وه‌
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 5,
        color: color,
        borderRadius: BorderRadius.circular(10),
        // ignore: prefer_const_constructors
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200,
          height: 42,
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
