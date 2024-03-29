import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:nekoya_app/api/api.dart';
import 'package:nekoya_app/components/register_error.dart';
import 'package:nekoya_app/components/register_verify.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => RegisterFormState();
}

final _formKey = GlobalKey<FormBuilderState>();

class RegisterFormState extends State<RegisterForm> {
  Future submitForm(BuildContext context) async {
    if (_formKey.currentState!.fields["First Name"]!.value.isEmpty ||
        _formKey.currentState!.fields["Last Name"]!.value.isEmpty ||
        _formKey.currentState!.fields["Email Address"]!.value.isEmpty ||
        _formKey.currentState!.fields["Password"]!.value.isEmpty) {
      return 999;
    } else {
      Map<String, dynamic> data = {
        "first_name": _formKey.currentState!.fields["First Name"]!.value,
        "last_name": _formKey.currentState!.fields["Last Name"]!.value,
        "email": _formKey.currentState!.fields["Email Address"]!.value,
        "password": _formKey.currentState!.fields["Password"]!.value
      };

      var statusCode = await registerPost(data);
      return statusCode;
    }
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Lottie.asset(
                            "assets/lottie/register_form.json",
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
                              makeInput(
                                  label: "First Name",
                                  icon: Icons.person,
                                  keyboardType: TextInputType.name),
                              makeInput(
                                  label: "Last Name",
                                  icon: Icons.person,
                                  keyboardType: TextInputType.name),
                              makeInput(
                                  label: "Email Address",
                                  icon: Icons.email,
                                  keyboardType: TextInputType.emailAddress),
                              makeInput(
                                  label: "Password",
                                  obscureText: true,
                                  icon: Icons.lock,
                                  keyboardType: TextInputType.text)
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: Container(
                          padding: const EdgeInsets.only(top: 3, left: 3),
                          child: MaterialButton(
                            padding: const EdgeInsets.all(15.0),
                            minWidth: double.infinity,
                            height: 35,
                            onPressed: () {
                              submitForm(context).then((statusCode) {
                                if (statusCode == 200) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterVerify()));
                                } else if (statusCode == 999) {
                                  showAlertDialog(context);
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterError()));
                                }
                              });
                            },
                            color: const Color(0xff8B0000),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.transparent,
                            ),
                            child: const Text(
                              "Already have an account?? \nClick here to Sign In !!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, '/login');
                            },
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

Widget makeInput({label, obscureText = false, icon, keyboardType}) {
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
      Container(
        decoration: BoxDecoration(
          color: const Color(0xff1b1c1e),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: FormBuilderTextField(
          initialValue: "",
          name: label,
          keyboardType: keyboardType,
          obscureText: obscureText,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Colors.white,
            ),
            contentPadding: const EdgeInsets.only(top: 14.0),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(10.0)),
            enabledBorder: InputBorder.none,
            border: InputBorder.none,
          ),
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
