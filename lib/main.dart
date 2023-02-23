import 'package:flutter/material.dart';
import 'package:my_provider/models/counter_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class CounterModel extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ChangeNotifierProvider<CounterModel>(
        create: (_) => CounterModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Flutter Demo Home Page'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                CounterText(),
                ChangeNotifierProvider(
                  create: (_) => Counter(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      TextWidgetA(),
                      TextWidgetB(),
                      TextWidgetC(),
                      ButtonWidgetA(),
                      ButtonWidgetB(),
                      ButtonWidgetC()
                    ],
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: Consumer<CounterModel>(builder: (_, model, __) {
            return FloatingActionButton(
              onPressed: model.increment,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            );
          }), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      Provider.of<CounterModel>(context).count.toString(),
      style: Theme.of(context).textTheme.displaySmall,
    );
  }
}

class TextWidgetA extends StatelessWidget {
  const TextWidgetA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Built TextWidgetA');

    return Center(
        child: Text('Counter A: ${context.watch<Counter>().countA}',
            style: const TextStyle(fontSize: 20)));
  }
}

class TextWidgetB extends StatelessWidget {
  const TextWidgetB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Built TextWidgetB');

    return Center(
        child: Text('Counter B: ${context.read<Counter>().countB}',
            style: const TextStyle(fontSize: 20)));
  }
}

class TextWidgetC extends StatelessWidget {
  const TextWidgetC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Built TextWidgetC');

    return Center(
        child: Text(
            'Counter C: ${context.select((Counter counter) => counter.countC)}',
            style: const TextStyle(fontSize: 20)));
  }
}

class ButtonWidgetA extends StatelessWidget {
  const ButtonWidgetA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
            onPressed: () {
              context.read<Counter>().incrementCounterA();
            },
            child: const Text('Increment Count A',
                style: TextStyle(fontSize: 20))));
  }
}

class ButtonWidgetB extends StatelessWidget {
  const ButtonWidgetB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
            onPressed: () {
              context.read<Counter>().incrementCounterB();
            },
            child: const Text('Increment Count B',
                style: TextStyle(fontSize: 20))));
  }
}

class ButtonWidgetC extends StatelessWidget {
  const ButtonWidgetC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Built ButtonWidgetC');

    return Center(
        child: ElevatedButton(
            onPressed: () {
              context.read<Counter>().incrementCounterC();
            },
            child: const Text('Increment Count C',
                style: TextStyle(fontSize: 20))));
  }
}
