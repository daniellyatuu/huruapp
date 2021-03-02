import 'package:equatable/equatable.dart';

abstract class ServiceEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class GetService extends ServiceEvents {}
