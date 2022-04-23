import 'package:cloud_firestore/cloud_firestore.dart';

class Prescription {
  final DocumentReference doctor;
  final List<DocumentReference> drugs;
  static final columns = [
    "doctor",
    "drugs"
  ];

  Prescription(this.doctor, this.drugs);

  factory Prescription.fromMap(Map<dynamic, dynamic> data) {
    return Prescription(
      data['doctor'],
      data['drugs'],
    );
  }

  Map<String, dynamic> toMap() => {
    "doctor": doctor,
    "drugs": drugs,
  };

}