
import 'package:bloc_learn/counter/counter_bloc/counter_bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {

final counter = CounterBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learn BLoC"),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: counter.stream,
          builder: (context, snapshot) {
            return Text(
              snapshot.data.toString(),
              style: TextStyle(
                fontSize: 50,
              ),
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.add(incrementCounter());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
