import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cvconnect/components/SmallHeaderWidget.dart';
import 'package:cvconnect/components/TitleText1.dart';
import 'package:cvconnect/components/widgets.dart';
import 'package:cvconnect/screens/DoctorDetailsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:avatars/avatars.dart';

import '../components/SearchBar.dart';

class DoctorsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference doctors =
        FirebaseFirestore.instance.collection('doctors');
    return Scaffold(
      appBar:
          SmallHeaderWidget(text: 'Bác sĩ', icon: Icon(Icons.arrow_back_sharp)),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 25, right: 25, top: 20),
            child: SearchBar(text: 'Tìm kiếm bác sĩ'),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25, top: 20),
            child: Text(
              'Bác sĩ trực tuyến',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 25, top: 20),
            child: Container(
              height: 100,
              child: LiveDoctors(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25, top: 30),
            child: Text(
              'Bác sĩ phổ biến',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25, top: 30),
            child: Container(
              width: 500,
              height: 500,
              child: PopularDoctors(),
            ),
          ),
        ],
      ),
    );
  }
}

class LiveDoctors extends StatefulWidget {
  @override
  _LiveDoctorsState createState() => _LiveDoctorsState();
}

class _LiveDoctorsState extends State<LiveDoctors> {
  final Stream<QuerySnapshot> _liveDoctorsStream = FirebaseFirestore.instance
      .collection('doctors')
      .where('status', isEqualTo: 'available')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _liveDoctorsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          scrollDirection: Axis.horizontal,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return GestureDetector(
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Avatar(
                  shape: CustomAvatarStyle.borderRadius20(),
                  sources: [NetworkSource(data['imageUrl'])],
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DoctorDetailsScreen()));
              },
            );
            return ListTile(
              title: Text(data['full_name']),
              subtitle: Text(data['company']),
            );
          }).toList(),
        );
      },
    );
  }
}

class PopularDoctors extends StatefulWidget {
  @override
  _PopularDoctorsState createState() => _PopularDoctorsState();
}

class _PopularDoctorsState extends State<PopularDoctors> {
  final Stream<QuerySnapshot> _popularDoctorsStream = FirebaseFirestore.instance
      .collection('doctors')
      .orderBy('popularity', descending: true)
      .limit(4)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _popularDoctorsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return GestureDetector(
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
                                'Dr. ' +
                                    data['firstname'] +
                                    ' ' +
                                    data['lastname'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(data['specialist'] +
                                ' ' +
                                data['organization']),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 25,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 3),
                                child: Text(
                                  data['rating'].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 3),
                                child: Text('(' +
                                    data['nrating'].toString() +
                                    ' đánh giá)'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ]),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DoctorDetailsScreen()));
              },
            );
          }).toList(),
        );
      },
    );
  }
}
