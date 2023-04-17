import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // winning num && random num
  int win_num = 0;
  Random random = Random();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home
      home: Scaffold(
        // app Bar
        appBar: AppBar(
          title: const Center(child: Text('Lottery App')),
        ),

        // body
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // text
              const Center(
                  child: Text(
                "Lottery Winning number is: 5",
                style: TextStyle(fontSize: 25),
              )),

              // spacing
              const SizedBox(height: 15,),

              // container part
              Container(
                height:250,
                width: 300,
                decoration: BoxDecoration(
                  color:win_num == 5 ? Colors.lightBlue.withOpacity(.3) : Colors.grey.withOpacity(.3),
                  borderRadius: BorderRadius.circular(15),
                ),


                child: Padding(
                  padding: const EdgeInsets.all(15.0),

                  // using ternary operator
                  child: win_num  == 5 ?

                  // success msg
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.done_all,
                        color: Colors.green,
                        size: 35,
                      ),

                      // spacing
                      const SizedBox(height: 15,),

                      Text(
                        'Congratulations. You have won the lottery. Your Number is $win_num.\n',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      )
                    ],
                  )
                      :
                  // error msg
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 35,
                      ),

                      // spacing
                      const SizedBox(height: 15,),

                      Text(
                        'Better luck next time. Your Number is $win_num.\nTry Again',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // floating button
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // print(random.nextInt(10).toString());
            win_num = random.nextInt(10);
            setState((){});
          },
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}
