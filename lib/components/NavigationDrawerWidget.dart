/* import 'dart:ui';
import 'package:flutter/material.dart';
/* import 'package:money_manager/components/TitleText1.dart';
import 'package:money_manager/screens/ContactScreen.dart';
import 'package:money_manager/screens/Currency.dart';
import 'package:money_manager/screens/People.dart';
import 'package:money_manager/screens/User.dart';
import 'package:money_manager/screens/CategoryScreen.dart';
import 'package:money_manager/screens/ColumnChart.dart';
import 'package:money_manager/screens/HomeScreen.dart';
import 'package:money_manager/screens/Reminder.dart';
import 'package:share/share.dart';

import '../screens/Account.dart';
import 'PopUpRatingApp.dart'; */

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 16);

  void _showRatingDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true, // set to false if you want to force a rating
        builder: (context) {
          return PopUpRatingApp();
        });
  }

  @override
  Widget build(BuildContext context) {
    final name = 'Kiều Văn Tuyên';
    final balance = 'Số dư: 1000.000 đ';
    final urlImage = 'assets/images/header_icon.png';
    return Drawer(
      child: Material(
        color: const Color.fromRGBO(35, 111, 87, 1),
        child: ListView(
          children: <Widget>[
            buildHeader(
                urlImage: urlImage,
                name: name,
                balance: balance,
                onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        UserPage(name: name, urlImage: urlImage)))),
            const Divider(
              color: Colors.white70,
            ),
            buildMenuItem(
              text: 'Ngân sách',
              icon: Icons.account_balance_wallet,
              onClicked: () => selectedItem(context, 0),
            ),
            buildMenuItem(
              text: 'Tài khoản',
              icon: Icons.account_balance,
              onClicked: () => selectedItem(context, 1),
            ),
            buildMenuItem(
              text: 'Biểu đồ',
              icon: Icons.bar_chart,
              onClicked: () => selectedItem(context, 2),
            ),
            buildMenuItem(
              text: 'Danh mục',
              icon: Icons.view_list,
              onClicked: () => selectedItem(context, 3),
            ),
            buildMenuItem(
              text: 'Thanh toán thông thường',
              icon: Icons.paid,
              onClicked: () => selectedItem(context, 4),
            ),
            buildMenuItem(
              text: 'Nhắc nhở',
              icon: Icons.notifications,
              onClicked: () => selectedItem(context, 5),
            ),
            buildMenuItem(
              text: 'Tiền tệ',
              icon: Icons.euro,
              onClicked: () => selectedItem(context, 6),
            ),
            buildMenuItem(
              text: 'Cài đặt',
              icon: Icons.settings,
              onClicked: () => selectedItem(context, 7),
            ),
            buildMenuItem(
              text: 'Tắt quảng cáo',
              icon: Icons.app_blocking,
              onClicked: () => selectedItem(context, 8),
            ),
            buildMenuItem(
              text: 'Chia sẻ với bạn bè',
              icon: Icons.share,
              onClicked: () => selectedItem(context, 9),
            ),
            buildMenuItem(
              text: 'Đánh giá ứng dụng',
              icon: Icons.star,
              onClicked: () => selectedItem(context, 10),
            ),
            buildMenuItem(
              text: 'Liên hệ với nhóm hỗ trợ',
              icon: Icons.contact_mail,
              onClicked: () => selectedItem(context, 11),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(
          {required String urlImage,
          required String name,
          required String balance,
          required VoidCallback onClicked}) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(const EdgeInsets.symmetric(vertical: 16)),
          child: Row(children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(urlImage),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText1(
                    text: name,
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    r: 255,
                    g: 255,
                    b: 255),
                const SizedBox(
                  height: 4,
                ),
                TitleText1(
                    text: balance,
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    r: 255,
                    g: 255,
                    b: 255),
              ],
            ),
          ]),
        ),
      );

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(text,
          style: TextStyle(
              color: color,
              fontFamily: 'Inter',
              fontWeight: FontWeight.normal,
              fontSize: 16)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomeScreen(title: 'Ngân sách'),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Account(title: 'Tài khoản'),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ColumnChart(title: 'Biểu đồ'),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CategoryScreen(title: 'Danh mục'),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PeoplePage(),
        ));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Reminder(title: 'Nhắc nhở'),
        ));
        break;
      case 6:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Currency(title: 'Tiền tệ'),
        ));
        break;
      case 7:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PeoplePage(),
        ));
        break;
      case 8:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PeoplePage(),
        ));
        break;
      case 9:
        Share.share(
            'https://play.google.com/store/apps/details?id=ru.innim.my_finance');
        break;
      case 10:
        _showRatingDialog(context);
        break;
      case 11:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ContactScreen(title: 'Liên hệ'),
        ));
        break;
    }
  }
} */