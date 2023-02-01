import 'package:flutter_application_1/cache/cache_manager.dart';
import 'package:flutter_application_1/message/cache/message_cache.dart';
import 'package:flutter_application_1/message/model/message_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final MessageCacheManager messageCache;

  MessageModel messageModel = MessageModel(
      date: '30.09.2022',
      message: 'İyi',
      time: '18:35',
      id: Id(ownerId: 3, receiverId: 5));

  MessageModel messageModel2 = MessageModel(
      date: '30.09.2022',
      message: 'Napıyosun',
      time: '18:35',
      id: Id(ownerId: 5, receiverId: 3));

  MessageModel messageModel3 = MessageModel(
      date: '30.09.2022',
      message: 'Oturuyorum sen',
      time: '18:35',
      id: Id(ownerId: 3, receiverId: 5));

  setUp(() async {
    final CacheManager cacheManager = CacheManager();

    await cacheManager.init();

    messageCache = MessageCacheManager(cacheManager, messageModel);
  });
  test('Sample Test', () async {
    final response = await messageCache.saveMessageList(messageModel);

    final response2 = await messageCache.saveMessageList(messageModel2);

    final response3 = await messageCache.saveMessageList(messageModel3);

    final response4 = messageCache.getMessageList(messageModel);

    expect(response, isNotNull);

    expect(response2, isNotNull);

    expect(response3, isNotNull);

    expect(response4, isNotNull);
  });
}
