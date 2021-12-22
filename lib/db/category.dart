import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class CategoryService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void createCategory(String name) {
    var id = Uuid();
    String categoryId = id.v1();

    _firestore.collection('categories').doc(categoryId).set({'category': name});
  }

  Future<List<DocumentSnapshot>> getCategory() async {
    // QuerySnapshot querySnapshot =
    //     await _firestore.collection('categories').get();
    // print('query');
    // print(querySnapshot.docs.length);
    var data = await _firestore.collection('categories').get();
    return data.docs;
  }
}
