class TrieNode {
  final Map<String, TrieNode> children = {};
  bool isEndOfWord = false;
}

class Trie {
  TrieNode root = TrieNode();

  void insert(String word) {
    TrieNode node = root;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];

      if (!node.children.containsKey(char)) {
        node.children[char] = TrieNode();
      }
      node = node.children[char]!;
    }
    node.isEndOfWord = true;
  }

  bool search(String word) {
    TrieNode node = root;

    for (int i = 0; i < word.length; i++) {
      String char = word[i];

      if (!node.children.containsKey(char)) {
        return false;
      }
      node = node.children[char]!;
    }
    return node.isEndOfWord;
  }

  void traverse(TrieNode node, String word) {
    if (node.isEndOfWord) {
      print(word);
    }
    node.children.forEach((key, value) {
      traverse(value, word + key);
    });
  }

  delete(String word) {
    return _delete(root, word, 0);
  }

  _delete(TrieNode node, String word, int index) {
    if (index == word.length) {
      if (!node.isEndOfWord) {
        return false;
      }
      node.isEndOfWord = false;
      return node.children.isEmpty;
    }
    String char = word[index];
    if (!node.children.containsKey(char)) {
      return false;
    }
    TrieNode child = node.children[char]!;
    bool del = _delete(child, word, index + 1);
    if (del) {
      node.children.remove(char);
      return node.children.isEmpty && !node.isEndOfWord;
    }
  }

  List<String> suggest(String word) {
    TrieNode pre = findPrefixNode(word);
    List<String> suggestion = [];

    _traverse(pre, word, suggestion);
    return suggestion;
  }

  TrieNode findPrefixNode(String word) {
    TrieNode node = root;

    for (int i = 0; i < word.length; i++) {
      String char = word[i];

      if (!node.children.containsKey(char)) {
        return node;
      }
      node = node.children[char]!;
    }
    return node;
  }

  void _traverse(TrieNode node, String word, List<String> suggestion) {
    if (node.isEndOfWord) {
      suggestion.add(word);
    }
    node.children.forEach((key, value) {
      _traverse(value, word+key, suggestion);
    });
  }
}

void main() {
  Trie trie = Trie();
  trie.insert("hello");
  trie.insert("hai");
  trie.insert("hey");
  trie.insert("world");
  // print(trie.search("hel"));
  // print(trie.search("world"));
  // print(trie.search("hi"));
  trie.traverse(trie.root, "");

  // print(" after delete");

  // print(trie.delete("world"));
  // print(trie.search("world"));

  final List<String> suggestions = trie.suggest('he');
  print(suggestions);
}
