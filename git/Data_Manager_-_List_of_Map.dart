import '../models/name.dart';
import '../utils/data_manager.dart';

// MobX: ObservableList<Name> nameList = ObservableList<Name>();
List<Name> nameList = [];

// MobX: @action
void saveData() {
  List<Map<String, dynamic>> data = [];
  for (Name names in nameList) {
    data.add(todo.toJson());
  }
  DataManager.saveData(data);
}

// MobX: @action
void readData() {
  DataManager.readData().then((data) {
    for (Map<String, dynamic> names in data!) {
      nameList.add(Name.fromJson(names));
    }
  });
}
