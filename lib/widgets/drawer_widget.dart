import 'package:tokio_test/api/firebase.dart';
import 'package:tokio_test/const/constant.dart';
import 'package:tokio_test/widgets/side_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
          color: primaryColor,
        );

    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.zero),
      ),
      backgroundColor: Colors.white,
      child: Stack(
        children: [
          _buildDrawerBack(),
          ListView(
            children: [
              Container(
                color: primaryColor,
                padding: EdgeInsets.only(left: 24, top: 8),
                height: 130,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Olá!',
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/avatar.png'),
                                      radius: 25,
                                      backgroundColor: Colors.white,
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          getUserDisplayName() ?? "",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Minha Conta',
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                  color: Colors.greenAccent,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
              SideMenuWidget(),
              GestureDetector(
                onTap: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.remove("user_id");
                  Navigator.pushNamed(context, '/login');
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 5),
                    child: Text(
                      'Sair',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(color: primaryGreen, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [primaryGreen, primaryYellow],
                  ),
                ),
                height: 130,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/avatar.png'),
                        radius: 20,
                        backgroundColor: Colors.white,
                      ),
                      Text(
                        'Dúvidas',
                        style: GoogleFonts.montserrat(
                          textStyle: GoogleFonts.montserrat(
                              textStyle:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                        ),
                      ),
                      Text(
                        'Converse agora com a Matris',
                        style: GoogleFonts.montserrat(
                          textStyle: GoogleFonts.montserrat(
                              textStyle:
                                  TextStyle(color: Colors.white, fontSize: 10)),
                        ),
                      ),
                      Text(
                        'e tire suas dúvidas agora mesmo!',
                        style: GoogleFonts.montserrat(
                          textStyle: GoogleFonts.montserrat(
                              textStyle:
                                  TextStyle(color: Colors.white, fontSize: 10)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
