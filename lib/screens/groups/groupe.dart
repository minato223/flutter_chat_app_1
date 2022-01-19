import 'dart:math';

import 'package:chat_app_1/components/shared.dart';
import 'package:chat_app_1/screens/messages/message_box.dart';
import 'package:chat_app_1/services/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:image_stack/image_stack.dart';

class Groupe extends StatefulWidget {
  const Groupe({Key? key}) : super(key: key);

  @override
  _GroupeState createState() => _GroupeState();
}

class _GroupeState extends State<Groupe> {
  List<String> images = <String>[
    "assets/images/img1.jpg",
    "assets/images/img2.jpg",
    "assets/images/img3.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors().messageBoxBackGroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: ListView(
          children: [
            header(),
            searchBar(),
            ...List.generate(5, (index) => groupeItemBuilder())
          ],
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
    Color color = generateRandomColor3();
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const MessageBox()));
      },
      child: Container(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
          margin: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                  colors: [color.withOpacity(0.6), color.withOpacity(0.9)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
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
                            fontSize: 22)),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.bell_fill,
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
                      Text(lorem(paragraphs: 2),
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                              fontFamily: "Ubuntu",
                              fontWeight: FontWeight.w500,
                              fontSize: 15)),
                      const SizedBox(height: 15),
                      ImageStack(
                        imageList: images,
                        imageRadius: 45,
                        imageCount: 3,
                        imageBorderWidth: 3,
                        imageSource: ImageSource.Asset,
                        totalCount: 10,
                        backgroundColor: Colors.white,
                        imageBorderColor: Colors.white,
                        extraCountBorderColor: Colors.white,
                        extraCountTextStyle: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      )
                    ],
                  )),
                  const SizedBox(width: 50),
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
                            style: const TextStyle(
                                fontFamily: "Ubuntu",
                                fontWeight: FontWeight.w600))),
                  )
                ],
              )
            ],
          )),
    );
  }
}
