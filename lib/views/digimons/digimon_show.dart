
import 'package:flutter/material.dart';

import '../../entity/digimon.dart';
import '../../widgets/color/custom_color.dart';

class DigimonShow extends StatefulWidget {

  final Digimon digimon;

  const DigimonShow({Key? key, required this.digimon}) : super(key: key);

  @override
  State<DigimonShow> createState() => _DigimonShowState();
}

class _DigimonShowState extends State<DigimonShow> {

  late Digimon digimon;

  @override
  void initState() {
    super.initState();
    digimon = widget.digimon;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digimon detail'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 12),
            child: Text(
              digimon.name,
              style: const TextStyle(
                  fontSize: 28,
                  color: CustomColor.bluePokemon
              ),
            ),
          )
        ]
      )
    );
  }
}