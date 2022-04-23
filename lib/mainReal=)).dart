import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cvconnect/screens/AddHealthRecord.dart';
import 'package:cvconnect/screens/ColumnChart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'helpers/ChangeLanguage.dart';
import 'screens/authentication.dart';
import 'components/widgets.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('vi', ''),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
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

    _placemark = await _determineAddress();
    notifyListeners();

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

  Placemark? _placemark;

  Placemark? get placemark => _placemark;

  Position? position;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future<Placemark> _determineAddress() async {
    position = await _determinePosition();
    notifyListeners();
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position!.latitude, position!.longitude);
    return placemarks[0];
  }

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

  double getDistance(Position l1, GeoPoint l2) {
    double lat1 = l1.latitude;
    double lon1 = l1.longitude;
    double lat2;
    double lon2;
    lat2 = l2.latitude;
    lon2 = l2.longitude;
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  void cancelLogin() {
    _loginState = ApplicationLoginState.loggedOut;
    notifyListeners();
  }

  void signOut() {

    FirebaseAuth.instance.signOut();
  }
}
