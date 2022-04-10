import 'package:mobx/mobx.dart';
import '../services/name_service.dart';
import '../models/name.dart';

part 'name_store.g.dart';

class NameStore = _NameStore with _$NameStore;

abstract class _NameStore with Store {
  final NameService nameService = NameService();

  @observable
  ObservableFuture<List<Name>> nameListFuture;

  @action
  Future fetchNames() => nameListFuture = ObservableFuture(nameService
          .getData(id: '1')
          .then((names) => names));


  void initNames() {
    fetchNames();
  }
}

------------------------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../models/name.dart';
import '../stores/name_store.dart';

class NamePage extends StatelessWidget {
  NameStore store = NameStore();

  NamePage() {
    store.initNames();
  }

  @override
  Widget build(BuildContext context) {
    final future = store.nameListFuture;
    return Observer(
      builder: (_) {
        switch (future.status) {
          case FutureStatus.pending:
            return Center(
              child: CircularProgressIndicator(),
            );
          case FutureStatus.fulfilled:
            final List<Name> names = future.result;
            print(names);
            return RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.builder(
                /*physics: const AlwaysScrollableScrollPhysics(),*/
                itemCount: names.length,
                itemBuilder: (_, index) {
                  final name = names[index];
                  return Card(
                    child: Text(name.title!),
                  );
                },
              ),
            );
          case FutureStatus.rejected:
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Failed to load names.',
                    style: TextStyle(color: Colors.red),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    child: const Text('Tap to retry'),
                    onPressed: _refresh,
                  )
                ],
              ),
            );
            break;
        }
      },
    );
  }

  Future _refresh() => store.fetchNames();
}

------------------------------------------------------------------------------------

class Name {
  String? title;

  Name({this.title});

  Name.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    return data;
  }
}