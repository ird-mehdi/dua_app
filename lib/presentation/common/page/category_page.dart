import 'package:dua/core/di/service_locator.dart';
import 'package:dua/presentation/home/presenter/home_presenter.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  final int categoryId;

  const CategoryPage({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    final presenter = locate<HomePresenter>();
    final subcategories =
        presenter.currentUiState.subcategoryNamesByCategoryId?[categoryId] ??
            [];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Dua Importance',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey.shade600),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search by subcategories name',
                        hintStyle: TextStyle(
                            color: Colors.grey.shade600, fontSize: 14),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: subcategories.length,
              itemBuilder: (context, index) {
                return _buildDuaItem(
                  number: index + 1,
                  title: subcategories[index],
                  totalDuas: 5, // You should replace this with actual data
                  subcategories: index == 1
                      ? [
                          'Sincerity',
                          'Eating Lawful Food',
                          'The Consciousness of One\'s Heart',
                          'Supplicate for Good Only'
                        ]
                      : null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDuaItem({
    required int number,
    required String title,
    required int totalDuas,
    List<String>? subcategories,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                color: number % 2 == 0
                    ? const Color(0xFF4a8c00)
                    : const Color(0xFFe08e15),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  number.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Total $totalDuas duas',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (subcategories != null) ...[
          const SizedBox(height: 12),
          ...subcategories.map((subcategory) => Padding(
                padding: const EdgeInsets.only(left: 38, bottom: 8),
                child: Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.teal.shade200,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      subcategory,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              )),
          const SizedBox(height: 8),
        ],
        const SizedBox(height: 16),
      ],
    );
  }
}
