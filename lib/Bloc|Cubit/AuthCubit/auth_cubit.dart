import 'package:bloc/bloc.dart';
import '../../FireBase/auth_service.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService;

  AuthCubit(this._authService) : super(AuthInitial());

  void login(String email, String password) {
    emit(AuthLoading());
    _authService.login(email, password).then((user) {
      if (user != null) {
        emit(AuthAuthenticated(user));
      } else {
        emit(AuthErrorDialogState('Login fallito. Si prega di riprovare.'));
      }
    }).catchError((e) {
      print('Errore nel login: $e');
      emit(AuthErrorDialogState('Login fallito. Si prega di riprovare.'));
    });
  }

  void register(String email, String password) {
    emit(AuthLoading());
    _authService.register(email, password).then((user) {
      if (user != null) {
        emit(AuthAuthenticated(user));
      } else {
        emit(AuthErrorDialogState('Registrazione fallita. Si prega di riprovare.'));
      }
    }).catchError((e) {
      print('Errore nella registrazione: $e');
      emit(AuthErrorDialogState('Registrazione fallita. Si prega di riprovare.'));
    });
  }

  void logout() {
    _authService.logout().then((_) {
      emit(AuthUnauthenticated());
    }).catchError((e) {
      print('Errore nel logout: $e');
      emit(AuthErrorDialogState('Errore durante il logout.'));
    });
  }

  void toggleForm() {
    if (state is AuthLoginState) {
      emit(AuthRegisterState());
    } else {
      emit(AuthLoginState());
    }
  }
}
