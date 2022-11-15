import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:instagram_clone/widgets/textfield_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });

    String res = await AuthMethods().loginUser(
        email: emailController.text, password: passwordController.text);

    if (res == "successful") {
      setState(() {
        _isLoading = false;
      });
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    } else {
      setState(() {
        _isLoading = false;
      });
      showSnackBar(res, context);
    }
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
                  //login button
                  InkWell(
                    onTap: () => loginUser(),
                    child: _isLoading
                        ? Center(child: CircularProgressIndicator())
                        : Container(
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
                  ),
                  SizedBox(height: 15),
                  Flexible(child: Container(), flex: 2),

                  //transition signup
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text("Don't have an account?"),
                        ),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text("Sign up",
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
