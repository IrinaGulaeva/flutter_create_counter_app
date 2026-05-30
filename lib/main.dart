import 'package:flutter/material.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _counter = 0;
  int _previousCounter = 0;

  void _increaseCounter() {
    if (_counter < 10) {
      setState(() {
        _previousCounter = _counter;
        _counter++;
      });
    }
  }

  void _decreaseCounter() {
    if (_counter > -10) {
      setState(() {
        _previousCounter = _counter;
        _counter--;
      });
    }
  }

  void _resetCounter() {
    setState(() {
      _previousCounter = _counter;
      _counter = 0;
    });
  }

  Color _getCounterColor() {
    if (_counter > 0) {
      return Colors.green;
    } else if (_counter < 0) {
      return Colors.red;
    } else {
      return Colors.blue;
    }
  }

  String _getMessage() {
    if (_counter == 10) {
      return 'Достигнут максимум: 10';
    } else if (_counter == -10) {
      return 'Достигнут минимум: -10';
    } else if (_counter > 0) {
      return 'Счётчик больше нуля';
    } else if (_counter < 0) {
      return 'Счётчик меньше нуля';
    } else {
      return 'Счётчик равен нулю';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Счётчик с настройками'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$_counter',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: _getCounterColor(),
                ),
              ),

              const SizedBox(height: 15),

              Text(
                _getMessage(),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 15),

              Text(
                'Предыдущее значение: $_previousCounter',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _increaseCounter,
                    child: const Text('+1'),
                  ),

                  const SizedBox(width: 10),

                  ElevatedButton(
                    onPressed: _decreaseCounter,
                    child: const Text('-1'),
                  ),

                  const SizedBox(width: 10),

                  ElevatedButton(
                    onPressed: _resetCounter,
                    child: const Text('Сброс'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}