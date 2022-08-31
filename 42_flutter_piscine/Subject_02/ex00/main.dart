import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final TextEditingController _controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final String text = _controller.text.toLowerCase();
      _controller.value = _controller.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  renderTextFormField(
      {required String label,
      required FormFieldSetter onSaved,
      required FormFieldValidator validator}) {
    return TextFormField(
        onSaved: onSaved,
        validator: validator,
        // controller: _controller,
        decoration: const InputDecoration(
            labelText: '카드 번호를 입력하세요', border: OutlineInputBorder()),
        keyboardType: TextInputType.number);
  }

  renderButton() {
    return ElevatedButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            // validation 성공하면 true 리턴
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Check In Success'),
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Check In Fail'),
            ));
          }
          FocusScope.of(context).unfocus();
        },
        style: ElevatedButton.styleFrom(primary: Colors.green),
        child: const Text('CHECK IN'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check In'),
        centerTitle: false,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Form(
              key: formKey,
              child: renderTextFormField(
                  label: 'label',
                  onSaved: (val) {},
                  validator: (val) {
                    if (val != '42') return '입력이 올바르지 않습니다';
                    return null;
                  })),
          const Divider(thickness: 2, height: 70),
          SizedBox(width: double.infinity, child: renderButton())
        ]),
      ),
    );
  }
}
