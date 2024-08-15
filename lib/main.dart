import 'package:firebase_core/firebase_core.dart';
import 'package:tokio_test/const/constant.dart';
import 'package:tokio_test/screens/login/login_screen.dart';
import 'package:tokio_test/screens/main_screen.dart';
import 'package:tokio_test/screens/web_view/web_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyDVa0QLF4Ud4QJPTL81jkxXuiSlntFx7SM',
        appId: '1:354183233916:web:c28062383dd812437f24f9',
        messagingSenderId: '354183233916',
        projectId: 'tokio-3a44f',
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tokio Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const LoginSreen(),
      onGenerateRoute: _onGenerateRoute,
    );
  }

  Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/dashboard':
        return MaterialPageRoute(builder: (context) => MainScreen());
      case '/login':
        return MaterialPageRoute(builder: (context) => LoginSreen());
      case '/web_view':
        return MaterialPageRoute(builder: (context) => WebViewPage());
      default:
        return MaterialPageRoute(builder: (context) => LoginSreen());
    }
  }
}
