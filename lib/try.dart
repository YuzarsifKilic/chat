import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/cache/profile_cache.dart';
import 'package:flutter_application_1/profile/cache/profile_cache.dart';

class TryView extends StatefulWidget {
  const TryView({Key? key}) : super(key: key);
  @override
  State<TryView> createState() => _TryViewState();
}

class _TryViewState extends State<TryView> {
  // late final String id;
  late final ProfileCacheManager _manager;

  @override
  void initState() {
    super.initState();
    getId();
  }

  Future<void> getId() async {
    await CacheInstance.instance.cacheManager.init();
    _manager = ProfileCacheManager(CacheInstance.instance.cacheManager);
    ProfileModel profileModel = ProfileModel(
        email: 'yuzarsifkilic@gmail.com',
        id: 2,
        firstName: 'Yusuf',
        lastName: 'Kılıç',
        avatar: 'asfasdfasdf',
        friends: []);

    final response = _manager.getProfileId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Text('aaaa'),
    );
  }
}
