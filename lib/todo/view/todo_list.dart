import 'dart:math';

import 'package:bloc_learn/todo/bloc/todo_event.dart';
import 'package:bloc_learn/todo/data/todo_model.dart';
import 'package:bloc_learn/todo/data/todo_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/todo_bloc.dart';
import '../bloc/todo_state.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Todo's"),
      ),
      body: Center(
        child: BlocConsumer<TodoBloc, TodoState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
           // BlocProvider.of<TodoBloc>(context).add(LoadTodoEvent());
            if (state is TodoLoadingState) {
              return CircularProgressIndicator();
            }

            if (state is LoadedTodoState) {
              return ListView.builder(
                itemCount: state.todos.length,
                itemBuilder: (context, i) => ListTile(
                  title: Text(state.todos[i].name),
                ),
              );
            }

            return Container();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<TodoBloc>(context).add(
            AddTodoEvent(
              todo: Todo()..name = sampleTodoList[getRandomNumber()],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

int getRandomNumber() {
  Random random = Random();
  return random.nextInt(10); // Generates a number between 0 and 9
}
