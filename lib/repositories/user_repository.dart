import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final CollectionReference collectionReference =
      Firestore.instance.collection('Users');

  Future<DocumentReference> updateUserData(String name) async {
    var ref = collectionReference.document();
    await ref.setData({
      'name': name,
    });
    return ref;
  }
}
