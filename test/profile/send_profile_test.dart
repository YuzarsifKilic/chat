import 'package:flutter_application_1/profile/model/profile_model.dart';
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
    ProfileModel profileModel = ProfileModel(
        id: 3,
        email: 'yuzarsifkilic@gmail.com',
        firstName: 'Yusuf',
        lastName: 'Kılıç',
        avatar: 'adsfasdfasdfasdf');

    final result = await networkManager.send<ProfileModel, List<ProfileModel>>(
        '/user.json',
        parseModel: ProfileModel(),
        method: RequestType.GET);

    // expect(result.data?.length++, isNotNull);

    ProfileService profileService = ProfileService(networkManager);

    final response = await profileService.sendProfileModel(profileModel);

    expect(response, true);
  });
}
