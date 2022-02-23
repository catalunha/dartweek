import 'package:dio/dio.dart';

class CustomDioBuilder
    implements Methods, Path, Headers, Parameters, QueryParameters, Run {
  String _methodValue = '';
  String _pathValue = '';
  dynamic _dataValue = '';
  Map<String, dynamic> _headersValue = <String, dynamic>{};
  Map<String, dynamic> _queryParametersValue = <String, dynamic>{};
  CustomDioBuilder._();
  static Methods get instance => CustomDioBuilder._();
  @override
  Path get() {
    _methodValue = 'GET';
    return this;
  }

  @override
  Path patch() {
    _methodValue = 'PATCH';
    return this;
  }

  @override
  Path post() {
    _methodValue = 'POST';
    return this;
  }

  @override
  Path put() {
    _methodValue = 'PUT';
    return this;
  }

  @override
  Headers path(String path) {
    _pathValue = path;
    return this;
  }

  @override
  Headers addHeaders(String name, value) {
    _headersValue.addAll({name: value});
    return this;
  }

  @override
  Parameters params() {
    return this;
  }

  @override
  Run data(data) {
    _dataValue = data;
    return this;
  }

  @override
  QueryParameters queryParameters() {
    return this;
  }

  @override
  QueryParameters addQueryParameters(String name, value) {
    _queryParametersValue.addAll({name: value});
    return this;
  }

  @override
  Future<Response> run() {
    return Dio().request(
      _pathValue,
      options: Options(
        method: _methodValue,
        headers: _headersValue,
      ),
      queryParameters: _queryParametersValue,
      data: _dataValue,
    );
  }
}

abstract class Methods {
  Path post();
  Path get();
  Path put();
  Path patch();
}

abstract class Path {
  Headers path(String path);
}

abstract class Headers {
  Headers addHeaders(String name, dynamic value);
  Parameters params();
}

abstract class Parameters {
  QueryParameters queryParameters();
  Run data(dynamic data);
}

abstract class QueryParameters {
  QueryParameters addQueryParameters(String name, dynamic value);
  Future<Response> run();
}

abstract class Run {
  Future<Response> run();
}
