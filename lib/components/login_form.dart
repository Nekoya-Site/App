import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:nekoya_flutter/api/api.dart';
import 'package:nekoya_flutter/components/login_error.dart';
import 'package:nekoya_flutter/components/login_verify.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => LoginFormState();
}

final _formKey = GlobalKey<FormBuilderState>();

class LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 15, 10, 5),
        child: Card(
          color: const Color(0xff212226),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: SingleChildScrollView(
            child: Container(
              transform: Matrix4.translationValues(0, -35, 0),
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Lottie.network(
                            "https://assets5.lottiefiles.com/packages/lf20_mjlh3hcy.json",
                            frameRate: FrameRate.max,
                            alignment: Alignment.center,
                            fit: BoxFit.fitHeight,
                            height: 250,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: FormBuilder(
                          key: _formKey,
                          child: Column(
                            children: [
                              makeInput(label: "Email"),
                              makeInput(label: "Password", obscureText: true)
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: Container(
                          padding: const EdgeInsets.only(top: 3, left: 3),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 35,
                            onPressed: () async {
                              if (_formKey.currentState!.fields["Email"]!
                                          .value ==
                                      '' ||
                                  _formKey.currentState!.fields["Password"]!
                                          .value ==
                                      '') {
                                showAlertDialog(context);
                              } else {
                                var statusCode = await loginPost(
                                    email: _formKey
                                        .currentState!.fields["Email"]!.value,
                                    password: _formKey.currentState!
                                        .fields["Password"]!.value);

                                if (statusCode == 200) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginVerify()));
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginError()));
                                }
                              }
                            },
                            color: const Color(0xff8B0000),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Don't have an account ?? \nClick here to Sign Up !!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget makeInput({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
            fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      const SizedBox(
        height: 5,
      ),
      FormBuilderTextField(
        initialValue: "",
        name: label,
        obscureText: obscureText,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        ),
      ),
      const SizedBox(
        height: 10,
      )
    ],
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
      "Make sure to fill all text fields",
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
