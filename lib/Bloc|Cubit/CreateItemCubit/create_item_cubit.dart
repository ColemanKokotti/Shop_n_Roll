import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:bloc/bloc.dart";
import 'package:image_picker/image_picker.dart';
import 'create_item_state.dart';



class AddButtonCubit extends Cubit<AddButtonState> {
  final CollectionReference _itemsCollection = FirebaseFirestore.instance.collection('Items');
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController quantityController = TextEditingController(text: '1');

  final ImagePicker _picker = ImagePicker();

  AddButtonCubit() : super(AddButtonState()) {
    nameController.addListener(_updateNameFromController);
    descriptionController.addListener(_updateDescriptionFromController);
    quantityController.addListener(_updateQuantityFromController);
  }

  void _updateNameFromController() {
    emit(state.copyWith(nameItem: nameController.text));
  }

  void _updateDescriptionFromController() {
    emit(state.copyWith(descriptionItem: descriptionController.text));
  }

  void _updateQuantityFromController() {
    final quantityValue = int.tryParse(quantityController.text) ?? 1;
    emit(state.copyWith(quantity: quantityValue));
  }

  void setSelectedIcon(String icon) {
    emit(state.copyWith(selectedIcon: icon));
  }

  void increaseQuantity() {
    final newQuantity = state.quantity + 1;
    quantityController.text = newQuantity.toString();
    emit(state.copyWith(quantity: newQuantity));
  }

  void decreaseQuantity() {
    final newQuantity = state.quantity > 0 ? state.quantity - 1 : 0;
    quantityController.text = newQuantity.toString();
    emit(state.copyWith(quantity: newQuantity));
  }

  Future<void> selectImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(state.copyWith(imageUrl: image.path));
    }
  }

  Future<bool> addItem(BuildContext context) async {
    final theme = Theme.of(context);

    if (state.nameItem.isEmpty || state.descriptionItem.isEmpty || state.selectedIcon.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(seconds: 2), () {
            Navigator.of(context).pop();
          });
          return AlertDialog(
            backgroundColor: theme.appBarTheme.backgroundColor,
            title: Text(
              "Attenzione",
              style: theme.textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
            content: Text(
              "Tutti i campi devono essere compilati.",
              style: TextStyle(color: theme.textTheme.labelLarge?.backgroundColor),
            ),
          );
        },
      );
      return false;
    }

    try {
      await _itemsCollection.add({
        'nameItem': state.nameItem,
        'iconItem': state.selectedIcon,
        'descriptionItem': state.descriptionItem,
        'quantity': state.quantity,
        'imageUrl': state.imageUrl,
      });

      reset();
      return true;
    } catch (e) {
      print("Errore nell'aggiungere l'elemento: $e");
      return false;
    }
  }

  void reset() {
    nameController.clear();
    descriptionController.clear();
    quantityController.text = '1';
    emit(AddButtonState());
  }

  @override
  Future<void> close() {
    nameController.dispose();
    descriptionController.dispose();
    quantityController.dispose();
    return super.close();
  }
}
