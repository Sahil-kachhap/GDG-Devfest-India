import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeEvent extends Equatable{
  final ThemeData theme;
  ThemeEvent({this.theme});

  @override
  List<Object> get props => [theme];
}