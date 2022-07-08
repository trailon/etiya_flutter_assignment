part of 'listing_bloc.dart';

abstract class ListingBlocEvent extends Equatable {
  const ListingBlocEvent();

  @override
  List<Object> get props => [];
}

class GetRepoList extends ListingBlocEvent {
  final String paginationId;
  const GetRepoList({required this.paginationId});
}

class SearchInRepoList extends ListingBlocEvent {
  final String searchText;
  const SearchInRepoList({required this.searchText});

  @override
  List<Object> get props => [searchText];
}
