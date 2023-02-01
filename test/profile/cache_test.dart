import 'package:flutter_application_1/cache/cache_manager.dart';
import 'package:flutter_application_1/profile/cache/profile_cache.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final ProfileCacheManager profileCache;
  setUp(() async {
    CacheManager cacheManager = CacheManager();

    await cacheManager.init();

    profileCache = ProfileCacheManager(cacheManager);
  });
  test('Sample Test', () {
    final response = profileCache.getProfileId();

    expect(response, isNotNull);
  });
}
