import 'package:flutter/material.dart';

import '../../../../core/styles/custom_theme.dart';

class RandomMovieListTileItemWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData leadingIcon;
  final void Function() tileAction;

  const RandomMovieListTileItemWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.leadingIcon,
    required this.tileAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      title: Text(
        title,
        style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 12.0),
      ),
      leading: Icon(
        leadingIcon,
        color: CustomTheme.color,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: CustomTheme.color.shade900,
      ),
      onTap: tileAction,
    );
  }
}
