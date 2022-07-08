import 'package:auto_size_text/auto_size_text.dart';
import 'package:etiya_flutter_assignment/models/repositorymodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ViewRepoLoadedState extends StatelessWidget {
  ViewRepoLoadedState({Key? key, required this.userRepo}) : super(key: key);
  RepositoryModel userRepo;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.aspectRatio * 100),
              child: CircleAvatar(
                  radius: 75,
                  backgroundImage: NetworkImage(userRepo.owner!.avatarUrl!)),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              userRepo.forks != null
                  ? repoInfo(context, FontAwesomeIcons.codeFork,
                      " Fork ${userRepo.forks}")
                  : const Text("Fork is not available"),
              userRepo.watchersCount != null
                  ? repoInfo(context, FontAwesomeIcons.eye,
                      " Watch ${userRepo.watchersCount}")
                  : const Text("Watch is not available"),
              userRepo.stargazersCount != null
                  ? repoInfo(context, FontAwesomeIcons.star,
                      " Star ${userRepo.stargazersCount}")
                  : const Text("Star is not available"),
            ]),
            userRepo.description != null
                ? Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.aspectRatio * 20,
                        horizontal:
                            MediaQuery.of(context).size.aspectRatio * 35),
                    child: Text(
                      userRepo.description!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize:
                              MediaQuery.of(context).size.aspectRatio * 35),
                    ),
                  )
                : const Text("Description is not available"),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              copyUrlButton(userRepo.htmlUrl!, "Copy Repo Url"),
              copyUrlButton(userRepo.cloneUrl!, "Copy Clone Url"),
              copyUrlButton(userRepo.sshUrl!, "Copy Ssh Url"),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              launchUrlButton(userRepo.htmlUrl!, "Go To Repo"),
              launchUrlButton(userRepo.owner!.htmlUrl!, "Go To User"),
              launchUrlButton("${userRepo.owner!.htmlUrl!}?tab=repositories",
                  "Go To Repos"),
            ]),
          ],
        ),
      ),
    );
  }

  Row repoInfo(BuildContext context, IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon),
        Text(
          text,
          style:
              TextStyle(fontSize: MediaQuery.of(context).size.aspectRatio * 35),
        ),
      ],
    );
  }

  ElevatedButton copyUrlButton(String url, String text) {
    return ElevatedButton(
        onPressed: () {
          Clipboard.setData(ClipboardData(text: url));
          EasyLoading.showToast("Copied url to clipboard",
              toastPosition: EasyLoadingToastPosition.bottom,
              duration: const Duration(seconds: 1));
        },
        child: AutoSizeText(text));
  }

  ElevatedButton launchUrlButton(String url, String text) {
    return ElevatedButton(
        onPressed: () {
          launchUrlString(url);
        },
        child: AutoSizeText(text));
  }
}
