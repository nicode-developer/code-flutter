GetX

Navigator

------------------------------------------------------------------------------------

return MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (_) => MainPage(),
    '/route': (_) => RoutePage(text: args),
  },
);

onPressed: () {
  Navigator.pushNamed(context, '/route');
  
  Navigator.of(context).pushNamed('/route');
}