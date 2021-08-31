import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nekidaem_test/scr/domain/cubit/user/user_state.dart';
import 'package:nekidaem_test/scr/domain/reposytory/user_repository.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;

  UserCubit(this.userRepository) : super(UserEmptyState(errors: ''));

  Future<void> getToken(username, password) async {
    final String _token = await userRepository.getDataToken(username, password);

    if (_token.length > 80) {
      emit(
        UserLoadedState(
          token: _token,
        ),
      );
    } else {
      emit(UserEmptyState(errors: _token));
    }
  }
}
