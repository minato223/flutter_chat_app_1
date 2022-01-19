import 'package:chat_app_1/components/shared.dart';
import 'package:chat_app_1/screens/messages/message_box.dart';
import 'package:chat_app_1/services/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: ListView(
          children: [
            header(),
            searchBar(),
            activities(),
            messagesText(),
            ...List.generate(10, (index) => messageTile())
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
            const Text("Messages",
                style: TextStyle(
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.w600,
                    fontSize: 22)),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.location,
                  color: MyColors().greyColor,
                ))
          ],
        ),
        const SizedBox(height: 10)
      ],
    );
  }

  Widget activities() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        const Text("Activities",
            style: TextStyle(
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.w600,
                fontSize: 17)),
        const SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(10, (index) => storyTile()).toList(),
          ),
        )
      ],
    );
  }

  Widget messagesText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(height: 20),
        Text("Messages",
            style: TextStyle(
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.w600,
                fontSize: 17)),
        SizedBox(height: 20),
      ],
    );
  }

  Widget messageTile() {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const MessageBox()));
      },
      child: Container(
        height: 70,
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 70,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                border: Border.all(color: MyColors().activeColor, width: 2),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(2),
              child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/user.png')))),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(lorem(words: 1),
                    style: const TextStyle(
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.w600,
                        fontSize: 17)),
                const SizedBox(height: 7),
                Expanded(
                  child: Text(lorem(paragraphs: 2),
                      maxLines: 2,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontFamily: "Ubuntu",
                          height: 1.3,
                          color: MyColors().greyColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 15)),
                ),
              ],
            )),
            Text("23min",
                style: TextStyle(
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.w600,
                    color: MyColors().activeColor,
                    fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Widget storyTile() {
    return Container(
      width: 90,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 90,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              border: Border.all(color: MyColors().activeColor, width: 2),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(2),
            child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/user.png')))),
          ),
          Text(lorem(words: 1),
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.w600,
                  fontSize: 15))
        ],
      ),
    );
  }
}
