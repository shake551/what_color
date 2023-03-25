import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:what_color/domain/model/color_base.dart';
import 'package:what_color/domain/repository/your_color_repository.dart';
import 'package:what_color/page/home.dart';

class FeelForm extends StatefulWidget {
  const FeelForm({this.selectedColors, super.key});

  final List<ColorBase>? selectedColors;

  @override
  State<StatefulWidget> createState() => FeelFormState();
}

class FeelFormState extends State<FeelForm> {
  String comment = '';

  @override
  Widget build(BuildContext context) {
    final colorAverage = ColorBase.averageColor(widget.selectedColors);
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
                        color: Color.fromRGBO(color.r, color.g, color.b, 1),
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
                onChanged: (value) {
                  comment = value;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(
                      colorAverage.r,
                      colorAverage.g,
                      colorAverage.b,
                      1,
                    ),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    final position = await Geolocator.getCurrentPosition();
                    YourColorRepository.create(
                      comment,
                      position.latitude,
                      position.longitude,
                      colorAverage,
                    );
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Home(),
                      ),
                    );
                  },
                  child: const Text(
                    '投稿する',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
