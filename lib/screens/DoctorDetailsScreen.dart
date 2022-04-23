import 'package:avatars/avatars.dart';
import 'package:flutter/material.dart';

import '../components/widgets.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> data;

  const DoctorDetailsScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Chi tiết'),
        ),
        body: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
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
                          'Bs. ' + data['firstname'] + ' ' + data['lastname'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child:
                          Text(data['specialist'] + ' tại ' + data['organization']),
                    ),
                  ],
                ),
              )
            ])
          ],
        ),
      );
}
