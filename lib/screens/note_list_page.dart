import 'package:flutter/material.dart';
import 'package:note_keeper_moor/database/database.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart';

import 'note_detail_page.dart';

class NoteListPage extends StatefulWidget {
  const NoteListPage({Key? key}) : super(key: key);

  @override
  State<NoteListPage> createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {
  late AppDatabase database;

  @override
  Widget build(BuildContext context) {
    database = Provider.of<AppDatabase>(context);
    return Scaffold(
      body: FutureBuilder<List<NoteData>>(
        future: _getNoteFromDatabase(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            List<NoteData>? noteList = snapshot.data;
            if(noteList!=null){
              if(noteList.isEmpty){
                return Center(
                  child:  Text('No Notes Found', style: Theme.of(context).textTheme.bodyText2,),
                );
              } else{
                return noteListUI(noteList);
              }
            }
          } else if (snapshot.hasError) {
            return Text(
              '${snapshot.error}',
              style: Theme.of(context).textTheme.bodyText2,
            );
          }
          return Center(
            child: Text(
              'Click on add butotn to add new note',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder( side: BorderSide(color: Colors.black, width: 2.0)),
        backgroundColor: Colors.white,
        onPressed: () {
          _navigateToDetail('Add Note',const NoteCompanion(
            title: Value(''),
            description: Value(''),
            priority: Value(1),
            color: Value(0),
          ));
        },
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }

  Future<List<NoteData>> _getNoteFromDatabase() {
    return database.getNoteList();
  }

  Widget noteListUI(List<NoteData> noteList) {
    return Container( );
  }

  void _navigateToDetail(String title, NoteCompanion noteCompanion) {
    Navigator.push(context, MaterialPageRoute(builder: (context) =>NoteDetailPage(title: title, noteCompanion: noteCompanion,),));

  }
}
