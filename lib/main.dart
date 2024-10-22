import 'package:bloc_learn/counter/home.dart';
import 'package:bloc_learn/todo/bloc/todo_bloc.dart';
import 'package:bloc_learn/todo/bloc/todo_event.dart';
import 'package:bloc_learn/todo/view/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc()..add(LoadTodoEvent()),
      child: MaterialApp(title: 'Material App', home: TodoListPage()),
    );
  }
}
