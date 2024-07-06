import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:tflite_flutter/tflite_flutter.dart' as tfl;

class CropScanScreen extends StatefulWidget {
  const CropScanScreen({super.key});

  @override
  State<CropScanScreen> createState() => _CropScanScreenState();
}

class _CropScanScreenState extends State<CropScanScreen> {
  final TextEditingController noController = TextEditingController();
  final FocusNode noFocus = FocusNode();
  String result = '';

  @override
  // void initState() {
  //   super.initState();
  //   loadModel();
  //   runModel(12);
  // }

  // Future<void> loadModel() async {
  //   final res = await tfl.Interpreter.fromAsset(
  //       'assets/ml_model/number_predictor.tflite');
  //   print(res);
  // }

  // runModel(double no) async {
  //   // Add your model processing logic here
  //   // This is a placeholder for demonstration
  //   final interpreter = await tfl.Interpreter.fromAsset(
  //       'assets/ml_model/number_predictor.tflite');
  //   final input = [
  //     [no]
  //   ];
  //   var output = List.filled(1, 0).reshape([1, 1]);
  //   interpreter.run(input, output);
  //   result = output[0][0];
  //   print(output);
  //   setState(() {
  //     result = 'Processed number: $no';
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade700,
          title: const Text("Number predictor"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                focusNode: noFocus,
                onTapOutside: (event) {
                  noFocus.unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                controller: noController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'))
                ],
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter a Number'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: MaterialButton(
                  color: Colors.black,
                  child: const Text('Process',
                      style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    double? number = double.tryParse(noController.text);
                    if (number != null) {
                      // runModel(number);
                    } else {
                      setState(() {
                        result = 'Please enter a valid number';
                      });
                    }
                  }),
            ),
            Text(
              result,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    noController.dispose();
    noFocus.dispose();
    super.dispose();
  }
}
