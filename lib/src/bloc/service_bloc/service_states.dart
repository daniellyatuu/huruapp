import 'package:equatable/equatable.dart';
import 'package:huruapp/src/model/model_files.dart';

abstract class ServiceStates extends Equatable {
  const ServiceStates();

  @override
  List<Object> get props => [];
}

class ServiceLoading extends ServiceStates {}

class ServiceSuccess extends ServiceStates {
  final List<Service> services;

  const ServiceSuccess({this.services});

  @override
  List<Object> get props => [services];
}

class ServiceError extends ServiceStates {}
