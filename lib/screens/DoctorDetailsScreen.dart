import 'package:avatars/avatars.dart';
import 'package:cvconnect/components/ButtonText.dart';
import 'package:cvconnect/components/DoctorInforContainer.dart';
import 'package:cvconnect/components/SmallHeaderWidget.dart';
import 'package:flutter/material.dart';

import '../components/TitleText1.dart';
import '../components/widgets.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> data;

  const DoctorDetailsScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: SmallHeaderWidget(
          text: 'Chi tiết',
          icon: Icon(Icons.arrow_back_sharp),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Avatar(
                          shape: CustomAvatarStyle.borderRadius20(size: 100),
                          sources: [NetworkSource(data['imageUrl'])],
                        ),
                      ),
                      // Expanded(
                      Container(
                        padding: EdgeInsets.only(bottom: 10, left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                  'Bs. ' +
                                      data['firstname'] +
                                      ' ' +
                                      data['lastname'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(data['specialist'] +
                                  ' tại ' +
                                  data['organization']),
                            ),
                          ],
                        ),
                      )
                    ])),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DoctorInforContainer(text1: 'Bệnh nhân', text2: '100+'),
                DoctorInforContainer(text1: 'Kinh nghiệm', text2: '10 năm'),
                DoctorInforContainer(text1: 'Xếp hạng', text2: '4.67'),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, top: 30),
              child: TitleText1(
                  text: 'Giới thiệu',
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  r: 0,
                  g: 0,
                  b: 0),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 25, top: 14),
                  child: TitleText1(
                    text: 'Tiến sĩ, Bác sĩ tốt nghiệp tại Đại học Y Hà Nội.',
                    fontFamily: 'Nunito Sans',
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    r: 0,
                    g: 0,
                    b: 0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25, top: 10),
                  child: TitleText1(
                    text: 'Kinh nghiệm- Giáo sư & Trưởng bộ môn',
                    fontFamily: 'Nunito Sans',
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    r: 0,
                    g: 0,
                    b: 0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25, top: 10),
                  child: TitleText1(
                    text: 'Khoa phổi',
                    fontFamily: 'Nunito Sans',
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    r: 0,
                    g: 0,
                    b: 0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25, top: 10),
                  child: TitleText1(
                    text: 'Bệnh viẹn Bạch Mai',
                    fontFamily: 'Nunito Sans',
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    r: 0,
                    g: 0,
                    b: 0,
                  ),
                ),
               Center(
                 child: Padding(
                   padding: EdgeInsets.only(top: 150),
                   child: ButtonText(text: 'Đặt ngay', r: 28, g: 107, b: 164, weight: 200, height: 55, screenName: 'a', radius: 30),
                 ),
               ),
              ],
            ),
          ],
        ),
      );
}
