part of 'listing_bloc.dart';

abstract class ListingBlocState extends Equatable {
  const ListingBlocState();

  @override
  List<Object> get props => [];
}

class ListingBlocInitial extends ListingBlocState {}

class ListingBlocLoading extends ListingBlocState {}

class ListingBlocLoaded extends ListingBlocState {
  final SearchRepositoriesModel listedRepos;
  const ListingBlocLoaded(this.listedRepos);
}

class ListingBlocError extends ListingBlocState {
  final String? message;
  const ListingBlocError(this.message);
}
