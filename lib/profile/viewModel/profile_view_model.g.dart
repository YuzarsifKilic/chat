// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileViewModel on _ProfileViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_ProfileViewModelBase.isLoading', context: context);

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

  late final _$profileListAtom =
      Atom(name: '_ProfileViewModelBase.profileList', context: context);

  @override
  List<ProfileModel> get profileList {
    _$profileListAtom.reportRead();
    return super.profileList;
  }

  @override
  set profileList(List<ProfileModel> value) {
    _$profileListAtom.reportWrite(value, super.profileList, () {
      super.profileList = value;
    });
  }

  late final _$fetchProfileListAsyncAction =
      AsyncAction('_ProfileViewModelBase.fetchProfileList', context: context);

  @override
  Future<void> fetchProfileList() {
    return _$fetchProfileListAsyncAction.run(() => super.fetchProfileList());
  }

  late final _$_ProfileViewModelBaseActionController =
      ActionController(name: '_ProfileViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_ProfileViewModelBaseActionController.startAction(
        name: '_ProfileViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_ProfileViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
profileList: ${profileList}
    ''';
  }
}
