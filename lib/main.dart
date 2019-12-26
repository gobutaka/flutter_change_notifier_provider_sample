import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<Counter>(
        create: (_) => Counter(0),
        child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class Counter with ChangeNotifier {
  Counter(this._value);
  int _value;
  int get value => this._value;

  void increment() {
    _value++;
    notifyListeners();
  }

  void decrement() {
    _value--;
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CenterTextWidget(),
            CounterNumberWidget(),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          IncrementButtonWidget(),
          const SizedBox(height: 8),
          DecrementButtonWidget(),
        ]
      ),
    );
  }
}

class CenterTextWidget extends StatelessWidget {
  const CenterTextWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text('You have pushed the button this many times:');
  }
}

class CounterNumberWidget extends StatelessWidget {
  const CounterNumberWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // 値を受け取る
    final counter = Provider.of<Counter>(context);
    return Text(
      '${counter.value}',
      style: Theme.of(context).textTheme.display1,
    );
  }
}

class IncrementButtonWidget extends StatelessWidget {
  const IncrementButtonWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /*
      値を受け取る
      値の変化に応じて表示更新などの処理をする必要がないので、「listen: false」でnotifyListeners()によるリビルドを回避
    */
    final counter = Provider.of<Counter>(context, listen: false);
    return FloatingActionButton(
      onPressed: () => counter.increment(),
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );
  }
}

class DecrementButtonWidget extends StatelessWidget {
  const DecrementButtonWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /*
      値を受け取る
      値の変化に応じて表示更新などの処理をする必要がないので、「listen: false」でnotifyListeners()によるリビルドを回避
    */
    final counter = Provider.of<Counter>(context, listen: false);
    return FloatingActionButton(
      onPressed: () => counter.decrement(),
      tooltip: 'Decrement',
      child: Icon(Icons.remove),
    );
  }
}
