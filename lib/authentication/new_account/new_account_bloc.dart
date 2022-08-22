// import 'package:finances_fire/services/auth_services.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegram_clone/models/user.dart';

import '../../services/mockServices/auth_mock_service.dart';
import 'new_account_states.dart';

class CreateAccountCubit extends Cubit<CreateAccountStates> {
  CreateAccountCubit() : super(CreateAccountInitialState());

  createAccountPressed(String name, String email, String password) async {
    emit(CreateAccountLoading());
    try {
     final User user =  await createAccount(name: name, user: email, password: password);
      emit(CreateAccountSuccess(user: user));
    } on Exception catch  (e) {
      emit(CreateAccountError(e.toString()));
    }
  }

}

////with firebase
// class CreateAccountCubit extends Cubit<CreateAccountStates> {
//   CreateAccountCubit() : super(CreateAccountInitialState());

//   createAccountPressed(String email, String password) async {
//     emit(CreateAccountLoading());
//     try {
//      final String token =  await createAccount(email, password);
//       emit(CreateAccountSuccess(token: token));
//     } on FirebaseAuthException catch (e) {
//       emit(CreateAccountError(e.message ?? 'Auth Error'));
//     } catch (e) {
//       emit(CreateAccountError('Unknow Error'));
//     }
//   }

// }