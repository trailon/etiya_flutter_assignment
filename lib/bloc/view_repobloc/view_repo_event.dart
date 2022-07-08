part of 'view_repo_bloc.dart';

abstract class ViewRepoEvent extends Equatable {
  const ViewRepoEvent();

  @override
  List<Object> get props => [];
}

class GetRepository extends ViewRepoEvent {
  String userRepo;
  GetRepository({required this.userRepo});
}
