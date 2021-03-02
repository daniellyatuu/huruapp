import 'package:equatable/equatable.dart';

class Service extends Equatable {
  final int id;
  final String facility;
  final String facilityType;
  final String serviceOffered;
  final String contact;
  final String region;
  final String district;
  final String location;

  const Service({
    this.id,
    this.facility,
    this.facilityType,
    this.serviceOffered,
    this.contact,
    this.region,
    this.district,
    this.location,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      facility: json['facility'],
      facilityType: json['facility_type'],
      serviceOffered: json['service_offered'],
      contact: json['contact'],
      region: json['region'],
      district: json['district'],
      location: json['location'],
    );
  }

  @override
  List<Object> get props => [
        id,
        facility,
        facilityType,
        serviceOffered,
        contact,
        region,
        district,
        location,
      ];

  @override
  String toString() => 'Service { id: $id }';
}
