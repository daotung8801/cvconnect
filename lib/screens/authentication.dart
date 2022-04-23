import 'package:cvconnect/components/TitleText1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:cvconnect/components/widgets.dart';

import '../main.dart';

enum ApplicationLoginState {
  loggedOut,
  otp,
  loggedIn,
}

class Authentication extends StatelessWidget {
  Authentication({
    required this.loginState,
    required this.phoneNumber,
    required this.verificationID,
    required this.verifyPN,
    required this.signInWithPhoneNumberAndOTP,
    required this.cancelLogin,
    required this.signOut,
  });

  final ApplicationLoginState loginState;
  final String? phoneNumber;
  String? verificationID;
  final void Function(
    String email,
    void Function(Exception e) error,
  ) verifyPN;
  final void Function(
    String verificationID,
    String otp,
    void Function(Exception e) error,
  ) signInWithPhoneNumberAndOTP;
  final void Function() cancelLogin;
  final void Function() signOut;

  @override
  Widget build(BuildContext context) {
    switch (loginState) {
      case ApplicationLoginState.loggedOut:
        return PhoneForm(
            callback: (pn) => verifyPN(pn,
                (e) => _showErrorDialog(context, 'Invalid phone number', e)));
      case ApplicationLoginState.otp:
        return OTPForm(
          verificationID: verificationID!,
          login: (verificationID, otp) {
            signInWithPhoneNumberAndOTP(verificationID, otp,
                (e) => _showErrorDialog(context, 'Failed to sign in', e));
          },
        );
      case ApplicationLoginState.loggedIn:
        return const MyHomePage(title: 'Flutter Demo Home Page');
      default:
        return Row(
          children: const [
            Text("Internal error, this shouldn't happen..."),
          ],
        );
    }
  }

  void _showErrorDialog(BuildContext context, String title, Exception e) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(fontSize: 24),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  '${(e as dynamic).message}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            StyledButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
          ],
        );
      },
    );
  }
}

class PhoneForm extends StatefulWidget {
  const PhoneForm({required this.callback});

  final void Function(String email) callback;

  @override
  _PhoneFormState createState() => _PhoneFormState();
}

class _PhoneFormState extends State<PhoneForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_PhoneFormState');
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: 50),
          child: TitleText1(
            text: 'Đăng nhập với số điện thoại',
            r: 0,
            g: 0,
            b: 0,
            fontSize: 20,
            fontFamily: 'arial',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 100,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: TextFormField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Nhập số điện thoại của bạn',
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter your phone number to continue';
                        }
                        return null;
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 30),
                        child: StyledButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              widget.callback(_controller.text);
                            }
                          },
                          child: const Text('Tiếp tục'),
                        ),
                      ),
                    ],
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

class OTPForm extends StatefulWidget {
  const OTPForm({
    required this.login,
    required this.verificationID,
  });

  final String verificationID;
  final void Function(String verificationID, String otp) login;

  @override
  _OTPFormState createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_OTPFormState');
  final _OTPController = TextEditingController();
  var _verificationID;

  @override
  void initState() {
    super.initState();
    _verificationID = widget.verificationID;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
            padding: EdgeInsets.only(top: 50),
            child: TitleText1(
              text: 'Nhập mã OTP',
              r: 0,
              g: 0,
              b: 0,
              fontSize: 20,
              fontFamily: 'arial',
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Colors.transparent,
        toolbarHeight: 100,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: TextFormField(
                      controller: _OTPController,
                      decoration: const InputDecoration(
                        hintText: 'OTP',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nhập mã OTP';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(width: 16),
                        StyledButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              widget.login(
                                _verificationID,
                                _OTPController.text,
                              );
                            }
                          },
                          child: const Text('Đăng nhập'),
                        ),
                        const SizedBox(width: 30),
                      ],
                    ),
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
