import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'Doctor.dart';

class DoctorList{
  static List<Doctor> listDoctors = [];

  Doctor generateDoctor(){
    return listDoctors.elementAt(Random().nextInt(listDoctors.length));
  }

  void updateDate(Doctor doctor, int bookedDate){
    FirebaseFirestore.instance
        .collection('doctors')
        .doc(doctor.id)
        .update({'bookedDate': bookedDate})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

}