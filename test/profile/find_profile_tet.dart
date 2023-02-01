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
    final numbers = <int>[2, 2, 10];
    final result = numbers.singleWhere((element) => element > 5);

    ProfileService profileService = ProfileService(networkManager);

    final response = await profileService.fetchProfile(3);

    expect(response, isNotNull);
  });
}
