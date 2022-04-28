
import 'dart:convert';

import 'package:aformacproject/entity/hive/hive_repo.dart';
import 'package:aformacproject/service/http_service_custom.dart';
import 'package:aformacproject/service/url_const.dart';
import 'package:aformacproject/widgets/text_circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../entity/tinderish/profile.dart';
import '../../widgets/color/custom_color.dart';

class LikedProfile extends StatefulWidget {

  const LikedProfile({Key? key}) : super(key: key);

  @override
  State<LikedProfile> createState() => _LikedProfileState();
}

class _LikedProfileState extends State<LikedProfile> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liked profile'),
      ),
      body: FutureBuilder(
        future: HiveRepo.getAllToList('liked_profile'), // Future<Response>
        builder: (BuildContext context, AsyncSnapshot<List> dataList) {
          if (dataList.hasData) {
            // futureResponse.data => contenu de la future, ici une response
            List profiles = dataList.data as List;
            return ListView.builder(
              // /!\ bien penser à renseigner le nombre d'items à afficher
                itemCount: profiles.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  Profile profile = Profile.fromJson(profiles[index]);
                  return Card(
                    elevation: 3,
                    borderOnForeground: false,
                    shadowColor: Colors.grey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(profile.mediumImage),
                                Container(margin: const EdgeInsets.only(left: 12)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.sd_card, color: CustomColor.bluePokemon),
                                        Text(
                                          profile.firstName,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: CustomColor.bluePokemon
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.cake, color: CustomColor.bluePokemon),
                                        Text(
                                          profile.age.toString(),
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: CustomColor.bluePokemon
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.location_city, color: CustomColor.bluePokemon),
                                        Text(
                                          profile.city,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: CustomColor.bluePokemon
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // trailing : code qui viendra s'ajouter sur la partie de droite de ListTile
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete_forever,
                                color: Colors.red,
                              ),
                              onPressed: () => setState(() {
                                HiveRepo.removeEntity('liked_profile', profile.firstName+profile.city);
                              }),
                            ),
                          )
                        ]
                    ),
                  );
                }
            );
          }
          return const TextCircularProgress(
              text: 'Fetching profiles, please wait...'
          );
        },
      ),
    );
  }
}