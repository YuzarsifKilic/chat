import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/service/network_product.dart';
import 'package:flutter_application_1/profile/service/profile_service.dart';
import 'package:flutter_application_1/profile/view/profile_detail_view.dart';
import 'package:flutter_application_1/profile/viewModel/profile_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

class ChatFriendListView extends StatefulWidget {
  const ChatFriendListView({Key? key}) : super(key: key);
  @override
  State<ChatFriendListView> createState() => _ChatFriendListViewState();
}

class _ChatFriendListViewState extends State<ChatFriendListView> {
  late final ProfileViewModel _profileViewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _profileViewModel = ProfileViewModel(
        ProfileService(NetworkProduct.instance.networkManager));
    _profileViewModel.fetchProfileList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Observer(builder: (_) {
        return _profileViewModel.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: _profileViewModel.profileList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: SizedBox(
                      child: Column(children: [
                        SizedBox(
                          child: ElevatedButton(
                            onPressed: () {
                              context.navigateToPage(
                                  ProfileDetailView(
                                      profileModel:
                                          _profileViewModel.profileList[index]),
                                  type: SlideType.TOP);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white, elevation: 0),
                            child: Image.network(
                              _profileViewModel.profileList[index].avatar ?? '',
                              width: 150,
                              height: 150,
                            ),
                          ),
                        ),
                        SizedBox(
                          child: Text(
                              '${_profileViewModel.profileList[index].firstName} ${_profileViewModel.profileList[index].lastName}'),
                        ),
                      ]),
                    ),
                  );
                });
      }),
    );
  }
}
