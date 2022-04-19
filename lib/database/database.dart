import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

class Note extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text().named('description')();
  IntColumn get priority => integer().nullable()();
  IntColumn get color => integer().nullable()();
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}


@DriftDatabase(tables: [Note])
class AppDatabase  extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => 1 ;

  //get all notes from database
  Future<List<NoteData>> getNoteList()  async =>  await select(note).get();

  //insert note to database
  Future<int> insertNote(NoteCompanion noteCompanion) async => await into(note).insert(noteCompanion);

  //delete note from database
  Future<int> deleteNote(int id) async => await (delete(note)..where((t) => t.id.equals(id))).go();

  //update note in database
  Future<bool> updateNote(NoteData noteData) async => await update(note).replace(noteData);
  

  
}


