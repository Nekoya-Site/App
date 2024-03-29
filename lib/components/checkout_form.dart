import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:nekoya_app/api/api.dart';
import 'package:nekoya_app/data/auth.dart';
import 'package:nekoya_app/data/cart.dart';

class CheckoutForm extends StatefulWidget {
  const CheckoutForm({Key? key}) : super(key: key);

  @override
  State<CheckoutForm> createState() => _CheckoutFormState();
}

final _formKey = GlobalKey<FormBuilderState>();

class _CheckoutFormState extends State<CheckoutForm> {
  Future<dynamic> loadCheckout(checkoutData) async {
    var session = await getSession();
    var data = await checkoutPost(session, checkoutData);
    return data;
  }

  Future submitForm(BuildContext context) async {
    if (_formKey.currentState!.fields["First Name"]!.value.isEmpty ||
        _formKey.currentState!.fields["Last Name"]!.value.isEmpty ||
        _formKey.currentState!.fields["Phone Number"]!.value.isEmpty ||
        _formKey.currentState!.fields["Street Address"]!.value.isEmpty ||
        _formKey.currentState!.fields["Street Address 2"]!.value.isEmpty ||
        _formKey.currentState!.fields["Region"]!.value.isEmpty ||
        _formKey.currentState!.fields["Province"]!.value.isEmpty ||
        _formKey.currentState!.fields["City"]!.value.isEmpty ||
        _formKey.currentState!.fields["District"]!.value.isEmpty ||
        _formKey.currentState!.fields["Subdistrict"]!.value.isEmpty ||
        _formKey.currentState!.fields["Postal Code"]!.value.isEmpty ||
        !(_formKey.currentState!.fields["Shipping Method"]!.value == 'JNE' ||
            _formKey.currentState!.fields["Shipping Method"]!.value == 'JNT' ||
            _formKey.currentState!.fields["Shipping Method"]!.value ==
                'SiCepat')) {
      return 999;
    } else {
      var currentCart = await viewCart();
      var cartData = jsonEncode(currentCart).toString();

      Map<String, dynamic> data = {
        "firstName": _formKey.currentState!.fields["First Name"]!.value,
        "lastName": _formKey.currentState!.fields["Last Name"]!.value,
        "phoneNumber": _formKey.currentState!.fields["Phone Number"]!.value,
        "streetAddress1":
            _formKey.currentState!.fields["Street Address"]!.value,
        "streetAddress2":
            _formKey.currentState!.fields["Street Address 2"]!.value,
        "region": _formKey.currentState!.fields["Region"]!.value,
        "province": _formKey.currentState!.fields["Province"]!.value,
        "city": _formKey.currentState!.fields["City"]!.value,
        "district": _formKey.currentState!.fields["District"]!.value,
        "subDistrict": _formKey.currentState!.fields["Subdistrict"]!.value,
        "postalCode": _formKey.currentState!.fields["Postal Code"]!.value,
        "logistic": _formKey.currentState!.fields["Shipping Method"]!.value,
        "data": cartData,
      };

      await clearCart();

      var statusCode = await loadCheckout(data);
      return statusCode;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Card(
        color: const Color(0xff212226),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          margin: const EdgeInsets.fromLTRB(5, 20, 5, 20),
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: FormBuilder(
                      key: _formKey,
                      child: Column(
                        children: [
                          const Center(
                            child: Text(
                              "Shipping Details",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Row(
                            children: [
                              Text(
                                "Contact Information",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          makeInput(
                              label: "First Name",
                              icon: Icons.person,
                              keyboardType: TextInputType.name),
                          makeInput(
                              label: "Last Name",
                              icon: Icons.person,
                              keyboardType: TextInputType.name),
                          makeInput(
                              label: "Phone Number",
                              icon: Icons.phone_rounded,
                              keyboardType: TextInputType.phone),
                          const SizedBox(
                            height: 20,
                          ),
                          const Row(
                            children: [
                              Text(
                                "Address",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          makeInput(
                              label: "Street Address",
                              icon: Icons.home,
                              keyboardType: TextInputType.streetAddress),
                          makeInput(
                              label: "Street Address 2",
                              icon: Icons.home,
                              keyboardType: TextInputType.streetAddress),
                          makeInput(
                              label: "Region",
                              icon: Icons.location_city,
                              keyboardType: TextInputType.streetAddress),
                          makeInput(
                              label: "Province",
                              icon: Icons.location_city,
                              keyboardType: TextInputType.streetAddress),
                          makeInput(
                              label: "City",
                              icon: Icons.location_city,
                              keyboardType: TextInputType.streetAddress),
                          makeInput(
                              label: "District",
                              icon: Icons.location_city,
                              keyboardType: TextInputType.streetAddress),
                          makeInput(
                              label: "Subdistrict",
                              icon: Icons.location_city,
                              keyboardType: TextInputType.streetAddress),
                          makeInput(
                              label: "Postal Code",
                              icon: Icons.location_city,
                              keyboardType: TextInputType.number),
                          const SizedBox(
                            height: 20,
                          ),
                          const Row(
                            children: [
                              Text(
                                "Shipping Methods",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
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
                            child: FormBuilderDropdown(
                              name: "Shipping Method",
                              dropdownColor: const Color(0xff212226),
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                              ),
                              items: const [
                                DropdownMenuItem(
                                  value: "JNE",
                                  child: Text("JNE"),
                                ),
                                DropdownMenuItem(
                                  value: "JNT",
                                  child: Text("JNT"),
                                ),
                                DropdownMenuItem(
                                  value: "SiCepat",
                                  child: Text("SiCepat"),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
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
                          checkSessionExist().then((isLoggedIn) {
                            if (isLoggedIn) {
                              submitForm(context).then((statusCode) {
                                if (statusCode == 201) {
                                  Navigator.pushReplacementNamed(
                                      context, '/payment');
                                } else if (statusCode == 999) {
                                  showAlertDialog(context);
                                }
                              });
                            } else {
                              Navigator.pushNamed(context, '/login');
                            }
                          });
                        },
                        color: const Color(0xff8B0000),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        child: const Text(
                          "Pay",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
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
        height: 10,
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
      "Make sure to fill all fields",
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
