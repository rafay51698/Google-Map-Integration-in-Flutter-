import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(24.937182, 67.147488),
    zoom: 14.4746,
  );

  final List<Marker> _marker = [];
  final List<Marker> _list = const [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(24.937182, 67.147488),
        infoWindow: InfoWindow(title: 'My current Location')),
  ];

  @override
  void initState() {
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        mapType: MapType.normal,
        myLocationEnabled: true,
        markers: Set<Marker>.of(_marker),
      ),
    );
  }
}
