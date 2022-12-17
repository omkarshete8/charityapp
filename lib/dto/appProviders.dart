import 'package:flutter_riverpod/flutter_riverpod.dart';

final dataStateProvider1 = StateNotifierProvider<DataNotifier1, List>((ref) {
  return DataNotifier1();
});

class DataNotifier1 extends StateNotifier<List<List<int>>> {
  DataNotifier1() : super([]);

  List<List<int>> get completeData => state;

  addData(List<int> data) => state = [...state, data];
  removeData(int index) => state.removeAt(index);
}

final dataStateProvider2 = StateNotifierProvider<DataNotifier2, List>((ref) {
  return DataNotifier2();
});

class DataNotifier2 extends StateNotifier<List<List<int>>> {
  DataNotifier2() : super([]);

  List<List<int>> get completeData => state;

  addData(List<int> data) => state = [...state, data];
  removeData(int index) => state.removeAt(index);
}

final dataStateProvider3 = StateNotifierProvider<DataNotifier3, List>((ref) {
  return DataNotifier3();
});

class DataNotifier3 extends StateNotifier<List<List<int>>> {
  DataNotifier3() : super([]);

  List<List<int>> get completeData => state;

  addData(List<int> data) => state = [...state, data];
  removeData(int index) => state.removeAt(index);
}

final dataStateProvider4 = StateNotifierProvider<DataNotifier4, List>((ref) {
  return DataNotifier4();
});

class DataNotifier4 extends StateNotifier<List<List<int>>> {
  DataNotifier4() : super([]);

  List<List<int>> get completeData => state;

  addData(List<int> data) => state = [...state, data];
  removeData(int index) => state.removeAt(index);
}
