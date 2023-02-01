// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      id: json['id'] as int?,
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      avatar: json['avatar'] as String?,
      friends: (json['friends'] as List<dynamic>?)
          ?.map((e) => Friends.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'avatar': instance.avatar,
      'friends': instance.friends,
    };

Friends _$FriendsFromJson(Map<String, dynamic> json) => Friends(
      id: json['id'] as int?,
    );

Map<String, dynamic> _$FriendsToJson(Friends instance) => <String, dynamic>{
      'id': instance.id,
    };
