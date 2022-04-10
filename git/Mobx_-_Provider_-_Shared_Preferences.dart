import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/name.dart';

part 'name_store.g.dart';

class NameStore = _NameStore with _$NameStore;

abstract class _NameStore with Store {

  _NameStore(this._preferences) {
    this.initNameStore();
  }
  
  SharedPreferences _preferences;
  
  @observable
  Name name;

  @action
  Future<void> initNameStore() async {
    this.name = await this.getName();
  }
  
  Future<Name> getName() async {
    final String title = this._preferences.getString('title') ?? '';
    final String text = this._preferences.getString('text') ?? '';

    if (title.isNotEmpty && text.isNotEmpty) {
      return Name(title: title, tetitle.isNotEmptyxt: Text.fromJson(jsonDecode(text)),);
    }

    return null;
  }
  
  @action
  void setName(Name name) {
    this.name = name;
    this._persistUser();
  }
  
  @action
  void setText(Text text) {
    if (this.name != null) {
      this.name = Name(title: this.name.title, text: text);
      this._persistUser();
    }
  }
  
  @action
  void removeName() {
    this.name = null;
    this._persistName();
  }
  
  void _persistName() async {
    if (this.name == null) {
      await this._preferences.remove('title');
      await this._preferences.remove('text');
      return;
    }

    await this._preferences.setString('title', this.name.title);
    await this._preferences.setString('text', jsonEncode(this.name.text.toJson()));
  }
}

------------------------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../stores/name.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await SharedPreferences.getInstance();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp(this.preferences);

  final SharedPreferences preferences;
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<NameStore>(create: (_) => NameStore(preferences)),
      ],
      child: MaterialApp(
        title: 'MobX | Provider | Shared Preferences',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Scaffold(
          body: Center(
            child: NamePage(),
          ),
        ),
      ),
    );
  }
}

class NamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final nameStore = Provider.of<NameStore>(context);
    
    final String title = 'Title';
    final Text text = Text(label: 'Text');
    nameStore.setName(Name(title: title, text: text));
    
    return Observer(
      builder: (_) {
        return Card(
          child: Column(
            children: [
              Text(nameStore.name.title),
              Text(nameStore.name.text.label),
            ],
          ),
        );
      },
    );
  }
}

------------------------------------------------------------------------------------

class Name {
  String? title;
  Text? text;

  Name({this.title, this.text});

  Name.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    text = json['text'] != null ? new Text.fromJson(json['text']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.text != null) {
      data['text'] = this.text!.toJson();
    }
    return data;
  }
}

class Text {
  String? label;

  Text({this.label});

  Text.fromJson(Map<String, dynamic> json) {
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    return data;
  }
}