import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Number Counter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List<List<Color>> colors = [
    [Colors.purple, Colors.white, Colors.deepPurple],
    [Colors.purpleAccent, Colors.white, Colors.deepPurpleAccent]
  ];

  List<Color> _currColor = [Colors.purple, Colors.white, Colors.deepPurple];

  @override
  void initState() {
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      _currColor = colors[_counter % 2];
    });
  }

  void _decrementCounter() {
      setState(() {
        _counter--;
        _currColor = colors[_counter % 2];
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          // color: Colors.lightBlueAccent,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              // colors: [Colors.purple, Colors.white, Colors.purpleAccent],
              colors: _currColor,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('You have pushed the button this many times:'),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _decrementCounter, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purpleAccent,
                      foregroundColor: Colors.purple,
                      minimumSize: Size(70, 60)
                    ),
                    child: const Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 40,
                      )
                    ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: _incrementCounter, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.purpleAccent,
                      minimumSize: Size(70, 60)
                    ),
                    child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                ]
              ),
              SizedBox(height: 20,),
              Text("Made by Jeffrey F H - 2702221936")
            ],
          ),
        )
        
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "icrBtn",
            onPressed: _incrementCounter,
            child: Icon(Icons.add),
            ),
          SizedBox(height: 20),
          FloatingActionButton(
            heroTag: "dcrBtn",
            onPressed: _decrementCounter,
            child: Icon(Icons.remove),
            )
          // TextButton(onPressed: _decrementCounter, child: const Icon(Icons.add)),
          // TextButton(onPressed: _incrementCounter, child: const Icon(Icons.remove))
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       TextButton(onPressed: _decrementCounter, child: const Icon(Icons.add)),
      //       TextButton(onPressed: _incrementCounter, child: const Icon(Icons.remove))
      //     ],
      //   ),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
