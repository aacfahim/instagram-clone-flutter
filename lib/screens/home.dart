import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagram_clone/model/posts.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final posts = Posts.getPosts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: Image(
            height: 50,
            fit: BoxFit.cover,
            image: AssetImage("assets/icons/insta_logo.png"),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 2.0),
              child: Image(
                width: 28,
                image: AssetImage("assets/icons/like.png"),
              ),
            ),
            SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Image(
                width: 30,
                image: AssetImage("assets/icons/chat.png"),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 50,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage("${posts[index].dp}"),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "${posts[index].name}",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: ((context, index) => SizedBox(width: 10)),
              ),
            ),
            Expanded(
              flex: 5,
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: posts.length,
                itemBuilder: ((context, index) {
                  return Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage("${posts[index].dp}"),
                            ),
                            SizedBox(width: 8),
                            Text(
                              "${posts[index].name}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Spacer(),
                            Icon(Icons.more_vert, color: Colors.white),
                          ],
                        ),
                        SizedBox(height: 8),
                        Container(
                          height: 400,
                          width: double.infinity,
                          child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage("${posts[index].post}")),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 30,
                          child: Row(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image(
                                      image:
                                          AssetImage("assets/icons/like.png")),
                                  SizedBox(width: 10),
                                  Image(
                                      image:
                                          AssetImage("assets/icons/chat.png")),
                                  SizedBox(width: 10),
                                  Image(
                                      image:
                                          AssetImage("assets/icons/send.png")),
                                ],
                              ),
                              Spacer(),
                              Image(
                                  image:
                                      AssetImage("assets/icons/bookmark.png")),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${posts[index].name}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 18),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  "${posts[index].caption}",
                                  softWrap: false,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "${posts[index].time}",
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                  );
                }),
                separatorBuilder: ((context, index) => SizedBox(height: 30)),
              ),
            )
          ],
        ));
  }
}
