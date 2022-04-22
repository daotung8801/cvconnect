import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cvconnect/components/TitleText1.dart';
import 'package:cvconnect/components/widgets.dart';
import 'package:cvconnect/screens/DoctorDetailsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:avatars/avatars.dart';

class DoctorsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference doctors =
        FirebaseFirestore.instance.collection('doctors');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Bác sĩ'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 40, top: 20),
            child: Text(
              'Bác sĩ trực tuyến',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(
            height: 100,
            child: LiveDoctors(),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, top: 20),
            child: Text(
              'Bác sĩ phổ biến',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(
            width: 500,
            height: 500,
            child: PopularDoctors(),
          )
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
              child: Avatar(
                shape: CustomAvatarStyle.borderRadius20(),
                sources: [NetworkSource(data['imageUrl'])],
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
          scrollDirection: Axis.vertical,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return GestureDetector(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Avatar(
                      shape: CustomAvatarStyle.borderRadius20(size: 110),
                      sources: [NetworkSource(data['imageUrl'])],
                    ),
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                              'Dr. ' +
                                  data['firstname'] +
                                  ' ' +
                                  data['lastname'],
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(data['specialist'] +
                              ' tại ' +
                              data['organization']),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Text(
                                data['rating'].toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('(' +
                                  data['nrating'].toString() +
                                  ' đánh giá)'),
                            ],
                          ),
                        ],
                      ),
                    ))
                  ]),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DoctorDetailsScreen()));
              },
            );

            return Avatar(
              shape: CustomAvatarStyle.borderRadius20(),
              sources: [NetworkSource(data['imageUrl'])],
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
