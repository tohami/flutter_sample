
import 'package:flutter/cupertino.dart';
import 'package:sample_one/model/status.dart';

class DataState<T> {
  final Status status ;
  final T data ;
  final String error ;

  DataState({@required this.status, this.data, this.error});
}
