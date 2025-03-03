import 'package:flutter/material.dart';

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

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width*0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
        
            Text("Количество нажатий:", style: TextStyle(fontSize: 15)),
        
            ElevatedButton(
              onPressed: () {},
              child: Text("Увеличить", style: TextStyle(fontSize: 15)),
            ),
          ],
        ),
      ),
    );
  }
}
