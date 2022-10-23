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

  String selected = '';

  double squareSize(BuildContext context) => MediaQuery.of(context).size.width / 8;

  bool isSelected(String position) {
    return selected == position;
  }

  Color getColor(String position) {
    int columnOffset = 0;
    if (columnIsBDFH(position)) {
      columnOffset = 1;
    }
    Color color = getCorrectBaseColorFromPosition(position, columnOffset);

    if (isSelected(position)) {
      return Color.alphaBlend(Colors.yellow.withOpacity(0.4), color);
    }
    return color;
  }

  Color getCorrectBaseColorFromPosition(position, int columnOffset) {
    Color color = (int.parse(position[1]) + columnOffset) % 2 == 0 ? blackPiecesColor : whitePiecesColor;
    return color;
  }

  Column generateColumn(Color color1, Color color2, double size, String column) {
    if (columnIsBDFH(column)) {
      Color tmp = color1;
      color1 = color2;
      color2 = tmp;
    }
    List<Widget> containers = [];
    for (var i = 8; i >= 1; i--) {
      containers.add(generateContainer(color1, size, '$column$i'));
    }

    return Column(
      children: containers,
    );
  }

  bool columnIsBDFH(String column) => column.contains(RegExp('[bBdDfFhH]'));

  GestureDetector generateContainer(Color color, double size, String position) {
    return GestureDetector(
      onTap: () {
        debugPrint(position);
        setState(() {
          selected = selected == position ? '' : position;
        });
      },
      child: Container(
        color: getColor(position),
        width: size,
        height: size,
      ),
    );
  }

  Row generateBoard(Color color1, Color color2, double size) {
    List<Column> columns = [];

    for (var column in <String>['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']) {
      columns.add(generateColumn(color1, color2, size, column));
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
