import 'package:flutter/material.dart';

class FeelForm extends StatefulWidget {
  const FeelForm({this.selectedColors, super.key});

  final List<List<int>>? selectedColors;

  @override
  State<StatefulWidget> createState() => FeelFormState();
}

class FeelFormState extends State<FeelForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('what color?')),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                '今の気持ちを文字にしてみましょう\n書かれた内容はあなただけがみることができます',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (widget.selectedColors != null)
                Row(
                  children: widget.selectedColors!.map((color) {
                    return Container(
                      width: 30,
                      height: 30,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(color[0], color[1], color[2], 1),
                        shape: BoxShape.circle,
                      ),
                    );
                  }).toList(),
                ),
              TextFormField(
                maxLines: 6,
                minLines: 6,
                keyboardType: TextInputType.multiline,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Processing Data'),
                      ),
                    );
                  },
                  child: const Text('投稿する'),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).viewInsets.bottom,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
