import 'package:dua/core/external_libs/presentable_widget_builder.dart';
import 'package:dua/presentation/last_read/presenter/last_read_presenter.dart';
import 'package:flutter/material.dart';

class LastReadPage extends StatelessWidget {
  LastReadPage({
    super.key,
  });

  final LastReadPresenter _lastReadPresenter = LastReadPresenter();

  @override
  Widget build(BuildContext context) {
    // final ThemeData theme = Theme.of(context);

    return PresentableWidgetBuilder(
      presenter: _lastReadPresenter,
      builder: () {
        return Scaffold();
      },
    );
  }
}
