import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ua_com_knin/models/Advert.dart';
import 'package:ua_com_knin/ui_elements/bottom_search_bar.dart';

class MapFragment extends StatelessWidget {
  Advert advert;

  GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  MapFragment(this.advert);

  @override
  Widget build(BuildContext context) {
    final LatLng _center = LatLng(double.parse(advert.latitude), double.parse(advert.longitude));
    final Set<Marker> _markers = {};
    MapType _currentMapType = MapType.normal;
    _markers.add(Marker(
      // This marker id can be anything that uniquely identifies each marker.
      markerId: MarkerId(_center.toString()),
      position: _center,
      infoWindow: InfoWindow(
        title: advert.name,
        snippet: advert.address,
      ),
      icon: BitmapDescriptor.defaultMarker,
    ));


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0185D4),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: Text('Карта')),
          ],
        ),
      ),
      body: GoogleMap(
        mapType: _currentMapType,
        markers: _markers,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 16.0,
        ),
      ),
      bottomNavigationBar: MyBottomBarSearch(0),
    );
  }
}
