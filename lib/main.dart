import 'package:aformacproject/entity/student.dart';
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

  @override
  void initState() {
    super.initState();
    students.add(Student('oui', 'Sophana', DateTime(1990, 06, 06)));
    students.add(Student('oui', 'Jeoffrey', DateTime(1995, 04, 26)));
    students.add(Student('oui', 'Ayoub', DateTime(1997, 05, 16)));
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
            Text(
              'Etudiant n°' + (index + 1).toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            Container(
              child: Text(
                students[index].toString(),
              ),
              padding: const EdgeInsets.all(10.0),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: Text(
                students[index].getAge().toString() + ' ans',
              ),
              padding: const EdgeInsets.all(10.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: const EdgeInsets.all(10.0)
                  ),
                  onPressed: index == 0 ? null : () => previousStudent(),
                  child: const Text('Previous')
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10.0)
                  ),
                  onPressed: index == students.length - 1 ? null : () => nextStudent(),
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
