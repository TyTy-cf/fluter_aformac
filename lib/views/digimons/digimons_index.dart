

import 'dart:convert';

import 'package:aformacproject/entity/hive/hive_repo.dart';
import 'package:aformacproject/service/http_service_custom.dart';
import 'package:aformacproject/service/url_const.dart';
import 'package:aformacproject/views/tinderish/liked_profile.dart';
import 'package:aformacproject/widgets/text_circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../entity/digimon.dart';
import '../../entity/tinderish/profile.dart';
import '../../widgets/color/custom_color.dart';

class DigimonIndex extends StatefulWidget {

  const DigimonIndex({Key? key}) : super(key: key);

  @override
  State<DigimonIndex> createState() => _DigimonIndexState();
}

class _DigimonIndexState extends State<DigimonIndex> {

  Future<Response>? digimonsResponse;

  @override
  void initState() {
    super.initState();
    digimonsResponse = HttpServiceCustom().getRequest(
        UrlConst.urlRawDigimons, UrlConst.urlGetDigimons, null
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digimons list'),
      ),
      body: FutureBuilder(
        future: digimonsResponse, // Future<Response>
        builder: (BuildContext context, AsyncSnapshot<dynamic> futureResponse) {
          if (futureResponse.hasData) {
            List<dynamic> jsonDigimons = jsonDecode(futureResponse.data.body);
            List<Digimon> digimons = [];
            // On itère sur notre tableau Json de digimon
            jsonDigimons.forEach((jsonSingleDigimon) {
              digimons.add(Digimon.fromJson(jsonSingleDigimon));
            });
            // List<dynamic> jsonDigimons = jsonDecode(futureResponse.data.body);
            // List<Digimon> digimons = jsonDigimons.map((jsonDigimon) => Digimon.fromJson(jsonDigimon)).toList();
            return ListView.builder(
              // /!\ bien penser à renseigner le nombre d'items à afficher
                itemCount: digimons.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  Digimon digimon = digimons[index];
                  return Card(
                    elevation: 3,
                    borderOnForeground: false,
                    shadowColor: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      digimon.img,
                                    )
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            digimon.name,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                color: CustomColor.bluePokemon
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            digimon.level,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                color: CustomColor.bluePokemon
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ]
                      ),
                    ),
                  );
                }
            );
          }
          return const TextCircularProgress(
              text: 'Fetching digimons, please wait...'
          );
        },
      ),
    );
  }
}