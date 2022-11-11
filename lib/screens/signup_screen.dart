import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/textfield_input.dart';

import '../utils/utils.dart';

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
  Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    bioController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: emailController.text,
      password: passwordController.text,
      username: usernameController.text,
      bio: bioController.text,
      file: _image!,
    );
    setState(() {
      _isLoading = false;
    });

    if (res != 'successful') {
      showSnackBar(res, context);
    }

    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(child: Container(), flex: 1),
                //SizedBox(height: 24),
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
                    _image != null
                        ? CircleAvatar(
                            radius: 60,
                            backgroundImage: MemoryImage(_image!),
                          )
                        : CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(
                                "https://www.vivekchatana.in/media/member/360_F_109006426_388PagqielgjFTAMgW59jRaDmPJvSBUL.jpg"),
                          ),
                    Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: () {
                          selectImage();
                        },
                        icon: Icon(
                          Icons.add_a_photo,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Expanded(
                  flex: 3,
                  child: ListView(
                    children: [
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
                      //sign up button
                      InkWell(
                        onTap: () {
                          signUpUser();
                        },
                        child: _isLoading
                            ? Center(child: CircularProgressIndicator())
                            : Container(
                                child: Text("Sign up"),
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
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
