import 'package:flutter/material.dart';
import 'package:flutter_application_1/message/model/message_model.dart';
import 'package:flutter_application_1/message/service/message_service.dart';
import 'package:flutter_application_1/message/viewModel/message_view_model.dart';
import 'package:flutter_application_1/product/service/network_product.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MessageView extends StatefulWidget {
  const MessageView({Key? key, required this.receiverId, required this.ownerId})
      : super(key: key);
  final String? ownerId;
  final String? receiverId;
  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  late final MessageViewModel _messageViewModel;
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController =
      ScrollController(initialScrollOffset: 50);

  @override
  void initState() {
    _messageViewModel = MessageViewModel(MessageService(
        NetworkProduct.instance.networkManager,
        widget.ownerId ?? 'Boş',
        widget.receiverId ?? 'Boş'));

    _messageViewModel.fetchMessageList();
    super.initState();
  }

  void _scrollPosition() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 100), curve: Curves.easeOut);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Observer(builder: (_) {
          return _messageViewModel.isLoading
              ? const SizedBox()
              : Stack(alignment: Alignment.bottomCenter, children: [
                  ListView.builder(
                      controller: _scrollController,
                      itemCount: _messageViewModel.messageList.length,
                      itemBuilder: (context, index) {
                        return _MessageView(
                            _messageViewModel.messageList[index]);
                      }),
                  Container(
                    margin: const EdgeInsets.only(top: 8.0),
                    padding: const EdgeInsets.only(top: 10.0),
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      color: Colors.grey[700],
                      child: Row(
                        children: [
                          Expanded(
                              child: TextFormField(
                            decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)))),
                            controller: _messageController,
                          )),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                  onPressed: () async {
                                    // if (_scrollController.hasClients) {
                                    //   final position = _scrollController
                                    //       .position.maxScrollExtent;
                                    //   _scrollController.jumpTo(position);
                                    // }
                                    MessageModel messageModel = MessageModel(
                                        date: '9.10.2022',
                                        time: '22:51',
                                        id: Id(
                                            ownerId: int.tryParse(
                                                widget.ownerId ?? '0'),
                                            receiverId: int.tryParse(
                                                widget.receiverId ?? '0')),
                                        message: _messageController.text);
                                    final response = await _messageViewModel
                                        .messageService
                                        .sendMessage(messageModel);

                                    response
                                        ? setState(
                                            () {
                                              _messageViewModel
                                                  .fetchMessageList();
                                              _messageController.clear();
                                            },
                                          )
                                        : null;
                                  },
                                  icon: const Icon(
                                    Icons.send,
                                    color: Colors.white,
                                  )))
                        ],
                      ),
                    ),
                  )
                ]);
        }));
  }

  bool checkOwnerMessage(MessageModel messageModel) {
    return int.tryParse(widget.ownerId ?? '0') == messageModel.id?.ownerId;
  }

  Container _MessageView(MessageModel messageModel) {
    return Container(
      padding: EdgeInsets.only(
          bottom: 5,
          top: 5,
          left: checkOwnerMessage(messageModel) ? 0 : 24,
          right: checkOwnerMessage(messageModel) ? 24 : 0),
      alignment: checkOwnerMessage(messageModel)
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
          margin: checkOwnerMessage(messageModel)
              ? const EdgeInsets.only(left: 30)
              : const EdgeInsets.only(right: 30),
          padding:
              const EdgeInsets.only(top: 17, bottom: 17, left: 20, right: 20),
          decoration: BoxDecoration(
            borderRadius: checkOwnerMessage(messageModel)
                ? const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  )
                : const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
            color: checkOwnerMessage(messageModel) ? Colors.green : Colors.grey,
          ),
          child: Column(
            children: [
              Text(messageModel.message ?? ''),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    messageModel.time ?? '',
                    style: const TextStyle(fontSize: 10),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
