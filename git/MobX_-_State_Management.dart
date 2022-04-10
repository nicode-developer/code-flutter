Gerenciamento de Estado

------------------------------------------------------------------------------------

dependencies:
  mobx:
  flutter_mobx:

dev_dependencies:
  mobx_codegen:
  build_runner:

------------------------------------------------------------------------------------

Observer(
  builder: (_) {
    return Container();
  },
)

------------------------------------------------------------------------------------

// import 'stores/name_store.dart';

part 'name_store.g.dart';

class NameStore = _NameStore with _$NameStore;

abstract class _NameStore with Store {

// _NameStore() {}

  @observable

  @action

  @computed

}

------------------------------------------------------------------------------------

flutter packages pub run build_runner build

------------------------------------------------------------------------------------

https://medium.com/flutter-community/handling-api-calls-using-mobx-in-flutter-a355cf91605c

------------------------------------------------------------------------------------

https://kheronn-machado.medium.com/covid19-api-com-flutter-mobx-e-modular-parte-1-619cc343a3b1
https://kheronn-machado.medium.com/covid19-api-com-flutter-mobx-e-modular-parte-2-e50555e20c87

------------------------------------------------------------------------------------