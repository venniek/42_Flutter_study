import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

PreferredSize _buildAppBar(String title) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(50.0),
    child: AppBar(
      title: Text(title),
      centerTitle: false,
      backgroundColor: Colors.green,
    ),
  );
}

class BMIGaugePage extends StatelessWidget {
  const BMIGaugePage(this.height, this.weight, {Key? key}) : super(key: key);

  final double height;
  final double weight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar('BMI Result'),
      body: bmiGauge(height, weight),
    );
  }
}

Widget bmiGauge(height, weight) {
  const maxValue = 45.0;
  const minValue = 0.0;
  String value = (weight / (height * height) * 10000).toStringAsFixed(1);

  void axisLabelCreated(AxisLabelCreatedArgs args) {
    args.labelStyle = const GaugeTextStyle(color: Colors.black, fontSize: 12);
  }

  return Center(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SfRadialGauge(
        enableLoadingAnimation: true,
        animationDuration: 1500,
        axes: <RadialAxis>[
          RadialAxis(
              onLabelCreated: axisLabelCreated,
              minimum: minValue,
              maximum: maxValue,
              ranges: <GaugeRange>[
                GaugeRange(
                    label: '저체중',
                    startValue: minValue,
                    endValue: 18.5,
                    color: Colors.blue),
                GaugeRange(
                    label: '정상',
                    startValue: 18.5,
                    endValue: 25,
                    color: Colors.green),
                GaugeRange(
                    label: '과체중',
                    startValue: 25,
                    endValue: 30,
                    color: Colors.orange),
                GaugeRange(
                    label: '비만',
                    startValue: 30,
                    endValue: 35,
                    color: Colors.red[400]),
                GaugeRange(
                    label: '고도 비만',
                    startValue: 35,
                    endValue: maxValue,
                    color: Colors.red),
              ],
              pointers: <GaugePointer>[
                NeedlePointer(
                    value: double.parse(value),
                    needleColor: Colors.black,
                    knobStyle: const KnobStyle(color: Colors.black))
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    widget: Text('BMI : $value',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                    angle: 90,
                    positionFactor: 0.5),
              ])
        ],
      ),
    ],
  ));
}
