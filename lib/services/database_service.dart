import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_ispgaya/models/subjects.dart';

const String SUBJECTS_COLLECTION_REF = "subject";

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _subjectsRef;

  DatabaseService() {
    _subjectsRef =
        _firestore.collection(SUBJECTS_COLLECTION_REF).withConverter<Subjects>(
            fromFirestore: (snapshots, _) => Subjects.fromJson(
                  snapshots.data()!,
                ),
            toFirestore: (subjects, _) => subjects.toJson());
  }

  Stream<QuerySnapshot> getTodos() {
    return _subjectsRef.snapshots();
  }

  void addSubject(Subjects subjects) async {
    _subjectsRef.add(subjects);
  }
}
