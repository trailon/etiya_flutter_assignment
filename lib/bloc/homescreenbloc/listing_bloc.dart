import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:etiya_flutter_assignment/db/requests.dart';
import 'package:etiya_flutter_assignment/models/searchrepositoriesmodel.dart';

part 'listing_bloc_event.dart';
part 'listing_bloc_state.dart';

class ListingBloc extends Bloc<ListingBlocEvent, ListingBlocState> {
  SearchRepositoriesModel? model;
  APICalls apiCaller = APICalls();
  ListingBloc() : super(ListingBlocInitial()) {
    on<ListingBlocEvent>((event, emit) async {
      if (event is GetRepoList) {
        emit(ListingBlocLoading());
        SearchRepositoriesModel? newList =
            await apiCaller.getRepoList(paginationId: event.paginationId);
        if (model == null) {
          model = newList;
        } else {
          model!.items!.addAll(newList!.items as Iterable<Items>);
        }
        emit(ListingBlocLoaded(model!));
        //emit(ListingBlocLoaded(SearchRepositoriesModel()));
      } else if (event is SearchInRepoList) {
        emit(ListingBlocLoading());
        SearchRepositoriesModel? searchedList =
            await apiCaller.getRepoSearchList(searchText: event.searchText);
        emit(ListingBlocLoaded(searchedList!));
      }
    });
  }
}
