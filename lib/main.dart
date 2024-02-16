import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:wheelz/appInfo/app_info.dart';
import 'package:wheelz/authentication/driver_login.dart';
import 'package:wheelz/authentication/driver_signup.dart';
import 'package:wheelz/authentication/login_screen.dart';
import 'package:wheelz/authentication/signup_screen.dart';
import 'package:wheelz/pages/dashboard.dart';
import 'package:wheelz/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Permission.locationWhenInUse.isDenied.then((valueOfPermission) {
    if (valueOfPermission) {
      Permission.locationWhenInUse.request();
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppInfo(),
      child: MaterialApp(
        title: 'Wheelz User App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
        ),
        home: FirebaseAuth.instance.currentUser == null
            ? const LoginScreen()
            : const HomePage(),
      ),
    );
  }
}
//  ? DriverLogin()
//               : Dashboard()
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:wheelz/appInfo/app_info.dart';
// import 'package:wheelz/authentication/login_screen.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     User? currentUser = FirebaseAuth.instance.currentUser;

//     return ChangeNotifierProvider(
//       create: (context) => AppInfo(),
//       child: MaterialApp(
//         title: 'Flutter User App',
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData.dark().copyWith(
//           scaffoldBackgroundColor: Colors.black,
//         ),
//         // home: currentUser == null
//         //     ? LoginScreen()
//         //     : determineHomeScreen(currentUser),
//       ),
//     );
//   }

  // Widget determineHomeScreen(User user) {
  //   // You can replace this logic with your own criteria for identifying a driver
  //   bool isDriver = /* Replace with your driver identification logic */;

  //   if (isDriver) {
  //     return DriverHomeScreen();
  //   } else {
  //     return UserHomeScreen();
  //   }
  // }
// }
