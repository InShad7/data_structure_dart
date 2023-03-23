class Graph {
  Map<int, List<int>> map = {};

  insertVertex(int vertex) {
    map[vertex] = [];
  }

  insertEdge(int vertex1, int vertex2) {
    map[vertex1]?.add(vertex2);
    // map[vertex2]?.add(vertex1);
  }

  getVertices() {
    print(map.keys.toList());
  }

  getNeighbour(int vertex) {
    print(map[vertex]?.toList());
  }

  void bfs(int start) {
    var visited = List.filled(map.length, false);
    List<int> arr = [];

    visited[start] = true;
    arr.add(start);
   

    while (arr.isNotEmpty) {
      var vertex = arr.removeAt(0);
      print(vertex);

      for (var adj in map[vertex]!) {
        if (!visited[adj]) {
          visited[adj] = true;
          arr.add(adj);
          
        }
      }
    }
  }

  void DFS(int start) {
    var visited = List.filled(map.length, false);
    helper(start, visited);
  }

  helper(int start, visited) {
    visited[start] = true;
    print(start);

    for (var adj in map[start]!) {
      if (!visited[adj]) {
        visited[adj] = true;
        helper(adj, visited);
      }
    }
  }

  bool isCyclic() {
    Set<int> visited = Set();
    Set<int> recall = Set();

    for (int i = 0; i < map.length; i++) {
      if (isCyclicHelper(i, visited, recall)) {
        return true;
      }
    }
    return false;
  }

  bool isCyclicHelper(vertex, visited, recall) {
    visited.add(vertex);
    recall.add(vertex);

    for (int adj in map[vertex]!) {
      if (!visited.contains(adj)) {
        if (isCyclicHelper(adj, visited, recall)) {
          return true;
        }
      } else if (recall.contains(adj)) {
        return true;
      }
    }
    recall.remove(vertex);
    return false;
  }
}

void main() {
  Graph graph = Graph();

  graph.insertVertex(0);
  graph.insertVertex(1);
  graph.insertVertex(2);
  graph.insertVertex(3);
  graph.insertVertex(4);
  graph.insertVertex(5);
  graph.insertVertex(6);
  // graph.insertEdge(0, 1);
  // graph.insertEdge(0, 2);
  // graph.insertEdge(1, 3);
  // graph.insertEdge(1, 4);
  // graph.insertEdge(2, 5);
  // graph.insertEdge(2, 6);
  // graph.insertEdge(3, 4);

  graph.insertEdge(0, 1);
  graph.insertEdge(1, 2);
  graph.insertEdge(2, 0);
  graph.insertEdge(2, 3);

  graph.getVertices();
  graph.getNeighbour(4);

  print("bfs");
  graph.bfs(0);
  print('dfs');
  graph.DFS(0);

  if (graph.isCyclic()) {
    print("The graph is cyclic");
  } else {
    print("The graph is not cyclic");
  }
}
