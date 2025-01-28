import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      CategoryData(
        icon: Icons.mosque,
        bgColor: const Color(0x1AE08E15),
        title: 'Dua Importance',
        subtitle: '7 Subcategories',
        duaCount: 50,
      ),
      CategoryData(
        icon: Icons.auto_awesome,
        bgColor: const Color(0x1A924A56),
        title: 'Dua Acceptance',
        subtitle: '10 Subcategories',
        duaCount: 33,
      ),
      CategoryData(
        icon: Icons.access_time,
        bgColor: const Color(0x1A3F5C6C),
        title: 'Time of Dua',
        subtitle: '5 Subcategories',
        duaCount: 25,
      ),
      // ... Add other categories
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: index < categories.length - 1 ? 12 : 0),
          child: CategoryCard(category: categories[index]),
        );
      },
    );
  }
}

class CategoryData {
  final IconData icon;
  final Color bgColor;
  final String title;
  final String subtitle;
  final int duaCount;

  CategoryData({
    required this.icon,
    required this.bgColor,
    required this.title,
    required this.subtitle,
    required this.duaCount,
  });
}

class CategoryCard extends StatelessWidget {
  final CategoryData category;

  const CategoryCard({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE1EBE1)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: category.bgColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child:
                Icon(category.icon, color: category.bgColor.withOpacity(0.8)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF282E29),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  category.subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF686D69),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 2,
            height: 34,
            decoration: BoxDecoration(
              color: const Color(0xFFD8E7D3),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            children: [
              Text(
                '${category.duaCount}',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF282E29),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Duas',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF686D69),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
