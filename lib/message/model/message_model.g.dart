// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
      date: json['date'] as String?,
      id: json['id'] == null
          ? null
          : Id.fromJson(json['id'] as Map<String, dynamic>),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'id': instance.id,
      'message': instance.message,
      'time': instance.time,
    };

Id _$IdFromJson(Map<String, dynamic> json) => Id(
      ownerId: json['ownerId'] as int?,
      receiverId: json['receiverId'] as int?,
    );

Map<String, dynamic> _$IdToJson(Id instance) => <String, dynamic>{
      'ownerId': instance.ownerId,
      'receiverId': instance.receiverId,
    };
