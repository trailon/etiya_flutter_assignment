part of 'view_repo_bloc.dart';

abstract class ViewRepoState extends Equatable {
  const ViewRepoState();
  
  @override
  List<Object> get props => [];
}

class ViewRepoInitial extends ViewRepoState {}

class ViewRepoLoading extends ViewRepoState {}

class ViewRepoLoaded extends ViewRepoState {
  final RepositoryModel repo;
  const ViewRepoLoaded(this.repo);
}

class ViewRepoError extends ViewRepoState {
  final String? message;
  const ViewRepoError(this.message);
}