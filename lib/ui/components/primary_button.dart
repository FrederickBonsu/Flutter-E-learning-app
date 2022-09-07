import 'package:flutter/material.dart';

/*
PrimaryButton(
                labelText: 'UPDATE',
                onPressed: () => print('Submit'),
              ),
*/

class PrimaryButton extends StatelessWidget {
  PrimaryButton({@required this.labelText, @required this.onPressed});

  final String labelText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Colors.indigoAccent,

        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),

          ),
        ),
      ),






      onPressed: onPressed,

      child: Text(
        labelText.toUpperCase(),
        style: Theme.of(context).textTheme.button,
      ),

    );
  }
}