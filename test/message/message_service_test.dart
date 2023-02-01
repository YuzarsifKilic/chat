import 'package:flutter_application_1/message/model/message_model.dart';
import 'package:flutter_application_1/message/service/message_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

void main() {
  late INetworkManager networkManager;
  setUp(() {
    networkManager = NetworkManager(
        options: BaseOptions(
            baseUrl: 'https://firstexperiement-default-rtdb.firebaseio.com'));
  });
  test('Sample Test', () async {
    MessageModel messageModel = MessageModel(
        date: '30.09.2022',
        message: 'Naber',
        time: '18:35',
        id: Id(ownerId: 3, receiverId: 5));

    MessageService messageService = MessageService(networkManager);

    final response = await messageService.sendMessage(messageModel);

    expect(response, isNotNull);

    // final result = await messageService.fetchMessageList(messageModel);

    // expect(result, isNotNull);
  });
}
