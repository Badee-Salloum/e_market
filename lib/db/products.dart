import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

class ProductService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void uploadProduct({
    required String productName,
    required String brand,
    required String category,
    required List images,
  }) {
    var id = Uuid();
    String productId = id.v1();

    _firestore.collection('products').doc(productId).set({
      'name': productName,
      'id': productId,
      'brand': brand,
      'category': category,
    });
  }
}
