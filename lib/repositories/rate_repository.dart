import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html;
import '../models/rate.dart';

class RateRepository {
  final String baseUrl = 'https://api.nbrb.by/exrates/rates';

  Future<dynamic> fetchRate({int? curId, String? onDate}) async {
    String url = '$baseUrl${curId != null ? '/$curId' : ''}';
    if (onDate != null) {
      url += '?ondate=$onDate';
    }

    final response =
        await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      if (curId != null) {
        return Rate.fromJson(json.decode(response.body));
      } else {
        final List<dynamic> ratesJson = json.decode(response.body);
        return ratesJson.map((json) => Rate.fromJson(json)).toList();
      }
    } else {
      throw Exception(
          'Failed to fetch currency rates: ${response.statusCode} - ${response.body}');
    }
  }

  Future<String?> getAlfaOnlineBuyUSD() async {
    const url = 'https://www.alfabank.by/exchange/digital/';
    final responce = await http.get(Uri.parse(url));

    if (responce.statusCode == 200) {
      var document = html.parse(responce.body);
      print(responce);
      print(responce.body);
      var priceElements = document.querySelectorAll(
          'div.table-item .price__value span[data-v-2b1dd755]');
      if (priceElements.isNotEmpty) {
        return priceElements[0].text;
      }
    } else {
      throw Exception(
          'Failed to fetch AlfaOnline USD buy rate: ${responce.statusCode} - ${responce.body}');
    }
    return null;
  }
}
