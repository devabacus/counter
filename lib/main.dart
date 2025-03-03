import 'package:flutter/material.dart';
import 'package:counter/extensions/context_extensions.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var counter = 0;

  void _incrementer() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                onPressed: _incrementer,
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
