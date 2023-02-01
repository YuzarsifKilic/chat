import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel extends INetworkModel<MessageModel> {
  String? date;
  Id? id;
  String? message;
  String? time;

  MessageModel({this.date, this.id, this.message, this.time});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return _$MessageModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$MessageModelToJson(this);
  }

  @override
  MessageModel fromJson(Map<String, dynamic> json) {
    return _$MessageModelFromJson(json);
  }
}

@JsonSerializable()
class Id extends INetworkModel<Id> {
  int? ownerId;
  int? receiverId;

  Id({this.ownerId, this.receiverId});

  factory Id.fromJson(Map<String, dynamic> json) {
    return _$IdFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$IdToJson(this);
  }

  @override
  Id fromJson(Map<String, dynamic> json) {
    return _$IdFromJson(json);
  }
}
