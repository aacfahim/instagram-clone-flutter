import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagram_clone/screens/home.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Home(),
      bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(
                  height: 35,
                  image: AssetImage("assets/icons/home.png"),
                ),
                Image(
                  height: 35,
                  image: AssetImage("assets/icons/search.png"),
                ),
                Image(
                  height: 35,
                  image: AssetImage("assets/icons/add.png"),
                ),
                Image(
                  height: 35,
                  image: AssetImage("assets/icons/igtv.png"),
                ),
                Image(
                  height: 35,
                  image: AssetImage("assets/icons/user.png"),
                ),
              ],
            ),
          )),
    );
  }
}
