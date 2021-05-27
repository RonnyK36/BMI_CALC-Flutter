import 'package:flutter/material.dart';
import 'constants.dart';

class CardContent extends StatelessWidget {
  CardContent({@required this.cardIcon, @required this.cardLabel});
  final IconData? cardIcon;
  final String? cardLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: 80,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          cardLabel!,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
