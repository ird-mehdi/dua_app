import 'package:dua/core/di/service_locator.dart';
import 'package:dua/core/external_libs/presentable_widget_builder.dart';
import 'package:dua/presentation/home/presenter/home_presenter.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  final HomePresenter presenter = locate<HomePresenter>();

  @override
  Widget build(BuildContext context) {
    return PresentableWidgetBuilder<HomePresenter>(
        presenter: presenter,
        builder: () {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Home Page'),
                Text('Count: ${presenter.currentUiState.count}'),
                TextButton(
                  onPressed: () => presenter.incrementCount(),
                  child: Text('Increment'),
                ),
                TextButton(
                  onPressed: () => presenter.decrementCount(),
                  child: Text('Decrement'),
                ),
              ],
            ),
          );
        });
  }
}
