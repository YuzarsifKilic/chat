import 'package:flutter_application_1/product/cache/profile_cache.dart';
import 'package:flutter_application_1/profile/cache/profile_cache.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final ProfileCacheManager profileCache;

  profileCache = ProfileCacheManager(CacheInstance.instance.cacheManager);
  setUp(() {});
  test('Sample Test', () {
    final result = profileCache.getProfileId();

    expect(result, isNotNull);
  });
}
