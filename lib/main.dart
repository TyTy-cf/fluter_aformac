import 'package:aformacproject/views/homepage.dart';
import 'package:aformacproject/views/pokedex/pokedex_index.dart';
import 'package:aformacproject/widgets/color/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Exemplte de shared_preferences
  // Du moment où une donnée est sauvegardée dedans, elle l'est tant que l'on ne la supprime pas
  void addPreferencesDemo() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("test", "Coucou de test");
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // addPreferencesDemo();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: CustomColor.generateMaterialColorFromColor(
            CustomColor.bluePokemon
        ),
      ),
      home: const HomePage(),
    );
  }

}
