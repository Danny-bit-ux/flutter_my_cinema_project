import 'package:flutter/widgets.dart';
import 'package:flutter_application_tmdb/domain/api_client/api_client.dart';
import 'package:flutter_application_tmdb/domain/data_providers/session_data_provider.dart';

class AuthModel extends ChangeNotifier {
  final _apiClient = ApiClient();

  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isAuthProgress = false;
  bool get canStartAuth => !_isAuthProgress;
  bool get isAuthProgress => _isAuthProgress;

  Future<void> auth(BuildContext context) async {
    final login = loginTextController.text;
    final password = passwordTextController.text;

    if (login.isEmpty || password.isEmpty) {
      _errorMessage = 'Заполните логин и пароль';
      notifyListeners();
      return;
    }
    _errorMessage = null;
    _isAuthProgress = true;
    notifyListeners();
    String? sessionId;

    try {
      sessionId = await _apiClient.auth(
        username: login,
        password: password,
      );
    } catch (e) {
      _errorMessage = 'Неправильный логин или пароль!';
    }

    _isAuthProgress = false;
    if (_errorMessage != null) {
      notifyListeners();
      return;
    }

    Navigator.of(context).pushNamed('/main_screen');
  }
}

class AuthProvider extends InheritedNotifier {
  final AuthModel model;

  const AuthProvider({Key? key, required this.model, required this.child})
      : super(key: key, notifier: model, child: child);

  final Widget child;

  static AuthProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AuthProvider>();
  }

  static AuthProvider? read(BuildContext context) {
    final widget =
        context.getElementForInheritedWidgetOfExactType<AuthProvider>()?.widget;
    return widget is AuthProvider ? widget : null;
  }
}
