 import 'package:flutter/material.dart';
import 'package:note_keeper_moor/database/database.dart';

class NoteDetailPage extends StatefulWidget {
  final String title;
  final NoteCompanion noteCompanion;

  const NoteDetailPage({ Key? key, required this.title, required this.noteCompanion }) : super(key: key);



  @override
  State<NoteDetailPage> createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getDetailAppBar(widget.title),
    );
  }

  _getDetailAppBar(String title) {
    return AppBar(
      title: Text(title, style: const TextStyle(color: Colors.black),),
    );
  }
}