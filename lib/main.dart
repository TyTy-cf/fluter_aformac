import 'package:aformacproject/views/pokedex_index.dart';
import 'package:aformacproject/widgets/color/custom_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: CustomColor.generateMaterialColorFromColor(
            CustomColor.bluePokemon
        ),
      ),
      home: const PokedexIndex(),
    );
  }

}
