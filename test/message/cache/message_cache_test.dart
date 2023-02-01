import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  SharedPreferences? sharedPreferences;
  setUp(() async {
    sharedPreferences = await SharedPreferences.getInstance();
  });
  test('Sample Test', () async {
    List<String> messageList = [
      'Naber',
      'İyi senden naber',
      'Ben de iyi ne olsun'
    ];

    List<String> newMessageList = ['Bakalım'];

    List<String> getList;

    final response =
        await sharedPreferences?.setStringList('Messages', messageList);

    getList = sharedPreferences?.getStringList('Messages') ?? [];

    expect(response, isNotNull);

    expect(getList, isNotNull);

    sharedPreferences?.reload();

    final newMessage = sharedPreferences?.remove('Messages');

    expect(newMessage, isNotNull);

    getList.add('Merhaba');

    final response2 =
        await sharedPreferences?.setStringList('Messages', getList);

    final List<String>? getList2 = sharedPreferences?.getStringList('Messages');

    expect(response2, isNotNull);

    expect(getList2, isNotNull);
  });
}
