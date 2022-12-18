import 'package:flutter/cupertino.dart';

Future<void> showConfirmDialog(
  BuildContext context, {
  required VoidCallback onConfirm,
  required String title,
  required String body,
}) {
  return showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text(title),
      content: Center(child: Text(body, textAlign: TextAlign.center)),
      actions: [
        CupertinoDialogAction(
          child: const Text('Ok'),
          onPressed: onConfirm,
        ),
        CupertinoDialogAction(
          child: const Text('Cancel'),
          onPressed: Navigator.of(context).pop,
        ),
      ],
    ),
  );
}
