import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_web/sembast_web.dart';

typedef MapStoreRef = StoreRef<String, Map<String, dynamic>>;

class AcmeDatabase {
  final Completer<Database> _database = Completer();
  final String _dbName = 'notes_app-db.acme';

  void init() => _database.complete(_openDatabase());

  MapStoreRef store(String name) {
    return stringMapStoreFactory.store(name);
  }

  Future<void> update({
    required MapStoreRef store,
    required Map<String, dynamic> value,
    required String key,
  }) async {
    await store.record(key).put(await _db, value, merge: true);
  }

  Future<bool> upsert({
    required MapStoreRef store,
    required String key,
    required Map<String, dynamic> value,
    bool merge = false,
  }) async {
    final recordRef = store.record(key);

    if (!merge && await recordRef.exists(await _db)) return false;

    await recordRef.put(await _db, value, merge: merge);
    return true;
  }

  Future<List<Map<String, dynamic>>> findAll({required MapStoreRef store}) async {
    final records = await store.find(await _db);

    return records.map((r) => {'key' : r.key, 'value' : r.value,}).toList(growable: false);
  }

  Future<List<Map<String, dynamic>>> findValues({
    required MapStoreRef store,
    String? filterKey,
    String? filterValue,
  }) async {
    final hasFilter = filterKey != null && filterValue != null;
    assert(
      filterKey == null && filterValue == null || hasFilter,
      'filterKey and filterValue must be not null if either is not null',
    );

    final records = await store.find(
      await _db,
      finder: Finder(
        filter: hasFilter ? Filter.equals(filterKey, filterValue) : null,
      ),
    );

    return records.map((r) => r.value).toList(growable: false);
  }

  Future<Map<String, dynamic>?> findFirst({
    required MapStoreRef store,
    required String key,
  }) async {
    final records = await store.findFirst(
      await _db,
      finder: Finder(filter: Filter.byKey(key)),
    );

    return records?.value;
  }

  Future<void> drop() async {
    final storeNames = [
      'notes_store',
    ];

    for (final storeName in storeNames) {
      await store(storeName).drop(await _db);
    }
  }

  Future<Database> get _db => _database.future;

  Future<Database> _openDatabase() async {
    if (kIsWeb) return databaseFactoryWeb.openDatabase(_dbName);

    final dbPath = join(await _applicationSupportDir, _dbName);
    return databaseFactoryIo.openDatabase(dbPath, version: 1);
  }

  Future<String> get _applicationSupportDir async {
    try {
      return (await getApplicationSupportDirectory()).path;
    } catch (e) {
      return (await getApplicationDocumentsDirectory()).path;
    }
  }
}
