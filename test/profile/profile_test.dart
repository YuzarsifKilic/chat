import 'package:flutter_application_1/profile/model/profile_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

void main() {
  late INetworkManager networkManager;

  setUp(() {
    networkManager = NetworkManager(
        options: BaseOptions(
            baseUrl: 'https://firstexperiement-default-rtdb.firebaseio.com/'));
  });
  test('Fetch All profile datas ', () async {
    final response = await networkManager
        .send<ProfileModel, List<ProfileModel>>('messages.json',
            parseModel: ProfileModel(), method: RequestType.GET);

    final result = response.error?.statusCode;

    expect(result, isNotNull);

    expect(response.data, isNotNull);
  });
}
