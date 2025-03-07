class AddButtonState {
  final String nameItem;
  final String descriptionItem;
  final String selectedIcon;
  final int quantity;
  final String? imageUrl;

  AddButtonState({
    this.nameItem = '',
    this.descriptionItem = '',
    this.selectedIcon = '',
    this.quantity = 1,
    this.imageUrl,
  });

  AddButtonState copyWith({
    String? nameItem,
    String? descriptionItem,
    String? selectedIcon,
    int? quantity,
    String? imageUrl,
  }) {
    return AddButtonState(
      nameItem: nameItem ?? this.nameItem,
      descriptionItem: descriptionItem ?? this.descriptionItem,
      selectedIcon: selectedIcon ?? this.selectedIcon,
      quantity: quantity ?? this.quantity,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  AddButtonState reset() {
    return AddButtonState();
  }
}