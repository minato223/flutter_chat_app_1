import 'dart:math';

import 'package:chat_app_1/components/shared.dart';
import 'package:chat_app_1/services/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_stack/image_stack.dart';

class Groupe extends StatefulWidget {
  const Groupe({Key? key}) : super(key: key);

  @override
  _GroupeState createState() => _GroupeState();
}

class _GroupeState extends State<Groupe> {
  List<String> images = <String>[
    "https://images.unsplash.com/photo-1458071103673-6a6e4c4a3413?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
    "https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80",
    "https://images.unsplash.com/photo-1470406852800-b97e5d92e2aa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
    "https://images.unsplash.com/photo-1473700216830-7e08d47f858e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors().messageBoxBackGroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: ListView(
          children: [header(), searchBar(), groupeItemBuilder()],
        ),
      )),
    );
  }

  Widget header() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Groupes",
                style: TextStyle(
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.w600,
                    fontSize: 22)),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.add,
                  color: MyColors().greyColor,
                ))
          ],
        ),
        const SizedBox(height: 10)
      ],
    );
  }

  Widget groupeItemBuilder() {
    return Container(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(colors: [
              MyColors().activeColor.withOpacity(0.6),
              MyColors().activeColor.withOpacity(0.9)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Text("Flutter Dev",
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 22)),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.bell_fill,
                      color: Colors.white,
                    ))
              ],
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                    child: Column(
                  children: [
                    ImageStack(
                      imageList: images,
                      imageRadius: 45,
                      imageCount: 3,
                      imageBorderWidth: 3,
                      totalCount: 4,
                      backgroundColor: Colors.white,
                      imageBorderColor: Colors.white,
                      extraCountBorderColor: Colors.white,
                      extraCountTextStyle: TextStyle(
                          color: MyColors().greyColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    )
                  ],
                )),
                // Container(
                //   width: 100,
                //   height: 100,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       image: const DecorationImage(
                //           image: AssetImage('assets/images/user.png'),
                //           fit: BoxFit.cover)),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Chip(
                      backgroundColor: Colors.white,
                      label: Text(Random().nextInt(100).toString(),
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: "Ubuntu",
                              fontWeight: FontWeight.w600,
                              color: MyColors().greyColor))),
                )
              ],
            )
          ],
        ));
  }
}
