

import 'package:flutter/material.dart';

import '../views/form/login.dart';
import '../views/library_index.dart';
import '../views/recipe/recipe_index.dart';

class PopupMenu extends StatefulWidget {

  const PopupMenu({Key? key}): super(key: key);

  @override
  State createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      onSelected: (popupMenuItemClicked) => handleMenuSelected(
          popupMenuItemClicked, context
      ),
      itemBuilder: (context) => [
        const PopupMenuItem<int>(
          child: Text('Ma bibliothèque de jeu'),
          value: 0,
        ),
        const PopupMenuItem<int>(
          child: Text('Voir les recettes'),
          value: 1,
        ),
        const PopupMenuItem<int>(
          child: Text('Se connecter'),
          value: 2,
        ),
      ]
    );
  }

  void handleMenuSelected(int popupMenuItemClicked, BuildContext context) {
    if (popupMenuItemClicked == 0) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const Library()
          )
      );
    } else if (popupMenuItemClicked == 1) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const RecipeIndex()
          )
      );
    } else if (popupMenuItemClicked == 2) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const Login()
          )
      );
    }
  }
}




