import 'package:bloc_learn/todo/data/todo_model.dart';

sealed class TodoState {}

final class InitialTodoState extends TodoState {}

final class TodoLoadingState extends TodoState {}

final class AddedTodoState extends TodoState {
  final List<Todo> todos;

  AddedTodoState({required this.todos});
}

final class LoadedTodoState extends TodoState {
  final List<Todo> todos;

  LoadedTodoState({required this.todos});
}

final class DeletedTodoState extends TodoState {}
