import 'package:flutter/material.dart';
import 'package:note_keeper_moor/database/database.dart';
import 'package:note_keeper_moor/screens/note_list_page.dart';
//import provider
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => AppDatabase(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.deepOrange,
          textTheme: const TextTheme(
            headline5: TextStyle(
                fontFamily: 'Sans',
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 24),
            bodyText2: TextStyle(
                fontFamily: 'Sans',
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20),
            bodyText1: TextStyle(
                fontFamily: 'Sans',
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontSize: 18),
            subtitle2: TextStyle(
                fontFamily: 'Sans',
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontSize: 14),
          ),
        ),
        home: const NoteListPage(),
      ),
    );
  }
}
