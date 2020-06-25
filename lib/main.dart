import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tooglemaps/providers/map_spaces.dart';
import 'package:tooglemaps/screens/add_space_screen.dart';
import 'package:tooglemaps/screens/space_detail_screen.dart';
import 'package:tooglemaps/screens/space_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MapSpace(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'toogle Maps',
        theme: ThemeData(
          primaryColor: Colors.teal[300],
          accentColor: Colors.redAccent[100],
        ),
        home: SpaceListScreen(),
        routes: {
          AddSpaceScreen.routeName: (ctx) => AddSpaceScreen(),
          SpaceDetailScreen.routeName: (ctx) => SpaceDetailScreen(),
        },
      ),
    );
  }
}
