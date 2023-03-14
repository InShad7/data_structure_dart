class HashTable {
  List<List<Entry>>? table;
  int? size;

  HashTable(int size) {
    this.size = size;
    table = List<List<Entry>>.filled(size, [], growable: false);
  }

  int _hash(String key) {
    return key.codeUnits.fold(0, (a, v) => a + v) % size!;
  }

  void put(String key, dynamic value) {
    int index = _hash(key);
    // if (table![index] == null) {
    //   table![index] = [];
    // }
    for (Entry entry in table![index]) {
      if (entry.key == key) {
        entry.value = value;
        return;
      }
    }
    table![index].add(Entry(key, value));
  }

  dynamic get(String key) {
    int index = _hash(key);
    // if (table![index] != null) {
    for (Entry entry in table![index]) {
      if (entry.key == key) {
        return entry.value;
      }
    }
    // }
    return null;
  }
}

class Entry {
  String key;
  dynamic value;

  Entry(this.key, this.value);
}

void main() {
  HashTable hashTable = HashTable(5);
  hashTable.put("key1", "value1");
  hashTable.put("key2", "value2");
  hashTable.put("key3", "value3");
  print(hashTable.get("key1"));
  print(hashTable.get("key2"));
  print(hashTable.get("key3"));
  hashTable.put("key1", "newvalue1");
  print(hashTable.get("key1"));
}
