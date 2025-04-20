import 'package:dua/core/di/service_locator.dart';
import 'package:dua/presentation/subcategory/presenter/dua_subcategory_list_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DuaSubcategoryList extends StatefulWidget {
  const DuaSubcategoryList({super.key});

  @override
  State<DuaSubcategoryList> createState() => _DuaSubcategoryListState();
}

class _DuaSubcategoryListState extends State<DuaSubcategoryList> {
  final DuaSubcategoryListPresenter _presenter = locate();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_presenter.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (_presenter.errorMessage.value.isNotEmpty) {
        return Center(child: Text(_presenter.errorMessage.value));
      }

      if (_presenter.subcategoryCount == 0) {
        return const Center(child: Text('No duas found'));
      }

      return ListView.builder(
        itemCount: _presenter.subcategoryCount,
        itemBuilder: (context, index) {
          final subcategoryId = _presenter.subcategoryIds[index];
          final duasInSubcategory =
              _presenter.getDuasBySubcategoryId(subcategoryId) ?? [];

          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ExpansionTile(
              title: Text(
                'Subcategory ID: $subcategoryId',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Text('${duasInSubcategory.length} duas'),
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: duasInSubcategory.length,
                  itemBuilder: (context, duaIndex) {
                    final dua = duasInSubcategory[duaIndex];
                    return ListTile(
                      title: Text(dua.name),
                      subtitle: Text(dua.transliteration),
                      onTap: () {
                        // Navigate to dua details or perform action
                      },
                    );
                  },
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
