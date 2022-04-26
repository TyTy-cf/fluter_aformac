
import 'package:aformacproject/widgets/color/custom_color.dart';
import 'package:flutter/material.dart';

class TextCircularProgress extends StatefulWidget {

  final String text;

  const TextCircularProgress({Key? key, required this.text}): super(key: key);

  @override
  State createState() => _TextCircularProgressState();
}

class _TextCircularProgressState extends State<TextCircularProgress> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Text(
                widget.text,
                style: const TextStyle(
                  fontSize: 20,
                  color: CustomColor.bluePokemon
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}




