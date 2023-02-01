import 'package:flutter_application_1/profile/model/profile_model.dart';
import 'package:flutter_application_1/profile/service/profile_service.dart';
import 'package:mobx/mobx.dart';
part 'profile_view_model.g.dart';

class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase with Store {
  final ProfileService profileService;

  _ProfileViewModelBase(this.profileService);

  @observable
  bool isLoading = false;

  @observable
  List<ProfileModel> profileList = [];

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> fetchProfileList() async {
    changeLoading();
    profileList = await profileService.fetchUserList() ?? [];
    changeLoading();
  }
}
