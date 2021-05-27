import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  ReusableCard({@required this.reusableColor, this.cardChild});
  final Color? reusableColor;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: reusableColor,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
