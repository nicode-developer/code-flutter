import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widgets',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: mainPage,
      onGenerateRoute: RouteGenerator.generateRoute,
      /*home: const MainPage(),*/
    );
  }
}

const String mainPage = '/';
const String routePage = '/route';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case mainPage:
        return MaterialPageRoute(builder: (_) => const MainPage());
      case routePage:
        if (args is String) {
          return MaterialPageRoute(builder: (_) => RoutePage(text: args));
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text('This route name does not exist.'),
        ),
      );
    });
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState
    extends State<MainPage> /*with SingleTickerProviderStateMixin*/ {
  /*late TabController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }*/

  int _pageIndex = 0;
  final List<Widget> _pageList = const [
    HomePage(),
    SearchPage(),
    NotificationsPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Welcome"),
          actions: [
            PopupMenuButton(
              icon: const Icon(Icons.more_horiz),
              enabled: true,
              onSelected: (value) {
                if (value == "first") {
                  print("");
                }
                if (value == "second") {
                  print("");
                }
              },
              itemBuilder: (context) => const [
                PopupMenuItem(
                  child: Text("First"),
                  value: "first",
                ),
                PopupMenuItem(
                  child: Text("Second"),
                  value: "second",
                ),
              ],
            )
          ],
          /*bottom: tabBar(),*/
        ),
        body:
            const FormPage() /*tabBarView()*/ /*ListPage()*/ /*MapPage()*/ /*_pageList[_pageIndex]*/,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: onClick, //() => onClick()
        ),
        /*bottomNavigationBar: bottomNavigationBar(),*/
      ),
    );
  }

  void onClick() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Alert Dialog"),
          content: const SizedBox(height: 150),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Snack Bar"),
        action: SnackBarAction(
          textColor: Colors.white,
          label: "OK",
          onPressed: () {},
        ),
      ),
    );
  }

  TabBar tabBar() {
    return const TabBar(
      /*controller: _controller,*/
      tabs: [
        Tab(text: "Recommended"),
        Tab(text: "Favorites"),
      ],
    );
  }

  TabBarView tabBarView() {
    return const TabBarView(
      /*controller: _controller,*/
      children: [
        RecommendedPage(),
        FavoritesPage(),
      ],
    );
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _pageIndex,
      onTap: (value) {
        setState(() {
          _pageIndex = value;
        });
      },
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: "Notifications",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Settings",
        ),
      ],
    );
  }

  /*BottomAppBar bottomAppBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 4,
      child: SizedBox(
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: _pageIndex == 0 ? Colors.blue : Colors.grey,
                      ),
                      Text(
                        "Home",
                        style: TextStyle(
                          color: _pageIndex == 0 ? Colors.blue : Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        color: _pageIndex == 1 ? Colors.blue : Colors.grey,
                      ),
                      Text(
                        "Search",
                        style: TextStyle(
                          color: _pageIndex == 1 ? Colors.blue : Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }*/
}

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  final _title = TextEditingController();
  final _text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextFormField(
              controller: _title,
              validator: (title) {
                if (title!.isEmpty) {
                  return "Enter Title...";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _text,
              validator: (text) {
                if (text!.isEmpty) {
                  return "Enter Text...";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 35,
              child: ElevatedButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  Navigator.of(context)
                      .pushNamed(routePage, arguments: "Route Page");
                },
                child: const Text("Confirme"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  int _currentIndex = 0;
  final _list = ["Home", "Search", "Notifications", "Settings"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _list.length,
      itemBuilder: (_, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _currentIndex = index;
            });
          },
          child: Card(
            child: Text(
              _list[index],
              style: TextStyle(
                  color:
                      _currentIndex == index ? Colors.black : Colors.black54),
            ),
          ),
        );
      },
    );
  }
}

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final _map = {
    "Screen": "Home",
  };

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(_map["Screen"]!),
    );
  }
}

class RoutePage extends StatelessWidget {
  final String? text;

  const RoutePage({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text!));
  }
}

// -------------------------------------------------------------------------- //

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Home Page"));
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Search Page"));
  }
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Notifications Page"));
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Settings Page"));
  }
}

class RecommendedPage extends StatelessWidget {
  const RecommendedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Recommended Page"));
  }
}

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Favorites Page"));
  }
}

// -------------------------------------------------------------------------- //