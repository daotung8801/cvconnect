import 'package:cvconnect/components/AvatarWidget.dart';
import 'package:cvconnect/components/TitleText1.dart';
import 'package:cvconnect/screens/authentication.dart';
import 'package:flutter/material.dart';
import '../components/ButtonWidget.dart';
import 'AccountSettingsScreen.dart';
import 'PrivacyPolicyScreen.dart';
import 'UserScreen.dart';

class MenuScreen extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  final void Function() signOut;

  MenuScreen({Key? key, required this.signOut}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = 'Nguyen Thai';
    final job = 'Sinh viên';
    final urlImage = 'assets/images/header_icon.png';
    return Material(
      color: Colors.blueAccent,
      child: ListView(
        children: <Widget>[
          buildHeader(
              urlImage: urlImage,
              name: name,
              job: job,
              onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      UserScreen(name: name, urlImage: urlImage)))),
          buildMenuItem(
            icon: Icons.settings,
            text: 'Cài đặt tài khoản',
            onClicked: () => selectedItem(context, 0),
          ),
          buildMenuItem(
            icon: Icons.privacy_tip,
            text: 'Chính sách bảo mật',
            onClicked: () => selectedItem(context, 1),
          ),
          buildMenuItem(
            icon: Icons.payment,
            text: 'Thiết lập thanh toán',
            onClicked: () => selectedItem(context, 2),
          ),
          buildMenuItem(
            icon: Icons.contacts,
            text: 'Liên hệ',
            onClicked: () => selectedItem(context, 3),
          ),
          ButtonWidget(
            icon: Icons.logout,
            text: 'Đăng xuất',
            onClicked: signOut,
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.black;
    final hoverColor = Colors.white70;
    return Padding(
        padding: padding.add(EdgeInsets.only(top: 20)),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          width: 355,
          height: 68,
          alignment: Alignment.center,
          child: ListTile(
            leading: Icon(
              icon,
              color: color,
            ),
            title: Text(text,
                style: TextStyle(
                    color: color,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            hoverColor: hoverColor,
            onTap: onClicked,
          ),
        ));
  }

  void selectedItem(BuildContext context, int i) {
    Navigator.of(context).pop();
    switch (i) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              AccountSettingsScreen(title: 'Cài đặt tài khoản'),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              PrivacyPolicyScreen(title: 'Chính sách bảo mật'),
        ));
        break;
    }
  }

  Widget buildHeader(
          {required String urlImage,
          required String name,
          required String job,
          required VoidCallback onClicked}) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(const EdgeInsets.only(top: 133, bottom: 20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AvatarWidget(
                  height: 80, width: 80, urlImage: urlImage, radius: 25.67),
              const SizedBox(
                height: 16,
              ),
              TitleText1(
                  text: name,
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  r: 255,
                  g: 255,
                  b: 255),
              const SizedBox(
                height: 16,
              ),
              TitleText1(
                  text: job,
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  r: 255,
                  g: 255,
                  b: 255),
            ],
          ),
        ),
      );
}
