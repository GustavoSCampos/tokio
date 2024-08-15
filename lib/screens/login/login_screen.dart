import 'package:tokio_test/widgets/login_widget.dart';
import 'package:flutter/material.dart';

class LoginSreen extends StatelessWidget {
  const LoginSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: LoginWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
