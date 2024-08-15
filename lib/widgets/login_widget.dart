import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:tokio_test/api/firebase.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tokio_test/const/constant.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool login = true;
  bool rememberMe = false;

  final _cpfController = TextEditingController();
  final _passwordController = TextEditingController();
  final _registerCpfController = TextEditingController();
  final _registerPasswordController = TextEditingController();
  final _cpasswordController = TextEditingController();
  final _nameController = TextEditingController();

  void initState() {
    super.initState();
    checkUserId();
  }

  checkUserId() async {
    var user_id = await getUserId();
    if (user_id != null) Navigator.pushNamed(context, '/dashboard');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [primaryGreen, primaryYellow],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Color(0xff1F2429),
                ),
              ),
            ],
          ),
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: 320,
                  height: !login ? 375 : 275,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  login = true;
                                });
                              },
                              child: Text(
                                "Entrar",
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    decoration: login
                                        ? TextDecoration.underline
                                        : TextDecoration.none,
                                    decorationColor: primaryGreen,
                                    decorationThickness: 2.0,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: login ? primaryGreen : Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  login = false;
                                });
                              },
                              child: Text(
                                "Cadastrar",
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    decoration: !login
                                        ? TextDecoration.underline
                                        : TextDecoration.none,
                                    decorationColor: primaryGreen,
                                    decorationThickness: 2.0,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: !login ? primaryGreen : Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        RoundedInputField(
                          label: "CPF",
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            MaskedInputFormatter('###.###.###-##'),
                          ],
                          controller:
                              login ? _cpfController : _registerCpfController,
                          obscureText: false,
                        ),
                        !login
                            ? SizedBox(
                                height: 8,
                              )
                            : Container(),
                        !login
                            ? RoundedInputField(
                                label: "Nome",
                                controller: _nameController,
                                obscureText: false,
                              )
                            : Container(),
                        SizedBox(
                          height: 8,
                        ),
                        RoundedInputField(
                          label: "Senha",
                          controller: login
                              ? _passwordController
                              : _registerPasswordController,
                          obscureText: true,
                        ),
                        !login
                            ? SizedBox(
                                height: 8,
                              )
                            : Container(),
                        !login
                            ? RoundedInputField(
                                label: "Confirmar Senha",
                                controller: _cpasswordController,
                                obscureText: true,
                              )
                            : Container(),
                        SizedBox(
                          height: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 10,
                                  width: 10,
                                  child: Checkbox(
                                    value: rememberMe,
                                    onChanged: (value) {
                                      setState(() {
                                        rememberMe = value!;
                                      });
                                    },
                                    shape: const CircleBorder(),
                                    activeColor: primaryGreen,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  'Lembrar Sempre',
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            login
                                ? TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Esqueceu a senha?',
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: primaryGreen,
                                        fontSize: 12,
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: cardBackgroundColor,
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -35,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        if (!login) {
                          registerWithCpfAndPassword(
                            _registerCpfController.text,
                            _registerPasswordController.text,
                            _nameController.text,
                            context,
                          );
                        } else {
                          signInWithCpfAndPassword(
                            _cpfController.text,
                            _passwordController.text,
                            context,
                          );
                        }
                      },
                      child: Container(
                        width: 65,
                        height: 65,
                        child: Center(
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            size: 36,
                          ),
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [primaryGreen, primaryYellow],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: cardBackgroundColor,
                            width: 5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/logo_white.png",
                    width: 175,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Bem vindo!",
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    "Aqui voce gerencia seus seguros e de seus familiares em poucos cliques!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/tokio-resolve-dark.png",
                    width: 125,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedInputField extends StatelessWidget {
  final label;
  final controller;
  final obscureText;
  final keyboardType;
  final inputFormatters;

  const RoundedInputField({
    super.key,
    this.label,
    this.controller,
    this.obscureText,
    this.keyboardType,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: label,
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(color: primaryGreen),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
