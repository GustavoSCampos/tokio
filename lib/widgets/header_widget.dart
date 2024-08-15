import 'package:flutter/material.dart';
import 'package:tokio_test/const/constant.dart';

class HeaderWidget extends StatelessWidget {
  HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      color: primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                Icons.menu,
                color: Colors.grey,
                size: 25,
              ),
            ),
          ),
          Image.asset(
            "assets/images/logo_white.png",
            width: 125,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Icon(
                  Icons.notifications,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
