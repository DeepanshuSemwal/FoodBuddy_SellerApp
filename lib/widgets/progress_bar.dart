import 'package:flutter/material.dart';

CircularProgressBar()
{
  return Container(

    alignment: Alignment.center,
    padding: EdgeInsets.only(top: 12),
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(
        Colors.red,
      ),
    ),
  );
}
linearProgressBar()
{
  Container(

    alignment: Alignment.center,
    padding: EdgeInsets.only(top: 12),
    child: LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(
        Colors.red,
      ),
    ),
  );
}
