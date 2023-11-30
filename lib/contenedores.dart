import 'package:flutter/material.dart';

Container titulo = Container(
  decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.lightGreen,
      border: Border.all(width: 2, color: Colors.lightGreen.shade100)),
  margin: const EdgeInsets.all(25),
  width: double.infinity,
  child: const Padding(
    padding: EdgeInsets.all(20),
    child: Text(
      'Tips de reciclaje',
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'Roboto',
        fontSize: 20,
      ),
      textAlign: TextAlign.center,
    ),
  ),
);
