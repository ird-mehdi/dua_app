import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/presentation/common/widgets/custom_app_bar.dart';
import 'package:dua/presentation/common/widgets/svg_image.dart';
import 'package:flutter/material.dart';

class DuaVerticalMove extends StatelessWidget {
  const DuaVerticalMove({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Dua Importance',
        actions: [
          Padding(
            padding: EdgeInsets.only(right: sixteenPx),
            child: Container(
                width: twentyFourPx,
                height: twentyFourPx,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: SvgImage(
                    assetName: AppImages.icSetting2,
                    color: context.color.primaryColor100)),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(sixteenPx),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section header
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Row(
                children: [
                  Text(
                    'Section: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'The most important thing to ask Allah for',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Item #4
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.green.shade600,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '4',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'The servant is dependent on his Lord #1',
                  style: TextStyle(
                    color: Colors.green.shade700,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Arabic Text
            const Center(
              child: Text(
                'إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ',
                style: TextStyle(
                  fontSize: 28,
                  height: 2,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Transliteration
            const Center(
              child: Text(
                "lyyaaka na'budu wa lyyaaka nasta'een",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8),

            // Translation
            const Center(
              child: Text(
                'It is You we worship and It is You we ask for help.',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),

            // Quote
            const Text(
              'He whom Allah guides is the [rightly] guided, but he whom He leaves astray - never will you find for him a protecting guide. (Surah Al-Kahf 18:17)',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),

            // Reference
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reference:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Muslim: 770',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Action buttons
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey.shade300),
                  bottom: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.bookmark_border),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.lightbulb_outline),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.play_arrow),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Item #5
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.green.shade600,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '5',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  "Allah's guidance #2",
                  style: TextStyle(
                    color: Colors.green.shade700,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Final text
            const Text(
              'The Messenger of Allah (ﷺ) commenced the prayer when he got up at night. Then he said:',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),

            // Final Arabic text
            const Center(
              child: Text(
                'اهْدِنِي لِمَا اخْتُلِفَ فِيهِ مِنَ الْحَقِّ بِإِذْنِكَ إِنَّكَ',
                style: TextStyle(
                  fontSize: 28,
                  height: 2,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
