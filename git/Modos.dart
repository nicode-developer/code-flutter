void main() {
  var model = API(
    titulo: "Título",
    mapa: Mapa(nome: "Mapa"),
    lista: ["Lista", "Outra Lista"],
    listaMapa: [ListaMapa(idade: "20"), ListaMapa(idade: "18")],
  );

  print(model);
}

------------------------------------------------------------------------------------

class API {
  String? titulo;
  Mapa? mapa;
  List<String>? lista;
  List<ListaMapa>? listaMapa;

  API({this.titulo, this.mapa, this.lista, this.listaMapa});
}

class Mapa {
  String? nome;

  Mapa({this.nome});
}

class ListaMapa {
  String? idade;

  ListaMapa({this.idade});
}
