import 'package:flutter/material.dart';
import 'package:flutter_application_1/message/view/message_view.dart';
import 'package:flutter_application_1/product/cache/profile_cache.dart';
import 'package:flutter_application_1/profile/cache/profile_cache.dart';
import 'package:flutter_application_1/profile/model/profile_model.dart';
import 'package:kartal/kartal.dart';

class ProfileDetailView extends StatefulWidget {
  const ProfileDetailView({Key? key, required this.profileModel})
      : super(key: key);
  final ProfileModel profileModel;
  @override
  State<ProfileDetailView> createState() => _ProfileDetailViewState();
}

class _ProfileDetailViewState extends State<ProfileDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: context.dynamicWidth(1),
            child: Image.network(
              widget.profileModel.avatar ?? '',
              fit: BoxFit.fitWidth,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${widget.profileModel.firstName} ${widget.profileModel.lastName}',
                  style: const TextStyle(wordSpacing: 5, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40)))),
                    onPressed: () async {
                      await CacheInstance.instance.cacheManager.init();
                      final ProfileCacheManager manager = ProfileCacheManager(
                          CacheInstance.instance.cacheManager);
                      ProfileModel profileModel = ProfileModel(
                          email: 'yuzarsifkilic@gmail.com',
                          id: 2,
                          firstName: 'Yusuf',
                          lastName: 'Kılıç',
                          avatar: 'asfasdfasdf',
                          friends: []);
                      await manager.saveProfile(profileModel);
                      context.navigateToPage(MessageView(
                          receiverId: widget.profileModel.id.toString(),
                          ownerId: manager.getProfileId()));
                    },
                    child: const Icon(Icons.message)),
              )
            ],
          )
        ],
      ),
    );
  }
}
