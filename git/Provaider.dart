return Provider(
  create: (_) => Name(),
  child: Container(),
);

return MultiProvider(
  providers: [
    Provider<Name>(create: (_) => Name()),
    Provider<Text>(create: (_) => Text()),
  ],
  child: Container(),
);

return ChangeNotifierProvider(
  create: (_) => Name(),
  child: Container(),
);

------------------------------------------------------------------------------------

// Obter Provider
final name = Provider.of<Name>(context);

//  Observa e exibe o nome
Text('${context.watch<Name>().title}'),

// Função para mundar o nome
ElevatedButton(
  child: const Text('Switch Name'),
  onPressed: () => context.read<Name>().switch()
),

class Name with ChangeNotifier {
  String title = 'Old Title';

  String get title => _title;

  void switch() {
    _title = 'New Title';
    notifyListeners();
  }
}