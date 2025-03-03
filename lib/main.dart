import 'package:flutter/material.dart';
import 'package:counter/extensions/context_extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final counterProvider = StateProvider<int>((ref) => 10);
// --------------------------------------------------------------
// final counterProvider = Provider<int>((ref) => 10);
// --------------------------------------------------------------
// class CounterNotifier extends StateNotifier<int> {
//   CounterNotifier() : super(10);
//   void increment() => state++;
//   void decrement() => state--;
// }

// final counterNotifierProvider = StateNotifierProvider<CounterNotifier, int>(
//   (ref) => CounterNotifier(),
// );

// --------------------------------------------------------------

class Task {
  final String taskName;
  final bool isCompleted;
  final DateTime dueDate;

  Task({
    required this.taskName,
    required this.isCompleted,
    required this.dueDate,
  });

  Task ourconstructor({
    String? taskName,
    bool? isCompleted,
    DateTime? dueDate,
  }) {
    return Task(
      taskName: taskName ?? this.taskName,
      isCompleted: isCompleted ?? this.isCompleted,
      dueDate: dueDate ?? this.dueDate,
    );
  }
}

class TaskNotifier extends StateNotifier<Task> {
  TaskNotifier()
    : super(
        Task(taskName: "Задача 1", isCompleted: false, dueDate: DateTime(2025)),
      );

  void updateTask(String taskName) {
    state = state.ourconstructor(taskName: taskName);
  }

  void updateCompleteStatus(bool isCompleted) {
    state = state.ourconstructor(isCompleted: isCompleted);
  }

  void updateDate(DateTime dueDate) {
    state = state.ourconstructor(dueDate: dueDate);
  }
}

final taskNotifierProvider = StateNotifierProvider<TaskNotifier, Task>((ref) {
  return TaskNotifier();
});

void main() {
  runApp(ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final task = ref.watch(taskNotifierProvider);

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: context.getWidthPerc(0.5),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text("Количество нажатий:", style: TextStyle(fontSize: 15)),
              SizedBox(height: 30),
              Text("${task.dueDate}", style: TextStyle(fontSize: 25)),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => ref.read(taskNotifierProvider.notifier).updateDate(DateTime.now()),
                child: Text("Увеличить", style: TextStyle(fontSize: 15)),
              ),

              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
