import 'package:dermain/Methods/zakat_method.dart';
import 'package:dermain/Providers/zakat_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ZakatsList extends ConsumerStatefulWidget {
  const ZakatsList(Center center, {super.key});

  @override
  ConsumerState<ZakatsList> createState() => _ZakatsListState();
}

class _ZakatsListState extends ConsumerState<ZakatsList> {
  bool status = false;
  void _loadAllZakats() async {
    setState(() {
      status = false;
    });
    ref
        .read(zakatsProvider.notifier)
        .addZakats(await ZakatMethod.loadAllZakat());
    setState(() {
      status = true;
    });
  }

  @override
  void initState() {
    _loadAllZakats();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final todos = ref.watch(zakatsProvider);

    return todos.isNotEmpty
        ? status
            ? ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) => TodoItem(todo: todos[index]),
              )
            : Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: Theme.of(context).colorScheme.primary,
                  size: 80,
                ),
              )
        : const Center(
            child: Text(
              'Data Todo Kosong',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          );
  }
}
