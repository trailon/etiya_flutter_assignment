import 'package:auto_route/auto_route.dart';
import 'package:etiya_flutter_assignment/bloc/homescreenbloc/listing_bloc.dart';
import 'package:etiya_flutter_assignment/models/searchrepositoriesmodel.dart';
import 'package:etiya_flutter_assignment/screens/viewrepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenLoadedState extends StatefulWidget {
  const HomeScreenLoadedState({Key? key, required this.searchRepositoriesModel})
      : super(key: key);
  final SearchRepositoriesModel searchRepositoriesModel;
  @override
  State<HomeScreenLoadedState> createState() => _HomeScreenLoadedStateState();
}

class _HomeScreenLoadedStateState extends State<HomeScreenLoadedState> {
  late ScrollController controller;
  @override
  void initState() {
    controller = ScrollController();
    SharedPreferences.getInstance().then((value) {
      controller.jumpTo(value.getDouble('initialScrollPosition')!);
      value.setDouble(
          'initialScrollPosition', controller.position.maxScrollExtent);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
            controller: controller,
            padding: const EdgeInsets.all(8),
            children: [
          ...widget.searchRepositoriesModel.items!.map<Widget>((repo) {
            return RepoItem(repo: repo);
          }).toList(),
          ElevatedButton.icon(
              onPressed: () {
                BlocProvider.of<ListingBloc>(context).add(GetRepoList(
                    paginationId: widget.searchRepositoriesModel.items!.last.id
                        .toString()));
                controller.jumpTo(500);
              },
              icon: const Icon(Icons.restart_alt),
              label: const Text("Load More"))
        ]));
  }
}

class RepoItem extends StatelessWidget {
  const RepoItem({Key? key, required this.repo}) : super(key: key);
  final Items repo;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          onTap: (){
            context.router.pushWidget(ViewRepo(userRepo: repo.fullName!));
          },
      leading:
          CircleAvatar(backgroundImage: NetworkImage(repo.owner!.avatarUrl!)),
      title: Text(repo.fullName!),
      subtitle: Text(repo.description.toString(),
          maxLines: 2, overflow: TextOverflow.ellipsis),
      trailing: IconButton(
          onPressed: () {
            Share.share('check out this repo ${repo.url}');
          },
          icon: Icon(Icons.adaptive.share)),
    ));
  }
}

class SearchedRepoItem extends StatelessWidget {
  const SearchedRepoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
