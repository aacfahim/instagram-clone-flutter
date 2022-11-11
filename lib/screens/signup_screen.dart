import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/textfield_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    bioController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(child: Container(), flex: 2),
                  //svg image
                  SvgPicture.asset(
                    'assets/ic_instagram.svg',
                    color: primaryColor,
                    height: 60,
                  ),
                  SizedBox(height: 24),
                  //circular widget to accept and show selected file
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                            "https://piceditorreview.com/wp-content/uploads/2021/10/Insta-pic.jpg"),
                      ),
                      Positioned(
                        bottom: -10,
                        left: 80,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  //username field
                  TextFieldInput(
                      hintText: "Username",
                      textEditingController: usernameController,
                      textInputType: TextInputType.text),
                  SizedBox(height: 20),
                  // email field
                  TextFieldInput(
                      hintText: "Email",
                      textEditingController: emailController,
                      textInputType: TextInputType.emailAddress),
                  SizedBox(height: 20),
                  //password field
                  TextFieldInput(
                      hintText: "Password",
                      textEditingController: passwordController,
                      textInputType: TextInputType.emailAddress,
                      isPass: true),

                  SizedBox(height: 20),
                  // bio field
                  TextFieldInput(
                      hintText: "Bio",
                      textEditingController: bioController,
                      textInputType: TextInputType.text),

                  SizedBox(height: 20),
                  //login button
                  Container(
                    child: Text("Log in"),
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      color: blueColor,
                    ),
                  ),
                  SizedBox(height: 15),
                  Flexible(child: Container(), flex: 2),

                  //transition signup
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text("Already have an account?"),
                      ),
                      SizedBox(width: 5),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text("Sign in",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      )
                    ],
                  )
                ],
              ))),
    );
  }
}
