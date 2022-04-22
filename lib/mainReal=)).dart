import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cvconnect/screens/AddHealthRecord.dart';
import 'package:cvconnect/screens/ColumnChart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'helpers/ChangeLanguage.dart';
import 'screens/authentication.dart';
import 'components/widgets.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationState(),
      builder: (context, _) => App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CV_Connect',
      localizationsDelegates: [
        CustomLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('vi', ''),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddHealthRecord(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationState>(
      builder: (context, appState, _) => Authentication(
        phoneNumber: appState.phoneNumber,
        verificationID: appState.verificationID,
        loginState: appState.loginState,
        verifyPN: appState.verifyPhoneNumber,
        signInWithPhoneNumberAndOTP: appState.signInWithPhoneNumberAndOTP,
        cancelLogin: appState.cancelLogin,
        signOut: appState.signOut,
      ),
    );
  }
}

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _loginState = ApplicationLoginState.loggedIn;
      } else {
        _loginState = ApplicationLoginState.loggedOut;
      }
      notifyListeners();
    });
  }

  ApplicationLoginState _loginState = ApplicationLoginState.loggedOut;

  ApplicationLoginState get loginState => _loginState;

  String? _phoneNumber;

  String? get phoneNumber => _phoneNumber;

  String? _verificationID;

  String? get verificationID => _verificationID;

  void verifyPhoneNumber(
    String phoneNumber,
    void Function(FirebaseAuthException e) errorCallback,
  ) {
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) {
          _loginState = ApplicationLoginState.loggedIn;
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        errorCallback(e);
      },
      codeSent: (String verifID, int? resendToken) {
        _phoneNumber = phoneNumber;
        _verificationID = verifID;
        _loginState = ApplicationLoginState.otp;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    notifyListeners();
  }

  void signInWithPhoneNumberAndOTP(
    String verificationID,
    String otp,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationID, smsCode: otp);
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
        print("You are logged in successfully");
      });
    } on FirebaseAuthException catch (e) {
      print(e);
      errorCallback(e);
    }
  }

  void cancelLogin() {
    _loginState = ApplicationLoginState.loggedOut;
    notifyListeners();
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }
}
