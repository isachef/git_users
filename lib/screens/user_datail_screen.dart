import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tt_c/models/user_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserDetailScreen extends StatelessWidget {
  final User user;

  const UserDetailScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localizations = AppLocalizations.of(context);

    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 370,
            child: Stack(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 220,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(user.avatarUrl), fit: BoxFit.cover),
                  ),
                ),
                ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 220,
                      // color: Colors.grey.withOpacity(0.2),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              const Color.fromARGB(255, 19, 18, 18)
                                  .withOpacity(0.1),
                              const Color.fromARGB(15, 214, 209, 209)
                                  .withOpacity(0.1)
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 130,
                  left: 95,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        user.avatarUrl,
                        height: 190,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                '${localizations!.login} : ${user.login}',
                style: TextStyle(fontSize: 34),
              ),
              Text(
                'id : ${user.id}',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                '${localizations!.type} : ${user.type == Type.USER ? localizations!.user : localizations!.organization}',
                style: const TextStyle(fontSize: 30),
              ),
              user.siteAdmin
                  ? const Text(
                      'Site Admin',
                      style: TextStyle(fontSize: 30),
                    )
                  : SizedBox.shrink(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Divider(
                  thickness: 2,
                  height: 2,
                ),
              ),
              CustomTextWidget(
                title: 'url',
                text: user.url,
              ),
              CustomTextWidget(
                title: 'htmlUrl',
                text: user.htmlUrl,
              ),
              CustomTextWidget(
                title: 'followersUrl',
                text: user.followersUrl,
              ),
              CustomTextWidget(
                title: 'followingUrl',
                text: user.followingUrl,
              ),
              CustomTextWidget(
                title: 'gistsUrl',
                text: user.gistsUrl,
              ),
              CustomTextWidget(
                title: 'starredUrl',
                text: user.starredUrl,
              ),
              CustomTextWidget(
                title: 'subscriptionsUrl',
                text: user.subscriptionsUrl,
              ),
              CustomTextWidget(
                title: 'organizationsUrl',
                text: user.organizationsUrl,
              ),
              CustomTextWidget(
                title: 'reposUrl',
                text: user.reposUrl,
              ),
              CustomTextWidget(
                title: 'eventsUrl',
                text: user.eventsUrl,
              ),
              CustomTextWidget(
                title: 'receivedEventsUrl',
                text: user.receivedEventsUrl,
              ),
            ]),
          )
        ],
      ),
    );
  }
}

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    required this.title,
    required this.text,
  });

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: '$title : ',
                style: TextStyle(fontSize: 20,color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text:  text,
                    style: TextStyle(fontSize: 20,color: Colors.grey),
                  ),
                ]
              ),

            ),
            Divider()
          ],
        )

      ;
  }
}
