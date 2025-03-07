class ItemListState {
  final Map<String, dynamic>? deletedItem;
  final String? deletedItemId;

  ItemListState({this.deletedItem, this.deletedItemId});

  ItemListState copyWith({Map<String, dynamic>? deletedItem, String? deletedItemId}) {
    return ItemListState(
      deletedItem: deletedItem ?? this.deletedItem,
      deletedItemId: deletedItemId ?? this.deletedItemId,
    );
  }

  ItemListState clearDeletedItem() {
    return ItemListState(deletedItem: null, deletedItemId: null);
  }
}