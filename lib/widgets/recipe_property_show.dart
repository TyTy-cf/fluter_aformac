
import 'package:aformacproject/widgets/color/custom_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipePropertyShow extends StatelessWidget {

  final String text;
  final String value;
  final IconData icon;
  final double mLeft;
  final double mTop;

  const RecipePropertyShow({
    Key? key,
    required this.text,
    required this.value,
    required this.icon,
    required this.mLeft,
    required this.mTop
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: mTop, left: mLeft),
        child: Row(
          children: [
            Icon(
              icon,
              color: CustomColor.bluePokemon
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                  color: CustomColor.bluePokemon
                ),
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                color: CustomColor.bluePokemon
              ),
            ),
          ],
        )
    );
  }

}