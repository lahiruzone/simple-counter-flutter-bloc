import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: BlocProvider(
          create: (BuildContext context) => CounterBloc(),
          child: CounterScreen(),
        ),
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counterBloc = BlocProvider.of<CounterBloc>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BlocBuilder<CounterBloc, int>(builder: (BuildContext context, int state) {
            return Text(
              "Counter Valu : $state",
              style: TextStyle(fontSize: 30),
            );
          }),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  _counterBloc.add(CounterEvents.Increment);
                },
                child: Text('Increment'),
              ),
              RaisedButton(
                onPressed: () {
                  _counterBloc.add(CounterEvents.Decrement);
                },
                child: Text('Decrement'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
