import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final Dio dio;

  setUp(() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://firstexperiement-default-rtdb.firebaseio.com'));
  });

  test('Login Test - eve.holt@reqres.in & cityslicka ', () async {
    // NewMessageService messageService = NewMessageService(dio);

    // List<NewMessageModel> resources = [];

    // List<Id?> idList = [];

    // // resources = (await messageService.fetchMessageItem()) ?? [];

    // resources = await messageService.fetchMessageItem() ?? [];

    // for (var element in resources) {
    //   idList.add(element.id);
    // }

    var response = await dio.get('/user_profile.json');

    // if (response.statusCode == HttpStatus.ok) {
    //   final jsonBody = response.data;
    //   if (jsonBody is List) {
    //     for (var element in jsonBody) {
    //       response = NewMessageModel.fromJson(element);
    //     }
    //   }
    // }

    expect(response, isNotNull);
  });
}
