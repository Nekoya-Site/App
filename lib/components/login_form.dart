import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

import 'package:nekoya_flutter/api/api.dart';
import 'package:nekoya_flutter/components/menu.dart';
import 'package:nekoya_flutter/data/auth.dart';
import 'package:nekoya_flutter/utils/utils.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future submitForm(BuildContext context) async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      return 999;
    } else {
      Map<String, dynamic> data = {
        "email": emailController.text,
        "password": passwordController.text,
        "ua": "Nekoya App v1.0.0-beta"
      };

      var response = await loginPost(data);
      return {'statusCode': response['statusCode'], 'data': response['data']};
    }
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Email',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child: TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(10.0)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white60,
                    ),
                    borderRadius: BorderRadius.circular(10.0)),
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                hintText: 'Enter your Email',
                hintStyle: kHintTextStyle,
              ),
            ))
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Password',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child: TextField(
              controller: passwordController,
              obscureText: true,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(10.0)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white60,
                    ),
                    borderRadius: BorderRadius.circular(10.0)),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                hintText: 'Enter your Password',
                hintStyle: kHintTextStyle,
              ),
            ))
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
        alignment: Alignment.centerRight,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/forgotpassword');
          },
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xff212226)),
              padding:
                  MaterialStateProperty.all(const EdgeInsets.only(right: 0.0)),
              elevation: MaterialStateProperty.all(0.0)),
          child: const Text(
            'Forgot Password?',
            style: kLabelStyle,
          ),
        ));
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(5.0),
          padding: MaterialStateProperty.all(const EdgeInsets.all(15.0)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          )),
          backgroundColor: MaterialStateProperty.all(const Color(0xff8B0000)),
        ),
        onPressed: () {
          if (emailController.text.isEmpty || passwordController.text.isEmpty) {
            showAlertDialog(context);
          } else {
            submitForm(context).then((res) {
              if (res['statusCode'] == 200) {
                addSession(res['data']['id'], res['data']['session_token']);
                Navigator.pop(context);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Menu(initialScreen: 2)));
              } else if (res['statusCode'] == 204) {
                showEmailNotRegister(context);
              } else if (res['statusCode'] == 205) {
                showEmailWarn(context);
              } else if (res['statusCode'] == 400) {
                showBad(context);
              } else if (res['statusCode'] == 401) {
                showUnautorized(context);
              }
            });
          }
        },
        child: const Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, '/register');
      },
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: const Text("OK", style: TextStyle(color: Colors.red)),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    AlertDialog alert = AlertDialog(
      backgroundColor: const Color(0xff1b1c1e),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Text(
        "Error",
        style: TextStyle(color: Colors.white),
      ),
      content: const Text(
        "Enter Your Email Or Password !",
        style: TextStyle(color: Colors.white70),
      ),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showEmailNotRegister(BuildContext context) {
    Widget okButton = TextButton(
      child: const Text("OK", style: TextStyle(color: Colors.red)),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    AlertDialog alert = AlertDialog(
      backgroundColor: const Color(0xff1b1c1e),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Text(
        "Error",
        style: TextStyle(color: Colors.white),
      ),
      content: const Text(
        "Sorry your email not registered yet !",
        style: TextStyle(color: Colors.white70),
      ),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showEmailWarn(BuildContext context) {
    Widget okButton = TextButton(
      child: const Text("OK", style: TextStyle(color: Colors.red)),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    AlertDialog alert = AlertDialog(
      backgroundColor: const Color(0xff1b1c1e),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Text(
        "Error",
        style: TextStyle(color: Colors.white),
      ),
      content: const Text(
        "Sorry Then Email Or Password You Entered Is Wrong !",
        style: TextStyle(color: Colors.white70),
      ),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showBad(BuildContext context) {
    Widget okButton = TextButton(
      child: const Text("OK", style: TextStyle(color: Colors.red)),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    AlertDialog alert = AlertDialog(
      backgroundColor: const Color(0xff1b1c1e),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Text(
        "Error",
        style: TextStyle(color: Colors.white),
      ),
      content: const Text(
        "Bad Connection",
        style: TextStyle(color: Colors.white70),
      ),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showUnautorized(BuildContext context) {
    Widget okButton = TextButton(
      child: const Text("OK", style: TextStyle(color: Colors.red)),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    AlertDialog alert = AlertDialog(
      backgroundColor: const Color(0xff1b1c1e),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Text(
        "Error",
        style: TextStyle(color: Colors.white),
      ),
      content: const Text(
        "Blalaala",
        style: TextStyle(color: Colors.white70),
      ),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
        child: Card(
            color: const Color(0xff212226),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: SingleChildScrollView(
              child: Container(
                transform: Matrix4.translationValues(0, -35, 0),
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      "assets/lottie/login_form.json",
                      frameRate: FrameRate.max,
                      alignment: Alignment.center,
                      fit: BoxFit.fitHeight,
                      height: 250,
                    ),
                    const SizedBox(height: 10.0),
                    _buildEmailTF(),
                    const SizedBox(
                      height: 30.0,
                    ),
                    _buildPasswordTF(),
                    _buildForgotPasswordBtn(),
                    _buildLoginBtn(),
                    _buildSignupBtn(),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
