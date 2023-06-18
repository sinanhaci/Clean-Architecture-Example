import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/usecases/get_user_list.dart';
part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  List<User> users = [];
  List<User> searchUser = [];
  final GetUserList _getUserList;
  UsersBloc(this._getUserList) : super(UsersInitial()) {
    on<RequestUserList>(onRequestUserList);
    on<UserList>(onUserList);
    on<UserSearch>(onUserSearch);
   
  }

  onRequestUserList(RequestUserList event, Emitter<UsersState> emit) async {
    emit(UsersLoading());
    final response = await _getUserList.execute();
    response.fold(
      (error) => emit(UsersHasError(error.err)),
      (users) {
        this.users.clear();
        this.users.addAll(users);
        emit(UserHasData(users));
      },
    );
  }

  onUserList(UserList event, Emitter<UsersState> emit) async {
    emit(UserHasData(users));
  }

  onUserSearch(UserSearch event, Emitter<UsersState> emit) async {
    emit(UsersLoading());
    final searchText = event.query.toLowerCase();
    final filteredUsers = users.where((user) =>
      user.name != null && user.name!.toLowerCase().contains(searchText)
    ).toList();
    searchUser.clear();
    searchUser.addAll(filteredUsers);
    if (searchUser.isEmpty) {
      emit(SearchLoadedEmpty());
    } else {
      emit(SearchLoaded(searchUser));
    }
  }



}
