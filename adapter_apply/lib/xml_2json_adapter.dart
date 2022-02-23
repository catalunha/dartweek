import 'dart:convert';

import 'package:xml2json/xml2json.dart';

class Xml2JsonAdapter {
  static Map<String, dynamic> adapter(String xml) {
    var xmlParse = Xml2Json();
    xmlParse.parse(xml);
    var xmlParker = xmlParse.toParker();
    return json.decode(xmlParker);
  }
}
