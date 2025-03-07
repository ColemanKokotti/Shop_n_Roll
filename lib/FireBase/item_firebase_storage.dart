import 'package:cloud_firestore/cloud_firestore.dart';

class ItemFirebaseStorage {
  final CollectionReference _itemsCollection = FirebaseFirestore.instance.collection('Items');

  Future<Map<String, dynamic>?> deleteItem(String documentId) async {
    try {
      DocumentSnapshot doc = await _itemsCollection.doc(documentId).get();
      Map<String, dynamic>? deletedItem = doc.data() as Map<String, dynamic>?;

      await _itemsCollection.doc(documentId).delete();

      return deletedItem;
    } catch (e) {
      print('Errore durante l\'eliminazione: $e');
      return null;
    }
  }

  Future<bool> undoDelete(String documentId, Map<String, dynamic> item) async {
    try {
      await _itemsCollection.doc(documentId).set(item);
      return true;
    } catch (e) {
      print('Errore durante il ripristino: $e');
      return false;
    }
  }

  Future<bool> updateQuantity(String documentId, int newQuantity) async {
    try {
      newQuantity = newQuantity < 0 ? 0 : newQuantity;
      await _itemsCollection.doc(documentId).update({'quantity': newQuantity});
      return true;
    } catch (e) {
      print('Errore durante l\'aggiornamento della quantità: $e');
      return false;
    }
  }
}
