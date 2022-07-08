import 'package:etiya_flutter_assignment/bloc/homescreenbloc/listing_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenInitialState extends StatelessWidget {
  const HomeScreenInitialState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: MediaQuery.of(context).size.longestSide * 0.1),
      child: ElevatedButton.icon(
          onPressed: () {
            BlocProvider.of<ListingBloc>(context)
                .add(const GetRepoList(paginationId: "0"));
          },
          icon: const Icon(Icons.download_for_offline_rounded),
          label: const Text("Fetch Repos")),
    );
  }
}
