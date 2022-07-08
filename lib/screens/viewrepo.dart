import 'package:etiya_flutter_assignment/bloc/view_repobloc/view_repo_bloc.dart';
import 'package:etiya_flutter_assignment/widgets/ViewScreenWidgets/viewScreenLoadedState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewRepo extends StatelessWidget {
  const ViewRepo({Key? key, required this.userRepo}) : super(key: key);
  final String userRepo;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ViewRepoBloc(),
        child: ViewRepoBody(userRepo: userRepo));
  }
}

class ViewRepoBody extends StatefulWidget {
  const ViewRepoBody({Key? key, required this.userRepo}) : super(key: key);
  final String userRepo;
  @override
  State<ViewRepoBody> createState() => _ViewRepoBodyState();
}

class _ViewRepoBodyState extends State<ViewRepoBody> {
  @override
  void initState() {
    BlocProvider.of<ViewRepoBloc>(context)
        .add(GetRepository(userRepo: widget.userRepo));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: BlocBuilder<ViewRepoBloc, ViewRepoState>(
        builder: (context, state) {
          if (state is ViewRepoInitial) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is ViewRepoLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is ViewRepoLoaded) {
            return ViewRepoLoadedState(userRepo: state.repo);
          } else if (state is ViewRepoError) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Text("No data");
          }
        },
      )),
    );
  }
}
