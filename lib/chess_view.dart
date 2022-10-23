import 'package:flutter/material.dart';

class BoardWidget extends StatefulWidget {
  const BoardWidget({super.key});

  @override
  State<BoardWidget> createState() => _BoardWidgetState();
}

class _BoardWidgetState extends State<BoardWidget> {
  final Color whitePiecesColor = Colors.white;
  final Color blackPiecesColor = Colors.black;
  final Color selectColor = Colors.yellow;

  int selected = 0;

  double squareSize(BuildContext context) => MediaQuery.of(context).size.width / 8;

  bool isSelected(int id) {
    return selected == id;
  }

  Color getColor(cellId) {
    int columnOffset = 0;
    if ((cellId > 8 && cellId <= 16) || (cellId > 24 && cellId <= 32) || (cellId > 40 && cellId <= 48) || (cellId > 56)) {
      columnOffset = 1;
    }
    Color color = getCorrectBaseColorFromPosition(cellId, columnOffset);

    if (isSelected(cellId)) {
      return Color.alphaBlend(Colors.yellow.withOpacity(0.4), color);
    }
    return color;
  }

  Color getCorrectBaseColorFromPosition(id, int columnOffset) {
    Color color = (id + columnOffset) % 2 == 0 ? blackPiecesColor : whitePiecesColor;
    return color;
  }

  Column generateColumn(bool even, Color color1, Color color2, double size, int startNumber) {
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
        debugPrint('$id');
        setState(() {
          selected = selected == id ? 0 : id;
        });
      },
      child: Container(
        color: getColor(id),
        width: size,
        height: size,
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
          generateBoard(whitePiecesColor, blackPiecesColor, squareSize(context)),
        ],
      ),
    );
  }
}
