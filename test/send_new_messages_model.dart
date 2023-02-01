import 'package:dio/dio.dart';
import 'package:flutter_application_1/new/model/new_message_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final Dio dio;

  setUp(() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://firstexperiement-default-rtdb.firebaseio.com'));
  });

  test('Login Test - eve.holt@reqres.in & cityslicka ', () async {
    List<Id> id = [Id(ownerId: 0, receiverId: 2)];

    NewMessageModel messageModel = NewMessageModel(
        date: '22.09.2022', time: '00:02', message: 'Merhaba', id: id);

    final response = await dio.put('/messages/4.json', data: {
      'message': messageModel.message,
      'date': messageModel.date,
      'time': messageModel.time,
      'id': messageModel.id
    });

    expect(response.data, isNotNull);
  });
}
