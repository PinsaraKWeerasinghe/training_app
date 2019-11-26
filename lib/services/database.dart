import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ui_design/models/posts.dart';
import 'package:ui_design/models/users.dart';

class UserDatabaseServices {
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

class PostDatabaseServices {
  final CollectionReference postCollectionReference =
      Firestore.instance.collection('Posts');

  Future updatePostData(
      String title, String description, DocumentReference user) async {
    return await postCollectionReference.document().setData({
      'title': title,
      'description': description,
      'user': user,
    });
  }

  Future<Users> _userData(DocumentReference docRef) async {
    return await docRef.get().then((DocumentSnapshot ds) {
      return Users(name: ds.data['name']);
    });
  }

  Stream<List<Posts>> get posts {
    return postCollectionReference.snapshots().asyncMap(_postsListSnapshots);
  }

  Future<List<Posts>> _postsListSnapshots(QuerySnapshot snapshot) async {
    List<Posts> list = [];
    for (var doc in snapshot.documents) {
      list.add(Posts(
        description: doc.data['description'] ?? 'desc',
        title: doc.data['title'] ?? 'titl',
        user: await _userData(doc.data['user']),
      ));
    }
    return list;
  }
}
