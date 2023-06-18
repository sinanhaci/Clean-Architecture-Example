import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:example/domain/usecases/get_user_detail.dart';
import 'package:example/presentation/blocs/user_detail/user_detail_event.dart';
import '../../../domain/entities/user.dart';


part 'user_detail_state.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  User? user;
  final GetUserDetail _getUserDetail;
  UserDetailBloc(this._getUserDetail) : super(UserDetailInitial()) {
    on<RequestUserDetail>(getUserDetial);
  }

  getUserDetial(RequestUserDetail event, Emitter<UserDetailState> emit) async {
    emit(UserDetailLoading());
    if(event.userId == null){
      emit(UserDetailNotFound());
      return;
    }
    final response = await _getUserDetail.execute(event.userId!);
    response.fold(
      (error) => emit(UserDetailHasError(error.err)),
      (user) {
        this.user = user;
        if(this.user == null){
          emit(UserDetailNotFound());
        }else{
          emit(UserDetailHasData(user));
        }
      },
    );
  }
}
