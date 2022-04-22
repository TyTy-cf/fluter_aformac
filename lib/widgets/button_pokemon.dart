
import 'package:aformacproject/widgets/color/custom_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonPokemon extends StatelessWidget {

  final String text;
  final VoidCallback? onPressed;

  const ButtonPokemon({Key? key, required this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color yellow = CustomColor.yellowPokemon;
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: onPressed == null ? Colors.black38: yellow,
              fontSize: 18
          ),
        ),
        style: ElevatedButton.styleFrom(
            // onSurface : change la couleur du bouton si disable
            onSurface: CustomColor.bluePokemon4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: BorderSide(
                color: yellow,
                width: 2.0
              )
            ),
            primary: CustomColor.bluePokemon,
            padding: const EdgeInsets.symmetric(
              vertical:  10.0,
              horizontal: 16.0
            )
        )
    );
  }

}