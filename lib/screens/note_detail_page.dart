import 'package:flutter/material.dart';
import 'package:note_keeper_moor/database/database.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as dr;

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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(children: [
          TextFormField(
            controller: titleEditingController,
            decoration: InputDecoration(
              
              hintText: 'Enter Title',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          
          ),
          const SizedBox(height: 10.0,),
          TextFormField(
            controller: descriptionEditingController,
            maxLength: 255,
            maxLines: 8,
            minLines: 7,
            decoration: InputDecoration(
              hintText: 'Enter Description',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          
          ),
        ])
      ),
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
            _saveTodo();
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

  void _saveTodo() {
    database.insertNote(NoteCompanion(
      title: dr.Value(titleEditingController.text),
      description: dr.Value(descriptionEditingController.text),
      priority: dr.Value(1),
      color:dr. Value(0),
    
    ) ).then((value) => Navigator.pop(context));
  }
}
