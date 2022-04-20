import 'package:aformacproject/entity/student.dart';
import 'package:flutter/material.dart';

import 'entity/pokemon.dart';

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
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(
        title: 'AFORMAC Test Project',
      ),
    );
  }

}


class MyHomePage extends StatefulWidget {

  final String title;

  const MyHomePage({
    Key? key,
    required this.title
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int index = 0;
  List<Student> students = [];
  List<Pokemon> pokemons = [];

  @override
  void initState() {
    super.initState();
    students.add(Student('oui', 'Sophana', DateTime(1990, 06, 06)));
    students.add(Student('oui', 'Jeoffrey', DateTime(1995, 04, 26)));
    students.add(Student('oui', 'Ayoub', DateTime(1997, 05, 16)));
    // Ajoute les 151 pokémons dans la liste, afin de les afficher
    for (int i = 1; i <= 151; i++) {
      pokemons.add(Pokemon(i));
    }
  }

  void nextStudent() {
    setState(() {
      index++;
    });
  }

  void previousStudent() {
    setState(() {
      index--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(pokemons[index].getOfficialArtwork()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.network(pokemons[index].getFrontHome()),
                ),
                Expanded(
                  child: Image.network(pokemons[index].getFrontHomeShiny()),
                ),
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: const EdgeInsets.all(10.0)
                  ),
                  // en JS ça donnerai ça :
                  // btn = document.querySelector('buttonPrevious')
                  // btn.addEventListener('click') => onPressed
                  // if index == 0
                  //   btn.addAttribute('disabled', true)
                  // else
                  //   previousStudent()
                  onPressed: index == 0 ? null : () => previousStudent(),
                  child: const Text('Previous')
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10.0)
                  ),
                  onPressed: index == (pokemons.length - 1) ? null : () => nextStudent(),
                  child: const Text('Next')
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
