import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cvconnect/components/TitleText1.dart';
import 'package:cvconnect/components/widgets.dart';
import 'package:cvconnect/screens/DoctorDetailsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:avatars/avatars.dart';

class PharmacyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference pharmacy =
        FirebaseFirestore.instance.collection('pharmacy');
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
            child: LivePharmacy(),
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
            child: PopularPharmacy(),
          )
        ],
      ),
    );
  }
}

class LivePharmacy extends StatefulWidget {
  @override
  _LivePharmacyState createState() => _LivePharmacyState();
}

class _LivePharmacyState extends State<LivePharmacy> {
  final Stream<QuerySnapshot> _livePharmacyStream = FirebaseFirestore.instance
      .collection('pharmacy')
      .where('status', isEqualTo: 'available')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _livePharmacyStream,
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
                        builder: (context) => DoctorDetailsScreen(data: data,)));
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

class PopularPharmacy extends StatefulWidget {
  @override
  _PopularPharmacyState createState() => _PopularPharmacyState();
}

class _PopularPharmacyState extends State<PopularPharmacy> {
  final Stream<QuerySnapshot> _popularPharmacyStream = FirebaseFirestore
      .instance
      .collection('pharmacy')
      .orderBy('popularity', descending: true)
      .limit(4)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _popularPharmacyStream,
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
                        builder: (context) => DoctorDetailsScreen(data: data,)));
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
