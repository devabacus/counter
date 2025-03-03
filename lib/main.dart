import 'package:flutter/material.dart';
import 'package:counter/extensions/context_extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider<int>((ref) {
  return 0;
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
    final counter = ref.watch(counterProvider);

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: context.getWidthPerc(0.5),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text("Количество нажатий:", style: TextStyle(fontSize: 15)),
              SizedBox(height: 30),
              Text('$counter', style: TextStyle(fontSize: 25)),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => ref.read(counterProvider.notifier).state++,
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
