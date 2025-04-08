import 'package:dua/core/di/service_locator.dart';
import 'package:dua/presentation/all_dua/presenter/all_dua_presenter.dart';
import 'package:dua/presentation/dua_details/ui/dua_details_page.dart';
import 'package:flutter/material.dart';

class DuaListItem extends StatelessWidget {
  final int number;
  final String text;
  final bool isHighlighted;
  final VoidCallback? onTap;
  final ThemeData theme;

  const DuaListItem({
    required this.number,
    required this.text,
    this.isHighlighted = false,
    this.onTap,
    super.key,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final AllDuasPresenter presenter = locate<AllDuasPresenter>();
    final duas = presenter.uiState.value.duas ?? [];

    if (duas.isEmpty) {
      return const Center(child: Text('No duas found'));
    }

    return ListView.builder(
      padding: EdgeInsets.zero,
      controller: presenter.uiState.value.scrollController,
      itemCount: duas.length,
      itemBuilder: (context, index) {
        final dua = duas[index];
        return ListTile(
          leading: CircleAvatar(
            child: Text(
              '${index + 1}',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          title: Text(dua.name),
          //subtitle: Text(dua.context),
          onTap: () {
            // Navigate to dua details page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DuaDetailsPage(dua: dua),
              ),
            );
          },
        );
      },
    );
  }
}
