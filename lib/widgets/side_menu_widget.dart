import 'package:tokio_test/const/constant.dart';
import 'package:tokio_test/data/side_menu_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SideMenuWidget extends StatefulWidget {
  const SideMenuWidget({super.key});

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final data = SideMenuData();

    return Container(
      color: primaryColor,
      child: Column(
        children: [
          ...data.menu.asMap().entries.map((entry) {
            int index = entry.key;
            var menu = entry.value;
            return Container(child: buildMenuEntry(menu, index));
          }).toList(),
        ],
      ),
    );
  }

  Widget buildMenuEntry(data, int index) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(6.0),
            ),
            color: Colors.transparent,
          ),
          child: InkWell(
            onTap: () => setState(() {
              selectedIndex = index;
            }),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    data.icon,
                    color: primaryGreen,
                    size: 20,
                  ),
                ),
                SizedBox(width: 5),
                Text(data.title,
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ))
              ],
            ),
          ),
        ),
        Divider(
          color: Colors.grey.withOpacity(.1),
          endIndent: 70,
        )
      ],
    );
  }
}
