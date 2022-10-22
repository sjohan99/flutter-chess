import 'package:flutter/material.dart';

class Board extends StatefulWidget {
  const Board({super.key});

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  double squareSize(BuildContext context) =>
      MediaQuery.of(context).size.width / 8;

  Column generateColumn(
      bool even, Color color1, Color color2, double size, int startNumber) {
    if (even) {
      Color tmp = color1;
      color1 = color2;
      color2 = tmp;
    }

    int cellIdStart = (startNumber * 8);

    return Column(
      children: [
        generateContainer(color1, size, cellIdStart + 1),
        generateContainer(color2, size, cellIdStart + 2),
        generateContainer(color1, size, cellIdStart + 3),
        generateContainer(color2, size, cellIdStart + 4),
        generateContainer(color1, size, cellIdStart + 5),
        generateContainer(color2, size, cellIdStart + 6),
        generateContainer(color1, size, cellIdStart + 7),
        generateContainer(color2, size, cellIdStart + 8),
      ],
    );
  }

  GestureDetector generateContainer(Color color, double size, int id) {
    return GestureDetector(
      onTap: () {
        debugPrint('clicked $id');
      },
      child: Container(
        color: color,
        width: size,
        height: size,
        child: const Center(
            child: Icon(
          Icons.accessibility_outlined,
          color: Colors.blueGrey,
        )),
      ),
    );
  }

  Row generateBoard(Color color1, Color color2, double size) {
    List<Column> columns = [];
    for (var i = 0; i < 8; i++) {
      columns.add(generateColumn(i % 2 == 0, color1, color2, size, i));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: columns,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          generateBoard(Colors.white, Colors.black, squareSize(context)),
          ElevatedButton(onPressed: () {}, child: const Text('Hello'))
        ],
      ),
    );
  }
}
