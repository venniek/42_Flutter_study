import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Fluent Gauge'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _currentSliderValue = 0.0;
  final maxValue = 150.0;
  final minValue = 0.0;

  void axisLabelCreated(AxisLabelCreatedArgs args) {
    args.labelStyle = const GaugeTextStyle(color: Colors.white, fontSize: 12);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: false,
          backgroundColor: Colors.grey[700],
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                    onLabelCreated: axisLabelCreated,
                    majorTickStyle:
                        const MajorTickStyle(length: 10, color: Colors.white),
                    minorTickStyle:
                        const MinorTickStyle(length: 5, color: Colors.white),
                    minimum: minValue,
                    maximum: maxValue,
                    ranges: <GaugeRange>[
                      GaugeRange(
                          startValue: minValue,
                          endValue: 50,
                          color: Colors.green),
                      GaugeRange(
                          startValue: 50, endValue: 100, color: Colors.orange),
                      GaugeRange(
                          startValue: 100,
                          endValue: maxValue,
                          color: Colors.red)
                    ],
                    pointers: <GaugePointer>[
                      NeedlePointer(
                          value: _currentSliderValue,
                          needleColor: Colors.white,
                          knobStyle: const KnobStyle(color: Colors.white))
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                          widget: Text('$_currentSliderValue',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          angle: 90,
                          positionFactor: 0.5),
                    ])
              ],
            ),
            Slider(
              value: _currentSliderValue,
              max: maxValue,
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = double.parse(value.toStringAsFixed(1));
                });
              },
              activeColor: Colors.green,
              inactiveColor: const Color.fromARGB(51, 33, 149, 243),
              thumbColor: Colors.green,
            )
          ],
        )));
  }
}
