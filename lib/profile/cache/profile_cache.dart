import 'package:flutter_application_1/cache/cache_manager.dart';
import 'package:flutter_application_1/product/key/profile_keys.dart';
import 'package:flutter_application_1/profile/model/profile_model.dart';

class ProfileCacheManager {
  final CacheManager cacheManager;

  ProfileCacheManager(this.cacheManager);

  Future<bool> saveProfile(ProfileModel profileModel) async {
    final response = await cacheManager
        .saveString(ProfileKeys.profileId.name, profileModel.id.toString())
        .then((value) async =>
            await cacheManager.saveBool(ProfileKeys.isSaved.name, true));
    return response;
  }

  String? getProfileId() {
    final response = cacheManager.getString(ProfileKeys.profileId.name);
    return response ?? '';
  }
}
