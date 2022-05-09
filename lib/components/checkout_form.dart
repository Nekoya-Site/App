import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:nekoya_flutter/api/api.dart';
import 'package:nekoya_flutter/data/cart.dart';
import 'package:nekoya_flutter/screens/payment.dart';

class CheckoutForm extends StatefulWidget {
  const CheckoutForm({Key? key}) : super(key: key);

  @override
  State<CheckoutForm> createState() => _CheckoutFormState();
}

final _formKey = GlobalKey<FormBuilderState>();

class _CheckoutFormState extends State<CheckoutForm> {
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
                          Row(
                            children: const [
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
                          makeInput(label: "First Name", icon: Icons.person),
                          makeInput(label: "Last Name", icon: Icons.person),
                          makeInput(
                              label: "Phone Number", icon: Icons.phone_rounded),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: const [
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
                          makeInput(label: "Street Address", icon: Icons.home),
                          makeInput(
                              label: "Street Address 2", icon: Icons.home),
                          makeInput(label: "Region", icon: Icons.location_city),
                          makeInput(
                              label: "Province", icon: Icons.location_city),
                          makeInput(label: "City", icon: Icons.location_city),
                          makeInput(
                              label: "District", icon: Icons.location_city),
                          makeInput(
                              label: "Subdistrict", icon: Icons.location_city),
                          makeInput(
                              label: "Postal Code", icon: Icons.location_city),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: const [
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
                            height: 10,
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
                        minWidth: double.infinity,
                        height: 35,
                        onPressed: () async {
                          if (_formKey.currentState!.fields["First Name"]!
                                      .value ==
                                  '' ||
                              _formKey.currentState!.fields["Last Name"]!
                                      .value ==
                                  '' ||
                              _formKey.currentState!.fields["Phone Number"]!
                                      .value ==
                                  '' ||
                              _formKey.currentState!.fields["Street Address"]!
                                      .value ==
                                  '' ||
                              _formKey.currentState!.fields["Street Address 2"]!
                                      .value ==
                                  '' ||
                              _formKey
                                      .currentState!.fields["Region"]!.value ==
                                  '' ||
                              _formKey.currentState!.fields["Province"]!
                                      .value ==
                                  '' ||
                              _formKey
                                      .currentState!.fields["City"]!.value ==
                                  '' ||
                              _formKey.currentState!.fields["District"]!
                                      .value ==
                                  '' ||
                              _formKey.currentState!.fields["Subdistrict"]!
                                      .value ==
                                  '' ||
                              _formKey.currentState!.fields["Postal Code"]!
                                      .value ==
                                  '' ||
                              !(_formKey.currentState!
                                          .fields["Shipping Method"]!.value ==
                                      'JNE' ||
                                  _formKey.currentState!
                                          .fields["Shipping Method"]!.value ==
                                      'JNT' ||
                                  _formKey.currentState!
                                          .fields["Shipping Method"]!.value ==
                                      'SiCepat')) {
                            showAlertDialog(context);
                          } else {
                            var currentCart = await viewCart();
                            var cartData = jsonEncode(currentCart).toString();

                            Map<String, dynamic> data = {
                              "firstName": _formKey
                                  .currentState!.fields["First Name"]!.value,
                              "lastName": _formKey
                                  .currentState!.fields["Last Name"]!.value,
                              "phoneNumber": _formKey
                                  .currentState!.fields["Phone Number"]!.value,
                              "streetAddress1": _formKey.currentState!
                                  .fields["Street Address"]!.value,
                              "streetAddress2": _formKey.currentState!
                                  .fields["Street Address 2"]!.value,
                              "region": _formKey
                                  .currentState!.fields["Region"]!.value,
                              "province": _formKey
                                  .currentState!.fields["Province"]!.value,
                              "city":
                                  _formKey.currentState!.fields["City"]!.value,
                              "district": _formKey
                                  .currentState!.fields["District"]!.value,
                              "subDistrict": _formKey
                                  .currentState!.fields["Subdistrict"]!.value,
                              "postalCode": _formKey
                                  .currentState!.fields["Postal Code"]!.value,
                              "logistic": _formKey.currentState!
                                  .fields["Shipping Method"]!.value,
                              "data": cartData,
                            };

                            var statusCode = await checkoutPost(data);
                            if (statusCode == 201) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Payment()));
                            }
                          }
                        },
                        color: const Color(0xff8B0000),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        child: const Text(
                          "Pay",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
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

Widget makeInput({label, obscureText = false, icon}) {
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
