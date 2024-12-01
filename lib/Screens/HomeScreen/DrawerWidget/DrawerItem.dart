import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  String label;
  IconData icon;
  int id;
  Function(int) onTab;

  DrawerItem({
    super.key,
    required this.id,
    required this.label,
    required this.icon,
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTab(id);
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              color: Theme.of(context).colorScheme.secondary,
              icon,
              size: 30,
            ),
          ),
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: Theme.of(context).colorScheme.secondary),
          )
        ],
      ),
    );
  }
}
