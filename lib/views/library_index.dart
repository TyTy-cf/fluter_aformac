
import 'package:aformacproject/widgets/row_double_image.dart';
import 'package:flutter/material.dart';

class Library extends StatefulWidget {

  const Library({Key? key}): super(key: key);

  @override
  State createState() => _LibraryState();
}

class _LibraryState extends State<Library> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Définit le titre de la page où je me situe
        appBar: AppBar(
          title: const Text('Mes jeux'),
        ),
        // Container afin d'englober le contenu de ma page
        body: SingleChildScrollView(
          child: Column(
            children: const [
              RowDoubleImage(
                first: 'https://cdn.thegamesdb.net/images/original/boxart/front/149-1.jpg',
                second: 'https://cdn.thegamesdb.net/images/original/boxart/front/2474-1.png'
              ),
              RowDoubleImage(
                  first: 'https://cdn.thegamesdb.net/images/original/boxart/front/32185-1.jpg',
                  second: 'https://cdn.thegamesdb.net/images/original/boxart/front/153-1.jpg'
              ),
              RowDoubleImage(
                  first: 'https://cdn.thegamesdb.net/images/thumb/boxart/front/68643-1.jpg',
                  second: 'https://cdn.thegamesdb.net/images/original/boxart/front/63344-1.jpg'
              ),
              RowDoubleImage(
                  first: 'https://cdn.thegamesdb.net/images/original/boxart/front/2474-1.png',
                  second: 'https://cdn.thegamesdb.net/images/original/boxart/front/52158-1.jpg'
              )
            ],
          ),
        )
    );
  }

}

