import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
part 'recent_searched_state.dart';

class RecentSearchedCubit extends Cubit<RecentSearchedState> {
  RecentSearchedCubit() : super(RecentSearchedInitial());

  List<Map> searchedItems=[];




  late  Database DB;

  createTable() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'RecentSearched.db');
    print(path);
    openDatabase(path,
        version: 2,
        onCreate: (database, version)
        {

          // table Tasks
          database.execute('CREATE TABLE Notes(id INTEGER PRIMARY KEY,title TEXT)')
              .then((value) {
            print('table created');
          }).catchError((error){
            print('Table Don\'t Created');
          });
        },
        onOpen: (database){
          getDB(database);
          print('Table Opened');
        }
    ).then((value) {
      DB=value;
      emit(appcreatedatabasestate());
    });
  }

  insertData({required String title})async{
    await DB.transaction((txn) {
      return     txn.rawInsert('INSERT INTO Notes(title) VALUES("$title")')
          .then((value) {
        print('inserted $value');
        emit(appinsertdatabasestate());
        getDB(DB);
      })
          .catchError((error){
        print('error occure ');
      });
    }

    );
  }

  getDB(database)async{
    searchedItems=[];
    await database.rawQuery('SELECT * FROM Notes').then((value) {
      value.forEach((element)
      {
        searchedItems.add(element);
        print(searchedItems);

      });


      emit(appgetdatabasestate());
    });
  }


  upDB({required String title,required int id})
  async{

    await DB.rawUpdate( 'UPDATE Notes SET title= ?  WHERE id = ?',
        ['$title', id, ]);

    getDB(DB);


    emit(appupdatedatabasestate());

  }



  deleteDB({required int id})async{
    //await DB.rawDelete("Delete * from Notes").then((value) => (value) {
    await DB.rawDelete('DELETE FROM Notes WHERE id = ?', ['$id']);
    getDB(DB);
    emit(appdeleteatabasestate());
  }



}
