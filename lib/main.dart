import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/Home/Home.dart';
import 'package:test_app/Service/API_Response.dart';

void main() {
  tokenResponse getTokenResponse;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiRepositoryProvider(
        providers: [RepositoryProvider(create: (context) => APIResponse())], child: Home(),
      ),
    );
  }
}

