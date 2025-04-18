import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          centerTitle: true,
          backgroundColor: Colors.red,
          elevation: 20.0,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftNumber = 1;
  int rightNumber = 1;
  int totalNumber = 2;

  int getRandomNumber() {
    return Random().nextInt(6) + 1;
  }

  void updateTotalNumber() {
    totalNumber = leftNumber + rightNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Total: $totalNumber',
            style: TextStyle(color: Colors.red[100], fontSize: 18),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    child: Image.asset('images/dice$leftNumber.png'),
                    onPressed: () => {
                      // setState function will rerun the build function of the _DicePageState
                      setState(() {
                        leftNumber = getRandomNumber();
                        updateTotalNumber();
                      })
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    child: Image.asset('images/dice$rightNumber.png'),
                    onPressed: () => {
                      setState(() {
                        rightNumber = getRandomNumber();
                        updateTotalNumber();
                      })
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            onPressed: () => {
              setState(() {
                leftNumber = getRandomNumber();
                rightNumber = getRandomNumber();
                updateTotalNumber();
              })
            },
            child: Text(
              'Roll',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
