import 'package:flutter_application_1/profile/service/profile_service.dart';
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
    ProfileService profileService = ProfileService(networkManager);

    final response = await profileService.fetchFriendList(0);

    expect(response, isNotNull);
  });
}
