import 'package:bloc/bloc.dart';
import '../../FireBase/item_firebase_storage.dart';
import 'item_list_state.dart';


class ItemListCubit extends Cubit<ItemListState> {
  final ItemFirebaseStorage _itemFirebaseStorage;

  ItemListCubit(this._itemFirebaseStorage) : super(ItemListState());

  void deleteItem(String documentId) async {
    Map<String, dynamic>? deletedItem = await _itemFirebaseStorage.deleteItem(documentId);
    emit(state.copyWith(deletedItem: deletedItem, deletedItemId: documentId));
    }

  void undoDelete() async {
    if (state.deletedItem != null && state.deletedItemId != null) {
      bool success = await _itemFirebaseStorage.undoDelete(state.deletedItemId!, state.deletedItem!);
      if (success) {
        emit(state.clearDeletedItem());
      }
    }
  }

  void updateQuantity(String documentId, int newQuantity) async {
    bool success = await _itemFirebaseStorage.updateQuantity(documentId, newQuantity);
    if (success) {
      // Handle any necessary state change here, e.g., update the list or emit a new state
    }
  }
}
