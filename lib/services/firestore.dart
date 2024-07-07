import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // Obter a coleção de notas
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  // CREATE - Adicionar uma nova nota
  Future<void> addNote(String note) {
    return notes.add({
      'note': note, // Corrigi 'notes' para 'note'
      'timestamp': Timestamp.now(),
    });
  }

  // READ - Obter o stream de notas ordenadas por timestamp
  Stream<QuerySnapshot> getNotesStream() {
    // Corrigi 'getNodesStream' para 'getNotesStream'
    final notesStream =
        notes.orderBy('timestamp', descending: true).snapshots();
    return notesStream;
  }

  // UPDATE - Método futuro para atualização de notas
  Future<void> updateNote(String docId, String newNote) {
    return notes.doc(docId).update({
      'note': newNote,
      'timestamp': Timestamp.now(),
    });
  }

  // DELETE - Método futuro para exclusão de notas
  Future<void> deleteNote(String docId) {
    return notes.doc(docId).delete();
  }
}
