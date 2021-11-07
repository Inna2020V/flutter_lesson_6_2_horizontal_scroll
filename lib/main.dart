import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    body: const ButterfliesList(),
    appBar: AppBar(
      title: const Text("Butterflies"),
      centerTitle: true,
      backgroundColor: Colors.indigo,
    ),
  )));
}

class ButterfliesList extends StatefulWidget {
  const ButterfliesList({Key? key}) : super(key: key);

  @override
  _ButterfliesListState createState() => _ButterfliesListState();
}

class _ButterfliesListState extends State<ButterfliesList> {
  final List<String> _butterflies = <String>[
    "Крапивница",
    "Павлиний глаз",
    "Капустница",
    "Траурница",
    "Переливница большая"
  ];
  final List<String> _description = <String>[
    "Красивая бабочка с кирпично-красными крыльями в крупных черных пятнах. По внешнему краю крыльев расположены маленькие голубые пятна",
    "Бабочка получила такое красивое название, засчет характерного рисунка на крыльях. На нижней части крыльев разместились округлые рисунки, напоминающие глаза.",
    "Крылья у бабочки белого цвета, по краям разбросанны черные пятнышки. Внутренняя часть салатного цвета, если бабочка будет сидеть на капусте со сложенными крыльями, заметить ее будет очень тяжело.",
    "Бабочка имеет жуткое название. Но на самом деле это очень милое насекомое. Ее так прозвали за крылья, которые имеют ярко-темный окрас.",
    "Очень красивая бабочка. Верхняя сторона крыльев черно-бурая, у самца с ярко-фиолетовым отливом, у самки темно-бурая без отлива с осветленным краем. Переливы создаются не синим пигментом, а структурными окрасками, отраженными светом."
  ];

  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SizedBox(
            height: 100.0,
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemExtent: 200,
              itemCount: _butterflies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  title: Container(
                    height: 70,
                    width: double.infinity,
                    color: Colors.indigo[50],
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    padding: const EdgeInsets.all(8),
                    child: Text(_butterflies[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 22, color: Colors.indigoAccent)),
                  ),
                  selected: index == _selectedIndex),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.brightness_5_outlined,
            ),
            Text(
                _selectedIndex == -1
                    ? "Выбери бабочку"
                    : " ${_butterflies[_selectedIndex]}",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 30)),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 400.0,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(_selectedIndex == -1 ? '' : _description[_selectedIndex],
              style: const TextStyle(fontSize: 20, color: Colors.indigo)),
        ),
      ],
    );
  }
}
