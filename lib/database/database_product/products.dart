import 'package:marakzia_task/model/products_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._internal();
  DatabaseService._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final path = await getDatabasesPath();
    return openDatabase(
      join(path, 'products.db'),
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE products(
            id INTEGER PRIMARY KEY,
            title TEXT,
            description TEXT,
            thumbnail TEXT,
            price REAL,
            category TEXT,
            rating REAL
          )
        ''');
      },
      version: 1,
    );
  }

  Future<void> saveProducts(List<Product> products) async {
    final db = await database;
    await db.transaction((txn) async {
      for (var product in products) {
        await txn.insert('products', {
          'id': product.id,
          'title': product.title,
          'description': product.description,
          'thumbnail': product.thumbnail,
          'price': product.price,
          'category': product.category,
          'rating': product.rating,
        });
      }
    });
  }
  Future<void> updateProducts(List<Product> products) async {
    final db = await database;
    await db.transaction((txn) async {
      for (var product in products) {
        await txn.update('products', {
          'id': product.id,
          'title': product.title,
          'description': product.description,
          'thumbnail': product.thumbnail,
          'price': product.price,
          'category': product.category,
          'rating': product.rating,
        });
      }
    });
  }

  Future<List<Product>> getProducts() async {
    final db = await database;
    final result = await db.query('products');
    return result.map((json) => Product.fromJson(json)).toList();
  }
}
