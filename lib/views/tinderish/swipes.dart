
import 'dart:convert';

import 'package:aformacproject/service/http_service_custom.dart';
import 'package:aformacproject/service/url_const.dart';
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
    profileResponse = HttpServiceCustom().getRequest(
        UrlConst.urlRandomUser, '/api', null
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swiping'),
        actions: const [
          PopupMenu()
        ],
      ),
      body: FutureBuilder(
        future: profileResponse, // Future<Response>
        builder: (BuildContext context, AsyncSnapshot<dynamic> futureResponse) {
          if (futureResponse.hasData) {
            // futureResponse.data => contenu de la future, ici une response
            Profile profile = Profile.fromJson(jsonDecode(futureResponse.data.body));
            return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          profile.firstName,
                          style: const TextStyle(
                              fontSize: 28,
                              color: CustomColor.bluePokemon
                          ),
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