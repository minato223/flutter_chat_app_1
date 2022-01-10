// ignore_for_file: must_call_super

import 'package:chat_app_1/models/page.dart';
import 'package:chat_app_1/services/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_app_1/screens/message.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _currentPage = 0;
  late PageController _controller;
  final List<MyPage> _pages = [
    MyPage(id: 0, icon: CupertinoIcons.chat_bubble_text, page: const Message()),
    MyPage(id: 1, icon: CupertinoIcons.phone, page: const Message()),
    MyPage(id: 2, icon: CupertinoIcons.camera, page: const Message()),
    MyPage(id: 3, icon: CupertinoIcons.settings, page: const Message())
  ];
  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _controller.addListener(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: MyColors().navBorderColor))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _pages
              .map((page) => IconButton(
                    enableFeedback: false,
                    onPressed: () => setState(() => _currentPage = page.id),
                    icon: Icon(
                      page.icon,
                      color: _currentPage == page.id
                          ? MyColors().activeColor
                          : MyColors().greyColor,
                      size: 30,
                    ),
                  ))
              .toList(),
        ),
      ),
      body: PageView(
        controller: _controller,
        children: _pages.map((page) => page.page).toList(),
      ),
    );
  }
}
