import 'package:floor/floor.dart';

import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:the_obelisk/feature/data/datasource/local/DAO/article_dao.dart';
import 'package:the_obelisk/feature/data/datasource/local/DAO/source_dao.dart';
import 'dart:async';

import 'package:the_obelisk/feature/data/model/article_model.dart';
import 'package:the_obelisk/feature/data/model/source_model.dart';
part 'app_database.g.dart';

@Database(version: 1, entities: [ArticleModel, SourceModel])
abstract class AppDatabase extends FloorDatabase {
  ArticleDao get articleDAO;
  SourceDao get sourceDao;
}
