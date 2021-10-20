import 'package:flutter/material.dart';
import 'package:converter/logic/metrics.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _metrics = ["km", "m", "cm"];
  String? fromMetric;
  String? toMetric;
  final FocusNode _focusNode = FocusNode();
  TextEditingController _numberController = TextEditingController();
  String resultString = "";
  double fromNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Listener(
        onPointerDown: (_) => _focusNode.unfocus(),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: const Text("Metrics Converter",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Column(children: [
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Number: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  SizedBox(
                      height: 50,
                      width: 150,
                      child: TextField(
                        focusNode: _focusNode,
                        controller: _numberController,
                        onChanged: (value) {
                          setState(() {
                            var amount = double.tryParse(value);
                            if (amount != null) {
                              fromNumber = amount;
                            } else {
                              fromNumber = 0;
                            }
                          });
                        },
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                        cursorColor: Colors.white,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            fillColor: Colors.blue,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(35)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(35)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(35))),
                        keyboardType: TextInputType.number,
                      )),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      color: Colors.lightBlue, shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 50),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("From:",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25)),
                              Container(
                                width: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    value: fromMetric,
                                    iconEnabledColor: Colors.white,
                                    borderRadius: BorderRadius.circular(35),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 18),
                                    selectedItemBuilder: (_) => _metrics
                                        .map((e) => Center(
                                                child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: Text(e,
                                                  style: const TextStyle(
                                                      color: Colors.white)),
                                            )))
                                        .toList(),
                                    items: _metrics
                                        .map((metric) =>
                                            DropdownMenuItem<String>(
                                              value: metric,
                                              child: Text(metric),
                                            ))
                                        .toList(),
                                    onChanged: (dynamic value) {
                                      setState(() {
                                        fromMetric = value;
                                      });
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("To:",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25)),
                              Container(
                                width: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    value: toMetric,
                                    iconEnabledColor: Colors.white,
                                    borderRadius: BorderRadius.circular(35),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 18),
                                    selectedItemBuilder: (_) => _metrics
                                        .map((e) => Center(
                                                child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Text(e,
                                                  style: const TextStyle(
                                                      color: Colors.white)),
                                            )))
                                        .toList(),
                                    items: _metrics
                                        .map((metric) =>
                                            DropdownMenuItem<String>(
                                              value: metric,
                                              child: Text(metric),
                                            ))
                                        .toList(),
                                    onChanged: (dynamic value) {
                                      setState(() {
                                        toMetric = value;
                                      });
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ]),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Result: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Container(
                      color: Colors.blue,
                      height: 50,
                      width: 150,
                      child: Center(
                          child: Text(resultString,
                              style: const TextStyle(color: Colors.white))),
                    ),
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: SizedBox(
                height: 50,
                width: 250,
                child: ElevatedButton.icon(
                    onPressed: () {
                      if (fromMetric == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please choose the from Metric!'),
                          ),
                        );
                      } else if (toMetric == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please choose the to Metric!'),
                          ),
                        );
                      } else {
                        setState(() {
                          resultString = MetricsHelper()
                              .convert(fromMetric, toMetric, fromNumber)
                              .toString();
                        });
                      }
                    },
                    icon: const Icon(
                      Icons.change_circle,
                    ),
                    label: const Text("Convert")),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: SizedBox(
                height: 50,
                width: 250,
                child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _focusNode.unfocus();
                        fromMetric = null;
                        toMetric = null;
                        _numberController.clear();
                        resultString = "";
                        fromNumber = 0;
                      });
                    },
                    icon: const Icon(
                      Icons.change_circle,
                    ),
                    label: const Text("Reset")),
              ),
            ),
          ]),
        ));
  }
}
