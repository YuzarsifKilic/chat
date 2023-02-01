// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MessageViewModel on _MessageViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_MessageViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$messageListAtom =
      Atom(name: '_MessageViewModelBase.messageList', context: context);

  @override
  List<MessageModel> get messageList {
    _$messageListAtom.reportRead();
    return super.messageList;
  }

  @override
  set messageList(List<MessageModel> value) {
    _$messageListAtom.reportWrite(value, super.messageList, () {
      super.messageList = value;
    });
  }

  late final _$fetchMessageListAsyncAction =
      AsyncAction('_MessageViewModelBase.fetchMessageList', context: context);

  @override
  Future<void> fetchMessageList() {
    return _$fetchMessageListAsyncAction.run(() => super.fetchMessageList());
  }

  late final _$_MessageViewModelBaseActionController =
      ActionController(name: '_MessageViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_MessageViewModelBaseActionController.startAction(
        name: '_MessageViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_MessageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
messageList: ${messageList}
    ''';
  }
}
