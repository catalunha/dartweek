import 'package:adapter_apply/xml_2json_adapter.dart';
import 'package:dio/dio.dart';

class Xml2JsonTransformer extends DefaultTransformer {
  @override
  Future transformResponse(
      RequestOptions options, ResponseBody response) async {
    var responseData = await super.transformResponse(options, response);
    return Xml2JsonAdapter.adapter(responseData);
  }
}
