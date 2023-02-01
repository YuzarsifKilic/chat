import 'package:flutter_application_1/cache/cache_manager.dart';

class CacheInstance {
  static CacheInstance? _instance;
  static CacheInstance get instance {
    _instance ??= CacheInstance._init();
    return _instance!;
  }

  final CacheManager cacheManager = CacheManager();

  CacheInstance._init();

  // Future<void> initialize() async {
  //   await cacheManager.init();
  // }
}
