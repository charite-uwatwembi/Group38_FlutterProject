import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference doctorCollection = FirebaseFirestore.instance.collection('doctors');

  Stream<List<Map<String, dynamic>>> getDoctors() {
    return doctorCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();
    });
  }
}
