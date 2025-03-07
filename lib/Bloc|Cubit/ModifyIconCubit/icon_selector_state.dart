class IconSelectorState {
  final String currentIconName;

  IconSelectorState({required this.currentIconName});

  IconSelectorState copyWith({String? currentIconName}) {
    return IconSelectorState(
      currentIconName: currentIconName ?? this.currentIconName,
    );
  }
}
