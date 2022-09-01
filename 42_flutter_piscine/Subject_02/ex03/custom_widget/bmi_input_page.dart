import 'package:flutter/material.dart';
import 'bmi_output_page.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _TextForm();
}

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

class _TextForm extends State<MyStatefulWidget> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final height = GlobalKey<FormState>();
  final weight = GlobalKey<FormState>();
  var hide = false;

  @override
  void initState() {
    super.initState();
    _controller1.addListener(() {
      final String text = _controller1.text.toLowerCase();
      _controller1.value = _controller1.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
    _controller2.addListener(() {
      final String text = _controller2.text.toLowerCase();
      _controller2.value = _controller2.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  renderTextFormField(
      {required String label,
      required FormFieldSetter onSaved,
      required FormFieldValidator validator,
      required TextEditingController controller}) {
    return TextFormField(
        obscuringCharacter: '*',
        obscureText: controller == _controller1 ? false : hide,
        controller: controller,
        onSaved: onSaved,
        validator: validator,
        decoration: InputDecoration(
            labelText: label, border: const OutlineInputBorder()),
        keyboardType: TextInputType.number);
  }

  renderButton() {
    return ElevatedButton(
      onPressed: () async {
        if (height.currentState!.validate() &&
            weight.currentState!.validate()) {
          // validation 성공하면 true 리턴
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BMIGaugePage(
                    // double.parse(height.toString()),
                    // double.parse(weight.toString())
                    double.parse(_controller1.value.text),
                    double.parse(_controller2.value.text))),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Error'),
          ));
        }
        FocusScope.of(context).unfocus();
      },
      style: ElevatedButton.styleFrom(primary: Colors.green),
      child: const Text('Calculation', style: TextStyle(color: Colors.white)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar('BMI Calculator'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                  key: height,
                  child: renderTextFormField(
                      label: 'input height(cm)',
                      onSaved: (val1) {},
                      validator: (val1) {
                        if (val1.length == 0) return 'Input Height';
                        return null;
                      },
                      controller: _controller1)),
              const SizedBox(height: 30.0),
              Form(
                  key: weight,
                  child: renderTextFormField(
                      label: 'input weight(kg)',
                      onSaved: (val2) {},
                      validator: (val2) {
                        if (val2.length == 0) return 'Input Weight';
                        return null;
                      },
                      controller: _controller2)),
              switchHideWeight(),
              Text('Weight: ${hide ? '****' : 'digit'}'),
              const SizedBox(height: 20.0),
              SizedBox(width: double.infinity, child: renderButton())
            ]),
      ),
    );
  }

  Widget switchHideWeight() {
    return Switch(
      value: hide,
      activeColor: Colors.green,
      onChanged: (bool value) {
        setState(() {
          hide = value;
        });
      },
    );
  }
}
