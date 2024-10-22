import 'todo_model.dart';

class TodoRepo {
  static List<Todo> todos = [
    Todo()..createdAt=DateTime.now()..name="Off washing machine",
    Todo()..createdAt=DateTime.now()..name="Do mobile rechage",
  ];
}



List<String> sampleTodoList = [
  'Empty the dishwasher',
  'Wash the dishes',
  'Clean the refrigerator',
  'Mop the kitchen floor',
  'Organize the closet',
  'Dust the shelves',
  'Take out the trash',
  'Clean the bathroom',
  'Grocery shopping',
  'Prepare dinner',
];
