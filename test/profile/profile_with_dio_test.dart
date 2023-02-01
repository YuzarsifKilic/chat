import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final Dio dio;
  setUp(() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://firstexperiement-default-rtdb.firebaseio.com'));
  });
  test('Sample Test', () async {
    final response = await dio.get('/user.json');

    final result = response.data.length;

    final isOk = response.statusMessage;

    final ok = response.statusCode;

    expect(response.data, isNotNull);
    expect(result, isNotNull);
    expect(isOk, isNotNull);
  });
}
