import 'package:flutter_application_1/message/model/message_model.dart';
import 'package:flutter_application_1/message/service/message_service.dart';
import 'package:mobx/mobx.dart';
part 'message_view_model.g.dart';

class MessageViewModel = _MessageViewModelBase with _$MessageViewModel;

abstract class _MessageViewModelBase with Store {
  final MessageService messageService;

  @observable
  bool isLoading = false;

  @observable
  List<MessageModel> messageList = [];

  _MessageViewModelBase(this.messageService);

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> fetchMessageList() async {
    changeLoading();
    messageList = await messageService.fetchMessageList() ?? [];
    changeLoading();
  }
}
