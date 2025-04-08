import 'package:flutter/material.dart';

class DuaListItem extends StatelessWidget {
  final int number;
  final String text;
  final bool isHighlighted;
  final VoidCallback? onTap;

  const DuaListItem({
    required this.number,
    required this.text,
    this.isHighlighted = false,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Dua List
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Sticky Header
                Container(
                  color: Color(0xFFF9FAFB),
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Color(0xFFD1FAE5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            "A",
                            style: TextStyle(
                              color: Color(0xFF10B981),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF1F2937),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          "Tap for jump",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Dua Items with Left Border
                Container(
                  margin: EdgeInsets.only(left: 16),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Colors.grey.shade300,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDuaItem(
                          "A dhikr which is light on tongue, Heavy on the balance"),
                      _buildDuaItem(
                          "A dhikr which is light on tongue, Heavy on the balance",
                          highlighted: true),
                      _buildDuaItem(
                          "A dhikr which is light on tongue, Heavy on the balance"),
                      _buildDuaItem("A very beautiful Dua or Dhikr"),
                      _buildDuaItem("About Lailatul Qadr"),
                      _buildDuaItem("About meeting #1"),
                      _buildDuaItem("About meeting #2"),
                      _buildDuaItem(
                          "After awaking at night, reciting some specific duas"),
                      _buildDuaItem("After leaving the toilet"),
                      _buildDuaItem("After leaving the toilet"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Alphabet Index
        Container(
          width: 24,
          padding: EdgeInsets.only(top: 8),
          child: Column(
            children: [
              ..._buildAlphabetIndex(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDuaItem(String text, {bool highlighted = false}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      margin: EdgeInsets.only(left: 24),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade100,
            width: 1,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            width: 23,
            height: 1,
            color: Colors.grey.shade300,
          ),
          SizedBox(width: 2),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: highlighted ? Color(0xFF10B981) : Color(0xFF1F2937),
                fontWeight: highlighted ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildAlphabetIndex() {
    List<String> alphabet = [
      "#",
      "A",
      "B",
      "C",
      "D",
      "E",
      "F",
      "G",
      "H",
      "I",
      "J",
      "K",
      "L",
      "M",
      "N",
      "O",
      "P",
      "Q",
      "R",
      "S",
      "T",
      "U",
      "V",
      "W",
      "X",
      "Y",
      "Z"
    ];

    return alphabet.map((letter) {
      bool isActive = letter == "A";

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 1),
        child: Text(
          letter,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? Color(0xFF10B981) : Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }).toList();
  }
}
