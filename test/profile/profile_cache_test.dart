import 'package:flutter_application_1/product/cache/profile_cache.dart';
import 'package:flutter_application_1/profile/cache/profile_cache.dart';
import 'package:flutter_application_1/profile/model/profile_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final ProfileCacheManager profileCache;

  ProfileModel profileModel = ProfileModel(
      email: 'yuzarsifkilic@gmail.com',
      id: 2,
      firstName: 'Yusuf',
      lastName: 'Kılıç',
      avatar: 'asfasdfasdf',
      friends: []);

  setUp(() async {
    // final CacheManager cacheManager = CacheManager();

    // await cacheManager.init();

    profileCache = ProfileCacheManager(CacheInstance.instance.cacheManager);
  });
  test('Sample Test', () async {
    // final response = await profileCache.saveProfile(profileModel);

    // expect(response, isNotNull);

    final result = profileCache.getProfileId();

    expect(result, isNotNull);
  });
}
