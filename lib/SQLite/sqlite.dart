import 'package:jewellry_shop/jsonModels/order.dart';
import 'package:jewellry_shop/jsonModels/users.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelper {
  final databaseName = "jewellery.db";

  String users =
      "CREATE TABLE users (usrId INTEGER PRIMARY KEY AUTOINCREMENT, usrName TEXT, usrSurname TEXT, usrEmail TEXT UNIQUE, usrPassword TEXT)";

  String orders =
      "CREATE TABLE orders (orderId INTEGER PRIMARY KEY AUTOINCREMENT, itemName TEXT, price REAL, size TEXT, quantity INTEGER)";

  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(users);
      await db.execute(orders);
    });
  }

  Future<bool> login(Users user) async {
    final Database db = await initDB();
    var result = await db.rawQuery(
        "select * from users where usrEmail = '${user.usrEmail}' AND usrPassword = '${user.usrPassword}'");
    if (result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<int> signup(Users user) async {
    final Database db = await initDB();

    return db.insert('users', user.toMap());
  }

  Future<String?> getUsername() async {
    final Database db = await initDB();
    var result = await db.query('users',
        columns: ['usrName'], where: 'usrId = ?', whereArgs: [1]);

    if (result.isNotEmpty) {
      return result.first['usrName'] as String?;
    } else {
      return null;
    }
  }

  Future<Map<String, String?>> getUserData() async {
    final Database db = await initDB();
    var result = await db.query('users',
        columns: ['usrName', 'usrSurname'],
        where: 'usrId = ?',
        whereArgs: [1]);

    if (result.isNotEmpty) {
      return {
        'usrName': result.first['usrName'] as String?,
        'usrSurname': result.first['usrSurname'] as String?,
      };
    } else {
      return {
        'usrName': null,
        'usrSurname': null,
      };
    }
  }

  Future<int> addOrder(Order order) async {
    final db = await initDB();
    return db.insert('orders', order.toMap());
  }

  Future<List<Order>> getOrders() async {
    final db = await initDB();
    final List<Map<String, dynamic>> maps = await db.query('orders');
    return List.generate(maps.length, (i) {
      return Order(
        orderId: maps[i]['orderId'],
        itemName: maps[i]['itemName'],
        price: maps[i]['price'],
        size: maps[i]['size'],
        quantity: maps[i]['quantity'],
      );
    });
  }
}
