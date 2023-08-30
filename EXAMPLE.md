# Example

``` dart
import 'package:custom_circular_progress/custom_circular_progress.dart';
import 'package:custom_circular_progress/utils.dart';
import 'package:custom_circular_progress/widgets/circular_progress.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Object _key = Object();

  double value = 0.5;
  int itemCount = 10;
  final TextEditingController _colorController =
      TextEditingController(text: '0xFFF44336');
  final TextEditingController _altColorController =
      TextEditingController(text: '0xFF000000');
  final TextEditingController _bgColorController =
      TextEditingController(text: '0xFF020424');
  double height = 20;
  double width = 20;
  double radius = 50;
  double unitBorderRadius = 0;
  Curve curve = Curves.easeOut;
  bool stopController = false;
  bool stopColorController = false;
  int animationSeconds = 4;
  int colorSeconds = 3;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SizedBox(
          height: 1200,
          width: 720,
          child: SingleChildScrollView(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  CustomCircularProgress(
                    key: ValueKey<Object>(_key),
                    details:
                        IndicatorDetails(value: value, itemCount: itemCount),
                    color: Color(int.parse(_colorController.text)),
                    alternativeColor:
                        Color(int.parse(_altColorController.text)),
                    backgroundColor: Color(int.parse(_bgColorController.text)),
                    unitSize: Size(width, height),
                    radius: radius,
                    unitBorderRadius: BorderRadius.circular(radius),
                    animationDuration: Duration(seconds: animationSeconds),
                    colorDuration: Duration(seconds: colorSeconds),
                    curve: curve,
                    stopController: stopController,
                    stopColorController: stopColorController,
                  ),
                  const SizedBox(height: 30),
                  MaterialButton(
                    onPressed: () {
                      stopController = !stopController;
                      _key = Object();
                      setState(() {});
                    },
                    child: Text(
                        stopController ? 'Start Animation' : 'Stop Animation'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      stopColorController = !stopColorController;
                      _key = Object();
                      setState(() {});
                    },
                    child: Text(stopColorController
                        ? 'Start Color Animation'
                        : 'Stop Color Animation'),
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 5),
                      const SizedBox(
                        width: 80,
                        child: Text('Progress', textScaleFactor: 1.1),
                      ),
                      SizedBox(
                        width: 280,
                        child: Slider(
                          value: value,
                          onChanged: (v) {},
                          onChangeEnd: (v) {
                            value = v;
                            _key = Object();
                            setState(() {});
                          },
                          label: '$value',
                          activeColor: Colors.blue,
                          divisions: itemCount * 10,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 5),
                      const SizedBox(
                        width: 80,
                        child: Text('Item count', textScaleFactor: 1.1),
                      ),
                      SizedBox(
                        width: 280,
                        child: Slider(
                          value: itemCount.toDouble(),
                          onChanged: (v) {},
                          onChangeEnd: (v) {
                            itemCount = v.toInt();
                            _key = Object();
                            setState(() {});
                          },
                          min: 1,
                          max: 100,
                          label: '$itemCount',
                          activeColor: Colors.blue,
                          divisions: 100,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 5),
                      const SizedBox(
                        width: 80,
                        child: Text('Color', textScaleFactor: 1.1),
                      ),
                      SizedBox(
                        width: 250,
                        child: TextField(
                          controller: _colorController,
                          onSubmitted: (v) {
                            _key = Object();
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 5),
                      const SizedBox(
                        width: 80,
                        child: Text('Alternate Color', textScaleFactor: 1.1),
                      ),
                      SizedBox(
                        width: 250,
                        child: TextField(
                          controller: _altColorController,
                          onSubmitted: (v) {
                            _key = Object();
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 5),
                      const SizedBox(
                        width: 80,
                        child: Text('Background Color', textScaleFactor: 1.1),
                      ),
                      SizedBox(
                        width: 250,
                        child: TextField(
                          controller: _bgColorController,
                          onSubmitted: (v) {
                            _key = Object();
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 5),
                      const SizedBox(
                        width: 80,
                        child: Text('Item height', textScaleFactor: 1.1),
                      ),
                      SizedBox(
                        width: 280,
                        child: Slider(
                          value: height,
                          onChanged: (v) {},
                          onChangeEnd: (v) {
                            height = v;
                            if (width == 0 && v == 0) {
                              unitBorderRadius = 0;
                            }
                            _key = Object();
                            setState(() {});
                          },
                          min: 0,
                          max: 200,
                          label: '$height',
                          activeColor: Colors.blue,
                          divisions: 200,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 5),
                      const SizedBox(
                        width: 80,
                        child: Text('Item width', textScaleFactor: 1.1),
                      ),
                      SizedBox(
                        width: 280,
                        child: Slider(
                          value: width,
                          onChanged: (v) {},
                          onChangeEnd: (v) {
                            width = v;
                            if (height == 0 && v == 0) {
                              unitBorderRadius = 0;
                            }
                            _key = Object();
                            setState(() {});
                          },
                          min: 0,
                          max: 200,
                          label: '$width',
                          activeColor: Colors.blue,
                          divisions: 200,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 5),
                      const SizedBox(
                        width: 80,
                        child: Text('Total radius', textScaleFactor: 1.1),
                      ),
                      SizedBox(
                        width: 280,
                        child: Slider(
                          value: radius,
                          onChanged: (v) {},
                          onChangeEnd: (v) {
                            radius = v;
                            _key = Object();
                            setState(() {});
                          },
                          min: 0,
                          max: 150,
                          label: '$radius',
                          activeColor: Colors.blue,
                          divisions: 300,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 5),
                      const SizedBox(
                        width: 80,
                        child: Text('Item radius', textScaleFactor: 1.1),
                      ),
                      SizedBox(
                        width: 280,
                        child: Slider(
                          value: unitBorderRadius,
                          onChanged: (v) {},
                          onChangeEnd: (v) {
                            unitBorderRadius = v;
                            setState(() {});
                            _key = Object();
                          },
                          min: 0,
                          max: 200,
                          label: '$unitBorderRadius',
                          activeColor: Colors.blue,
                          divisions: 200,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 5),
                      const SizedBox(
                        width: 80,
                        child:
                            Text('Animation in seconds', textScaleFactor: 1.1),
                      ),
                      SizedBox(
                        width: 280,
                        child: Slider(
                          value: animationSeconds.toDouble(),
                          onChanged: (v) {},
                          onChangeEnd: (v) {
                            animationSeconds = v.toInt();
                            _key = Object();
                            setState(() {});
                          },
                          min: 0,
                          max: 200,
                          label: '$animationSeconds',
                          activeColor: Colors.blue,
                          divisions: 200,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 5),
                      const SizedBox(
                        width: 80,
                        child: Text('Color transition in seconds',
                            textScaleFactor: 1.1),
                      ),
                      SizedBox(
                        width: 280,
                        child: Slider(
                          value: colorSeconds.toDouble(),
                          onChanged: (v) {},
                          onChangeEnd: (v) {
                            colorSeconds = v.toInt();
                            _key = Object();
                            setState(() {});
                          },
                          min: 0,
                          max: 50,
                          label: '$colorSeconds',
                          activeColor: Colors.blue,
                          divisions: 50,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```