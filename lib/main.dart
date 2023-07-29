import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shded/core/app_theam.dart';
import 'package:shded/core/strings/app_strings.dart';
import 'package:shded/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:shded/features/auth/presentation/pages/enter_otp.dart';
import 'package:shded/features/onboarding/presentation/pages/onboarding.dart';
import 'package:shded/features/auth/presentation/pages/sign_up.dart';
import 'package:shded/features/splash/presentation/splash.dart';
import 'dependency_injection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );



  FirebaseAuth.instance
      .authStateChanges()
      .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });


  await di.init();
  runApp(  MyApp());
}

class MyApp extends StatelessWidget {
     MyApp({super.key});

   AuthBloc authBloc = AuthBloc() ;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppTitle,
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: kSplash,
      routes: {
        kSplash: (context) => Splash(sharedPreferences: di.sl(),),
        kOnBoarding: (context) => OnBoarding(sharedPreferences: di.sl()),
        kSignUp: (context) =>
            BlocProvider<AuthBloc>(
              create: (context) => authBloc,
              child: const SignUp(),
            ),
        kEnterOtp: (_) => BlocProvider<AuthBloc>.value(
          value: authBloc,
          child: const EnterOtp(),
        ) ,
      },
    );
  }
}

