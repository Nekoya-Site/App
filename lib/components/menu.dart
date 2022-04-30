import 'package:flutter/material.dart';
import 'package:nekoya_flutter/screens/login.dart';
import 'dart:math' as math;

import 'package:nekoya_flutter/screens/products.dart';
import 'package:nekoya_flutter/screens/payment.dart';
import 'package:nekoya_flutter/screens/cart.dart';
import 'package:nekoya_flutter/screens/transactions.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key, required this.initialScreen}) : super(key: key);

  final int initialScreen;

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _selectedIndex = 2;
  late Widget _selectedWidget;

  @override
  void initState() {
    if (widget.initialScreen == 0) {
      _selectedWidget = const Login();
    } else if (widget.initialScreen == 1) {
      _selectedWidget = const Payment();
    } else if (widget.initialScreen == 2) {
      _selectedWidget = const Products();
    } else if (widget.initialScreen == 3) {
      _selectedWidget = const Cart();
    } else if (widget.initialScreen == 4) {
      _selectedWidget = const Transactions();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _selectedWidget,
      bottomNavigationBar: Navigation(
        itemIcons: const [
          Icons.settings_rounded,
          Icons.list_alt_rounded,
          Icons.shopping_cart,
          Icons.account_circle,
        ],
        centerIcon: Icons.home,
        selectedIndex: _selectedIndex,
        onItemPressed: onPressed,
      ),
    );
  }

  void onPressed(index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        _selectedWidget = const Login();
      } else if (index == 1) {
        _selectedWidget = const Payment();
      } else if (index == 2) {
        _selectedWidget = const Products();
      } else if (index == 3) {
        _selectedWidget = const Cart();
      } else if (index == 4) {
        _selectedWidget = const Transactions();
      }
    });
  }
}

class Navigation extends StatelessWidget {
  final List<IconData> itemIcons;
  final IconData centerIcon;
  final int selectedIndex;
  final Function(int) onItemPressed;
  final double? height;
  final Color selectedColor;
  final Color selectedLightColor;
  final Color unselectedColor;
  const Navigation({
    Key? key,
    required this.itemIcons,
    required this.centerIcon,
    required this.selectedIndex,
    required this.onItemPressed,
    this.height,
    this.selectedColor = const Color(0xff8B0000),
    this.unselectedColor = Colors.white,
    this.selectedLightColor = const Color(0xff8B0000),
  })  : assert(itemIcons.length == 4 || itemIcons.length == 2,
            "Item must equal 4 or 2"),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.initSize(context);
    final height = this.height ?? getRelativeHeight(0.076);

    return SizedBox(
      height: height + getRelativeHeight(0.025),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height,
              color: const Color(0xff1b1c1e),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: getRelativeWidth(0.1)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: itemIcons.length == 4
                            ? MainAxisAlignment.spaceBetween
                            : MainAxisAlignment.center,
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              customBorder: const CircleBorder(),
                              splashColor: selectedColor.withOpacity(0.5),
                              onTap: () {
                                onItemPressed(0);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Icon(
                                  itemIcons[0],
                                  color: selectedIndex == 0
                                      ? selectedColor
                                      : unselectedColor,
                                  size: getRelativeWidth(0.07),
                                ),
                              ),
                            ),
                          ),
                          if (itemIcons.length == 4)
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                customBorder: const CircleBorder(),
                                splashColor: selectedColor.withOpacity(0.5),
                                onTap: () {
                                  onItemPressed(1);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Icon(
                                    itemIcons[1],
                                    color: selectedIndex == 1
                                        ? selectedColor
                                        : unselectedColor,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 3),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: itemIcons.length == 4
                            ? MainAxisAlignment.spaceBetween
                            : MainAxisAlignment.center,
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              customBorder: const CircleBorder(),
                              splashColor: selectedColor.withOpacity(0.5),
                              onTap: () {
                                onItemPressed(itemIcons.length == 4 ? 3 : 2);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Icon(
                                  itemIcons[itemIcons.length == 4 ? 2 : 1],
                                  color: selectedIndex ==
                                          (itemIcons.length == 4 ? 3 : 2)
                                      ? selectedColor
                                      : unselectedColor,
                                ),
                              ),
                            ),
                          ),
                          if (itemIcons.length == 4)
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                customBorder: const CircleBorder(),
                                splashColor: selectedColor.withOpacity(0.5),
                                onTap: () {
                                  onItemPressed(4);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Icon(
                                    itemIcons[3],
                                    color: selectedIndex == 4
                                        ? selectedColor
                                        : unselectedColor,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Transform.rotate(
                angle: -math.pi / 4,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () {
                      onItemPressed(itemIcons.length == 4 ? 2 : 1);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 25,
                            offset: const Offset(0, 5),
                            color: selectedColor.withOpacity(0.75),
                          )
                        ],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(18)),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            selectedLightColor,
                            selectedColor,
                          ],
                        ),
                      ),
                      height: getRelativeWidth(0.135),
                      width: getRelativeWidth(0.135),
                      child: Center(
                          child: Transform.rotate(
                        angle: math.pi / 4,
                        child: Icon(
                          centerIcon,
                          color: Colors.white,
                          size: getRelativeWidth(0.07),
                        ),
                      )),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SizeConfig {
  static double screenWidth = 0;
  static double screenHeight = 0;

  static initSize(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;
  }
}

double getRelativeHeight(double percentage) {
  return percentage * SizeConfig.screenHeight;
}

double getRelativeWidth(double percentage) {
  return percentage * SizeConfig.screenWidth;
}
