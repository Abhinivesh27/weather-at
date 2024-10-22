import 'dart:developer';

import 'package:bloc_learn/todo/bloc/todo_event.dart';
import 'package:bloc_learn/todo/bloc/todo_state.dart';
import 'package:bloc_learn/todo/data/todo_model.dart';
import 'package:bloc_learn/todo/data/todo_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  List<Todo> _todos = [];

  TodoBloc() : super(InitialTodoState()) {
    on<LoadTodoEvent>((event, emit) async {
      emit(TodoLoadingState());
      _todos = TodoRepo.todos;
      await Future.delayed(Duration(seconds: 1));
      emit(LoadedTodoState(todos: _todos));
    });

    on<AddTodoEvent>((event, emit) {
      emit(TodoLoadingState());
      _todos.add(event.todo);
      emit(LoadedTodoState(todos: _todos));
    });
  }
}


