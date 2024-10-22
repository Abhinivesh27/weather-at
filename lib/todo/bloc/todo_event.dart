import '../data/todo_model.dart';

sealed class TodoEvent {}

final class AddTodoEvent extends TodoEvent {
  final Todo todo;

  AddTodoEvent({required this.todo});
}

final class LoadTodoEvent extends TodoEvent {}

final class DeleteTodoEvent extends TodoEvent {}
