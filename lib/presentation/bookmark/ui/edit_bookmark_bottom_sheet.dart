import 'package:flutter/material.dart';

class EditBookmarkBottomSheet {
  static Future<void> show({
    required BuildContext context,
    required String folderName,
    required Color folderColor,
    required Function(String, Color) onSave,
  }) async {
    final TextEditingController nameController =
        TextEditingController(text: folderName);
    Color selectedColor = folderColor;

    final List<Color> colorOptions = [
      const Color(0xFFFF9F9F), // Pink
      const Color(0xFF72CD9C), // Green
      const Color(0xFF5282FF), // Blue
      const Color(0xFFF178B6), // Magenta
      const Color(0xFF7DDDD8), // Cyan
      const Color(0xFF5B68FA), // Indigo
      const Color(0xFF8CAC5B), // Olive
      const Color(0xFF9A78FA), // Purple

      const Color(0xFFFA75AD), // Light pink
      const Color(0xFFFA8C6E), // Orange
      const Color(0xFFFC9E63), // Light orange
      const Color(0xFF64B391), // Teal
      const Color(0xFFFA7678), // Coral
      const Color(0xFFFAA356), // Amber
    ];

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 16,
                right: 16,
                top: 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Edit Bookmark Folder',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Change Folder Name',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF4B5563),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFE5E7EB)),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.folder,
                          color: selectedColor,
                          size: 24,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            controller: nameController,
                            decoration: const InputDecoration(
                              hintText: 'Enter folder name',
                              border: InputBorder.none,
                              isCollapsed: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Change color for folder',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF4B5563),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 10,
                    children: List.generate(
                      colorOptions.length,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColor = colorOptions[index];
                          });
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: colorOptions[index],
                            shape: BoxShape.circle,
                            border: selectedColor == colorOptions[index]
                                ? Border.all(color: Colors.white, width: 2)
                                : null,
                          ),
                          child: selectedColor == colorOptions[index]
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 20,
                                )
                              : null,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF3F4F6),
                            foregroundColor: const Color(0xFF6B7280),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: const Text('Cancel'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            onSave(nameController.text, selectedColor);
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4B876C),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: const Text('Done'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
