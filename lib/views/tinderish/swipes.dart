
import 'dart:convert';

import 'package:aformacproject/entity/hive/hive_repo.dart';
import 'package:aformacproject/service/http_service_custom.dart';
import 'package:aformacproject/service/url_const.dart';
import 'package:aformacproject/views/tinderish/liked_profile.dart';
import 'package:aformacproject/widgets/text_circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../entity/tinderish/profile.dart';
import '../../widgets/color/custom_color.dart';
import '../../widgets/popupmenu.dart';

class Swipes extends StatefulWidget {

  const Swipes({Key? key}) : super(key: key);

  @override
  State<Swipes> createState() => _SwipesState();
}

class _SwipesState extends State<Swipes> {

  Profile? profile;
  Future<Response>? profileResponse;

  @override
  void initState() {
    super.initState();
    refreshProfile();
  }

  void refreshProfile() {
    profileResponse = HttpServiceCustom().getRequest(
        UrlConst.urlRandomUser, '/api', null
    );
  }

  void handleMenuSelected(int popupMenuItemClicked, BuildContext context) {
    if (popupMenuItemClicked == 0) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const LikedProfile()
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swiping'),
        actions: [
          PopupMenuButton<int>(
              onSelected: (popupMenuItemClicked) => handleMenuSelected(
                  popupMenuItemClicked, context
              ),
              itemBuilder: (context) => [
                const PopupMenuItem<int>(
                  child: Text('Mes profils likés'),
                  value: 0,
                ),
              ]
          )
        ],
      ),
      body: FutureBuilder(
        future: profileResponse, // Future<Response>
        builder: (BuildContext context, AsyncSnapshot<dynamic> futureResponse) {
          if (futureResponse.hasData) {
            // futureResponse.data => contenu de la future, ici une response
            Profile profile = Profile.fromJsonApi(jsonDecode(futureResponse.data.body));
            return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          profile.firstName + ', ' + profile.age.toString(),
                          style: const TextStyle(
                              fontSize: 28,
                              color: CustomColor.bluePokemon
                          ),
                        ),
                        Icon(
                          profile.gender
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Image.network(profile.largeImage),
                        margin: const EdgeInsets.only(top: 12),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 12, top: 12),
                        child: ElevatedButton(
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                            child: Icon(
                              Icons.close,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              refreshProfile();
                            });
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 12, top: 12),
                        child: ElevatedButton(
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                            child: Icon(
                              Icons.favorite,
                              size: 40,
                              color: Colors.red,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                          onPressed: () {
                            HiveRepo.saveDataToBox('liked_profile', profile.firstName+profile.city, profile.toJson());
                            setState(() {
                              refreshProfile();
                            });
                          },
                        ),
                      )
                    ],
                  )
                ]
            );
          }
          return const TextCircularProgress(
              text: 'Fetching profile, please wait...'
          );
        },
      ),
    );
  }
}