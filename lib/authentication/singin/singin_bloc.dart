


// import 'package:finances_fire/services/auth_services.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegram_clone/authentication/singin/singin_states.dart';
import '../../models/user.dart';
import '../../services/mockServices/auth_mock_service.dart';

import '../repository/user_repository.dart';

class SinginCubit extends Cubit<SinginStates> {
  SinginCubit(this.userRepository) : super(SinginInitialState());
  final UserRepository userRepository;

  

  enterPressed(String email, String password) async {
    emit(SinginLoading());
    try {
      final User user = await singin(user: email, password: password);
      emit(SinginSuccess(user: user));
    } catch (e) {
      emit(SinginError('Unknow Error'));
    }
  }

}


//// Firebase
// class SinginCubit extends Cubit<SinginStates> {
//   SinginCubit(this.userRepository) : super(SinginInitialState());
//   final UserRepository userRepository;

  

//   enterPressed(String email, String password) async {
//     emit(SinginLoading());
//     try {
//       final String token = await singin(email, password);
//       emit(SinginSuccess(token: token));
//     } on FirebaseAuthException catch (e) {
//       emit(SinginError(e.message ?? 'Auth Error'));
//     } catch (e) {
//       emit(SinginError('Unknow Error'));
//     }
//   }

// }