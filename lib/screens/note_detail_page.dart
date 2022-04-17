import 'package:flutter/material.dart';
import 'package:note_keeper_moor/database/database.dart';
import 'package:provider/provider.dart';

class NoteDetailPage extends StatefulWidget {
  final String title;
  final NoteCompanion noteCompanion;

  const NoteDetailPage(
      {Key? key, required this.title, required this.noteCompanion})
      : super(key: key);

  @override
  State<NoteDetailPage> createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  late AppDatabase database;
  late TextEditingController titleEditingController;
  late TextEditingController descriptionEditingController;

@override
  void initState() {
    // TODO: implement initState
    titleEditingController = TextEditingController();
    descriptionEditingController = TextEditingController();
    titleEditingController.text = widget.noteCompanion.title.value;
    descriptionEditingController.text = widget.noteCompanion.description.value;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    database = Provider.of<AppDatabase>(context);
    return Scaffold(
      appBar: _getDetailAppBar(widget.title),
    );
  }

  _getDetailAppBar(String title) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        
        },
        icon: const Icon(
          Icons.chevron_left_outlined,
          color: Colors.black,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
          
          },
          icon: const Icon(
            Icons.save,
            color: Colors.black,
          ),
        ),
        IconButton(
          onPressed: () {
          
          },
          icon: const Icon(
            Icons.delete,
            color: Colors.black,
          ),
        ),
      
      ],
    );
  }
}
