import 'dart:io';
import 'package:airbyteconnect/presentation/activity_card.dart';
import 'package:airbyteconnect/presentation/activity_card_one.dart';
import 'package:airbyteconnect/presentation/profile_card.dart';
import 'package:airbyteconnect/providers/branch_provider.dart';
import 'package:airbyteconnect/presentation/charts.dart';
import 'package:airbyteconnect/services/repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

const bool useEmulator = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => BranchProvider())
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String host = Platform.isAndroid ? '10.0.2.2' : 'localhost';
  final DataBaseRepository _db = DataBaseRepository();
  @override
  void initState() {
    if (useEmulator) {
      _db.db.useFirestoreEmulator(host, 8080);
      _db.db.settings = const Settings(
        persistenceEnabled: false,
      );
    }
    Provider.of<BranchProvider>(context, listen: false).fetchBranches();
    Provider.of<BranchProvider>(context, listen: false).fetchCollaborators();
    Provider.of<BranchProvider>(context, listen: false).fetchCommits();
    Provider.of<BranchProvider>(context, listen: false)
        .getPeterFollowers('peteruche21');
    Provider.of<BranchProvider>(context, listen: false)
        .fetchMaxFollowers('maxiggle');
    Provider.of<BranchProvider>(context, listen: false)
        .getPeterFollowings('peteruche21');
    Provider.of<BranchProvider>(context, listen: false)
        .fetchMaxFollowings('maxiggle');
    Provider.of<BranchProvider>(context, listen: false)
        .fetchContributorActivity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeef0f6),
      appBar: AppBar(
        title: const Text("Track your github activity"),
      ),
      body: ListView(
        children: [
          const ContributorImageCard(),
          const ActivityCard(),
          const ActivityCardOne(),
          Charts(
            weekDataList: context.watch<BranchProvider>().weekData,
          )
        ],
      ),
    );
  }
}
