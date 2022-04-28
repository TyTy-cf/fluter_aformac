
import 'dart:io';
import 'package:http/http.dart';
import 'package:http/io_client.dart';

class HttpServiceCustom {

  final http = IOClient(HttpClient());

  /// Différents type de requêtes Http :
  /// GET
  /// POST
  /// PUT
  /// PATCH
  /// DELETE

  Future<Response> getRequest(String rawUrl, String route, param) {
    Uri uri = Uri.https(rawUrl, route);
    if (param != null) {
      uri = Uri.https(rawUrl, route, param);
    }

    return http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
  }

  /// POST : est utilisé pour créer des entités
  /// Souvent dans le json (body), id n'existe pas !
  /// param contient le json de l'objet à ajouter
  /// {name: 'toto', email: 'toto@toto.fr'}
  Future<Response> postRequest(String rawUrl, String route, param) {
    return http.post(
      Uri.https(rawUrl, route),
      body: param,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
  }

  /// PUT : est utilisé pour modifier des entités
  /// Souvent dans le json (body), id existe, afin d'indiquer en code derrière
  /// que l'entité doit être modifiée
  /// param contient le json de l'objet à ajouter
  /// {id: 56, name: 'toto', email: 'toto@toto.fr'}
  Future<Response> putRequest(String rawUrl, String route, param) {
    return http.put(
      Uri.https(rawUrl, route),
      body: param,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
  }

}