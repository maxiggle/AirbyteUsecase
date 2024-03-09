import 'package:airbyteconnect/providers/branch_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ActivityCardOne extends StatelessWidget {
  const ActivityCardOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BranchProvider>(
      builder: (context, state, child) {
        if (state.getCollaborators!.isEmpty) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else {
          final Uri _url = Uri.parse(
              '${context.read<BranchProvider>().getCollaborators?[1].htmlUrl}');

          Future<void> _launchUrl() async {
            if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
              throw Exception('Could not launch $_url');
            }
          }

          return Container(
            // height: 150,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  "Activity Card",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Contributor profile: ',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _launchUrl();
                            },
                            child: Text(
                              state.getCollaborators?[1].htmlUrl ?? '',
                              style: const TextStyle(
                                  fontSize: 15,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Total Commit: ',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500)),
                        Text('${state.getCommits?.length}',
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500)),
                      ],
                    ),
                    const Row(
                      children: [
                        Text('Total Pull Request: ',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500)),
                        Text('0',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500)),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Followers: ',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500)),
                        Text(state.getMaxFollowers?.length.toString() ?? '0',
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500)),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Followings: ',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500)),
                        Text('${state.getMaxFollowings?.length}',
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      },
    );
  }
}


// class ContributorActivity extends StatelessWidget {
//   const ContributorActivity({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }