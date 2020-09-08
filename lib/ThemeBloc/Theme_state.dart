import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class ThemeState extends Equatable{
  final ThemeData theme;
  ThemeState({this.theme});

 @override
  List<Object> get props => [theme];
}