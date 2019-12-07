import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dear_diary/models/models.dart';

class EntryRepository {
  final CollectionReference postCollectionReference =
      Firestore.instance.collection('Posts');

  Future updateEntries(
      String title, String description, DocumentReference user) async {
    return await postCollectionReference.document().setData({
      'title': title,
      'description': description,
      'user': user,
    });
  }

  Future<User> _userData(DocumentReference docRef) async {
    return await docRef.get().then((DocumentSnapshot ds) {
      return User(name: ds.data['name']);
    });
  }

  Stream<List<Entry>> entries() {
    return postCollectionReference.snapshots().asyncMap(_postsListSnapshots);
  }

  Future<List<Entry>> _postsListSnapshots(QuerySnapshot snapshot) async {
    List<Entry> list = [];
    for (var doc in snapshot.documents) {
      list.add(Entry(
        description: doc.data['description'] ?? 'desc',
        title: doc.data['title'] ?? 'titl',
        user: await _userData(doc.data['user']),
      ));
    }
    return list;
  }
}
