import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'icon_selector_state.dart';

class IconSelectorCubit extends Cubit<IconSelectorState> {
  final String documentId;
  final CollectionReference _itemsCollection = FirebaseFirestore.instance.collection('Items');

  IconSelectorCubit({required String initialIconName, required this.documentId})
      : super(IconSelectorState(currentIconName: initialIconName));

  void updateIcon(String newIconName) async {
    try {
      await _itemsCollection.doc(documentId).update({'iconItem': newIconName});
      emit(state.copyWith(currentIconName: newIconName));
    } catch (e) {
      print('Errore durante l\'aggiornamento dell\'icona: $e');
    }
  }
}