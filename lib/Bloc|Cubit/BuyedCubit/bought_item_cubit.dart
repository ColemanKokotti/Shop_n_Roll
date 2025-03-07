import 'package:flutter_bloc/flutter_bloc.dart';

class BuyedItemCubit extends Cubit<bool> {
  BuyedItemCubit() : super(false);

  void toggleItemStatus() {
    emit(!state);
  }
}
