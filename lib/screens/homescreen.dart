import 'package:auto_size_text/auto_size_text.dart';
import 'package:etiya_flutter_assignment/bloc/homescreenbloc/listing_bloc.dart';
import 'package:etiya_flutter_assignment/widgets/HomeScreenWidgets/homeScreenInitialState.dart';
import 'package:etiya_flutter_assignment/widgets/HomeScreenWidgets/homeScreenLoadedState.dart';
import 'package:etiya_flutter_assignment/widgets/defaultLoadingState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListingBloc(),
      child: HomeScreenBody(),
    );
  }
}

class HomeScreenBody extends StatelessWidget {
  HomeScreenBody({Key? key}) : super(key: key);
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var searchTile = Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.aspectRatio * 15),
        child: Card(
            child: ListTile(
                title: TextFormField(
                    controller: _searchController,
                    onFieldSubmitted: (value) {
                      BlocProvider.of<ListingBloc>(context)
                          .add(SearchInRepoList(searchText: value));
                    },
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        labelText: "Search",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                trailing: IconButton(
                    icon: const Icon(Icons.cancel),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      _searchController.text = "";
                      BlocProvider.of<ListingBloc>(context)
                          .add(const GetRepoList(paginationId: "0"));
                    }))));
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            searchTile,
            BlocBuilder<ListingBloc, ListingBlocState>(
              builder: (_, state) {
                if (state is ListingBlocInitial) {
                  return const HomeScreenInitialState();
                } else if (state is ListingBlocLoading) {
                  return const HomeScreenLoadingState();
                } else if (state is ListingBlocLoaded) {
                  return HomeScreenLoadedState(
                      searchRepositoriesModel: state.listedRepos);
                } else if (state is ListingBlocError) {
                  return AutoSizeText(state.message!);
                } else {
                  return const AutoSizeText("An Error Occured");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
