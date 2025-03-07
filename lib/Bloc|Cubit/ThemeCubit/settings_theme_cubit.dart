import 'package:bloc/bloc.dart';

class SettingsThemeCubit extends Cubit<bool> {
  SettingsThemeCubit() : super(false);

  void toggleThemeOptions() {
    emit(!state);
  }
}
