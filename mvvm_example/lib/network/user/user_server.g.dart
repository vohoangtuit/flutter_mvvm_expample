// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_server.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _UserServer implements UserServer {
  _UserServer(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://vohoangtu-authencation.herokuapp.com/api/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  login(userLogin) async {
    ArgumentError.checkNotNull(userLogin, 'userLogin');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(userLogin?.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'user/login',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserBaseResponseModel<dynamic>.fromJson(_result.data);
    return value;
  }
}
