import 'package:flutter_application_1/message/model/message_model.dart';
import 'package:vexana/vexana.dart';

abstract class IMessageService {
  final INetworkManager networkManager;
  final String ownerProfileId;
  final String receiverId;

  IMessageService(this.networkManager, this.ownerProfileId, this.receiverId);

  Future<List<MessageModel>?> fetchMessageList();
  Future<bool> sendMessage(MessageModel messageModel);
  Future<int> _findNextId();
}

enum _MessagePath { message }

extension _MessagePathExtension on _MessagePath {
  String getPath(String ownerProfileId, String receiverId) {
    return '/$name/${ownerProfileId}_$receiverId.json';
  }

  String getPathWithId(String ownerProfileId, String receiverId, int id) {
    return '/$name/${ownerProfileId}_$receiverId/$id.json';
  }
}

class MessageService extends IMessageService {
  MessageService(
      INetworkManager networkManager, String ownerProfileId, String receiverId)
      : super(networkManager, ownerProfileId, receiverId);

  @override
  Future<List<MessageModel>?> fetchMessageList() async {
    final response =
        await networkManager.send<MessageModel, List<MessageModel>>(
            _MessagePath.message.getPath(ownerProfileId, receiverId),
            parseModel: MessageModel(),
            method: RequestType.GET);
    return response.data;
  }

  @override
  Future<bool> sendMessage(MessageModel messageModel) async {
    final nextId = await _findNextId();
    final response = await networkManager.send<MessageModel, MessageModel>(
        _MessagePath.message.getPathWithId(ownerProfileId, receiverId, nextId),
        parseModel: MessageModel(),
        data: messageModel,
        method: RequestType.PUT);
    return response.data != null ? true : false;
  }

  @override
  Future<int> _findNextId() async {
    final response = await fetchMessageList();
    final lengthOfMessageList = response?.length;
    return lengthOfMessageList ?? 0;
  }
}
