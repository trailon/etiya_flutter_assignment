import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:etiya_flutter_assignment/db/requests.dart';
import 'package:etiya_flutter_assignment/models/repositorymodel.dart';

part 'view_repo_event.dart';
part 'view_repo_state.dart';

class ViewRepoBloc extends Bloc<ViewRepoEvent, ViewRepoState> {
  APICalls apiCaller = APICalls();
  ViewRepoBloc() : super(ViewRepoInitial()) {
    on<ViewRepoEvent>((event, emit) async {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (!(connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi)) {
        emit(const ViewRepoError('No Internet Connection'));
      } else {
        if (event is GetRepository) {
          emit(ViewRepoLoading());
          RepositoryModel? repositoryModel =
              await apiCaller.getRepository(userRepo: event.userRepo);
          if (repositoryModel != null) {
            emit(ViewRepoLoaded(repositoryModel));
          } else {
            emit(const ViewRepoError("Couldn't load repository"));
          }
        }
      }
    });
  }
}
