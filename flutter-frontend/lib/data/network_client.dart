import 'dart:convert';
import 'dart:io';

import 'package:csci_project/data/api_endpoints.dart';
import 'package:csci_project/data/api_exception.dart';
import 'package:http/browser_client.dart' as http;

class NetworkClient {
  final _client = http.BrowserClient();

  Uri _makeUri(String path, [Map<String, dynamic>? parameters]) {
    final uri = Uri.https(ApiEndpoints.baseUrl, path, parameters);
    return uri;
  }

  Future<T> get<T>({
    required String path,
    required T Function(dynamic json) parser,
    Map<String, dynamic>? parameters,
    Map<String, String>? headers,
  }) async {
    final url = _makeUri(path, parameters);
    try {
      //GET
      final response = await _client.get(url, headers: {'Content-Type': 'application/json'}); //, headers: headers);

      if (response.statusCode == 200) {
        print('code 200 GET');
        final jsonDecoded = jsonDecode(utf8.decode(response.bodyBytes));
        // serialising
        return parser(jsonDecoded);
      } else {
        throw ApiException(response.statusCode, response.body);
      }
    } on SocketException catch (e) {
      throw ApiException(1, e.message);
    } catch (e) {
      rethrow;
    }
  }

  Future<T> post<T>({
    required String path,
    required T Function(dynamic json) parser,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    final url = _makeUri(path);
    try {
      final response = await _client.post(url, body: jsonEncode(body), headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200) {
        final jsonDecoded = jsonDecode(utf8.decode(response.bodyBytes));
        // serialising
        return parser(jsonDecoded);
      } else {
        throw ApiException(response.statusCode, response.body);
      }
    } on SocketException catch (e) {
      throw ApiException(1, e.message);
    } catch (e) {
      rethrow;
    }
  }


  Future<T> put<T>({
    required String path,
    required T Function(dynamic json) parser,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    final url = _makeUri(path);
    try {
      final response = await _client.put(url, body: jsonEncode(body), headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200) {
        final jsonDecoded = jsonDecode(utf8.decode(response.bodyBytes));
        // serialising
        return parser(jsonDecoded);
      } else {
        throw ApiException(response.statusCode, response.body);
      }
    } on SocketException catch (e) {
      throw ApiException(1, e.message);
    } catch (e) {
      rethrow;
    }
  }
}
