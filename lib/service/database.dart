import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
   Future<Stream<QuerySnapshot>>  getFoodItem(String name) async {
      return await FirebaseFirestore.instance.collection(name).snapshots();
   }
}
