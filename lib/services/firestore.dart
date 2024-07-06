import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // get collection of notes
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  // CREATE
  Future<void> addNote(String note) {
    return notes.add({
      'notes': note,
      'timestamp': Timestamp.now(),
    });
  }

  // READ https://www.youtube.com/watch?v=iQOvD0y-xnw&t=194s

  // UPDATE

  // DELETE
}
