import 'package:dio/dio.dart';
import 'package:flutter_application_1/message/model/message_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final Dio dio;

  setUp(() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://firstexperiement-default-rtdb.firebaseio.com'));
  });

  test('Login Test - eve.holt@reqres.in & cityslicka ', () async {
    MessageModel messageModel =
        MessageModel("Merhaba", "asdfadf", "asdfasdfasdf", "asdfasdfasdfs");

    var formData = FormData.fromMap({
      'message': messageModel.message,
      'date': messageModel.date,
      'time': messageModel.time,
      'ownerId': messageModel.ownerId
    });

    final response = await dio.put('/messages/4.json', data: {
      'message': messageModel.message,
      'date': messageModel.date,
      'time': messageModel.time,
      'ownerId': messageModel.ownerId
    });

    expect(response.data, isNotNull);
  });
}
