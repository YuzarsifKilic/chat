import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel extends INetworkModel<ProfileModel> {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;
  List<Friends>? friends;

  ProfileModel(
      {this.id,
      this.email,
      this.firstName,
      this.lastName,
      this.avatar,
      this.friends});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return _$ProfileModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$ProfileModelToJson(this);
  }

  @override
  ProfileModel fromJson(Map<String, dynamic> json) {
    return _$ProfileModelFromJson(json);
  }
}

@JsonSerializable()
class Friends extends INetworkModel<Friends> {
  int? id;

  Friends({this.id});

  factory Friends.fromJson(Map<String, dynamic> json) {
    return _$FriendsFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$FriendsToJson(this);
  }

  @override
  Friends fromJson(Map<String, dynamic> json) {
    return _$FriendsFromJson(json);
  }
}
