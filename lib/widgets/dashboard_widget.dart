import 'package:tokio_test/api/firebase.dart';
import 'package:tokio_test/const/constant.dart';
import 'package:tokio_test/data/card_data.dart';
import 'package:tokio_test/util/notifications.dart';
import 'package:tokio_test/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class DashboardWidget extends StatefulWidget {
  DashboardWidget({Key? key}) : super(key: key);

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  final cardData = CardData();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HeaderWidget(),
            Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [primaryGreen, primaryYellow],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                      radius: 30,
                      backgroundColor: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bem-vindo',
                          style: GoogleFonts.montserrat(
                              textStyle:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                        Text(getUserDisplayName() ?? "",
                            style: GoogleFonts.montserrat(
                              textStyle:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width * .98,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cotar e Contratar',
                    style: GoogleFonts.montserrat(
                      textStyle: GoogleFonts.montserrat(
                        textStyle: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 72,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cardData.CardDataData.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            DataBox(
                                icon: cardData.CardDataData[index].icon,
                                title: cardData.CardDataData[index].title),
                            const SizedBox(width: 5),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                if (!kIsWeb) {
                  Navigator.pushNamed(context, '/web_view');
                } else {
                  errorNotification('Somente disponível no app!', context);
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * .98,
                        child: Text(
                          'Minha Familia',
                          style: GoogleFonts.montserrat(
                            textStyle:
                                TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Center(
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width * .98,
                        child: Container(
                          decoration: BoxDecoration(
                            color: cardBackgroundColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.add, color: Colors.white),
                              const SizedBox(height: 5),
                              Text(
                                'Compartilhe aqui os membros de sua familia e compartilhe os seguros com eles.',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                if (!kIsWeb) {
                  Navigator.pushNamed(context, '/web_view');
                } else {
                  errorNotification('Somente disponível no app!', context);
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * .98,
                        child: Text(
                          'Contratados',
                          style: GoogleFonts.montserrat(
                            textStyle:
                                TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Center(
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width * .98,
                        child: Container(
                          decoration: BoxDecoration(
                            color: cardBackgroundColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.add, color: Colors.white),
                              const SizedBox(height: 5),
                              Text(
                                'Voce ainda nao possui seguros contratados.',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class DataBox extends StatelessWidget {
  final String icon;
  final String title;

  const DataBox({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 70,
        width: 80,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Color(0xff2B2F37), borderRadius: BorderRadius.circular(3)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: 40,
            ),
            const SizedBox(height: 6),
            Text(title,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
