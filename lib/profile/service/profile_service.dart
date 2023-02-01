import 'package:flutter_application_1/profile/model/profile_model.dart';
import 'package:vexana/vexana.dart';

abstract class IProfileService {
  final INetworkManager networkManager;

  IProfileService(this.networkManager);

  Future<List<ProfileModel>?> fetchUserList();
  Future<int?> findNextId();
  Future<bool> sendProfileModel(ProfileModel profileModel);
  Future<ProfileModel?> fetchProfile(int id);
  Future<List<ProfileModel>?> fetchFriendList(int id);
}

enum _ProfilePath { user }

extension _ProfilePathExtension on _ProfilePath {
  String get path => '/$name.json';
  String pathWithId(int id) {
    return '/$name/$id.json';
  }
}

class ProfileService extends IProfileService {
  ProfileService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<List<ProfileModel>?> fetchUserList() async {
    final response = await networkManager
        .send<ProfileModel, List<ProfileModel>>(_ProfilePath.user.path,
            parseModel: ProfileModel(), method: RequestType.GET);
    return response.data;
  }

  @override
  Future<int?> findNextId() async {
    final response = await fetchUserList();
    final nextId = response?.length ?? 0 + 2;
    return nextId;
  }

  @override
  Future<bool> sendProfileModel(ProfileModel profileModel) async {
    final id = await findNextId();
    final response = await networkManager.send<ProfileModel, ProfileModel>(
        _ProfilePath.user.pathWithId(id ?? 0),
        parseModel: ProfileModel(),
        data: profileModel,
        method: RequestType.PUT);

    if (response.data != null) {
      return true;
    }
    return false;
  }

  @override
  Future<ProfileModel?> fetchProfile(int id) async {
    final response = await networkManager.send<ProfileModel, ProfileModel>(
        _ProfilePath.user.pathWithId(id),
        parseModel: ProfileModel(),
        method: RequestType.GET);

    if (response.data != null) {
      return response.data;
    }
    return null;
  }

  @override
  Future<List<ProfileModel>?> fetchFriendList(int id) async {
    final List<ProfileModel> friendList = [];

    final response = await fetchProfile(id);

    final result = await fetchUserList();

    result?.forEach((resultList) {
      response?.friends?.forEach((responseList) {
        responseList.id == resultList.id ? friendList.add(resultList) : null;
      });
    });

    return friendList;
  }
}
