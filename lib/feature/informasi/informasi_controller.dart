// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_ujikom_test_2/data/local/sqflite/todo_db.dart';
import 'package:flutter_ujikom_test_2/data/remote/base/base_controller.dart';
import 'package:flutter_ujikom_test_2/data/remote/location/location_serveice.dart';
import 'package:flutter_ujikom_test_2/model/pemilih.dart';
import 'package:flutter_ujikom_test_2/resources/resources.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class InformationController extends BaseController {

  @override
  void onInit(){
    // TODO: implement onInit
    super.onInit();
    init();
  }

  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage()async {
    // TODO: implement refreshPage
  }

  @override
  // TODO: implement statusData
  get statusData => throw UnimplementedError();

  @override
  // TODO: implement storageName
  String get storageName => throw UnimplementedError();

  void init() async{
    await getCurrentLocation();
    await getData();
  }

  TextEditingController textEditingController = TextEditingController();
  Set<Marker> marker = Set<Marker>();
  Set<Polyline> polylines = Set<Polyline>();
  int polylineIdCount = 1;
  int markerIdCount = 1;
  late LatLng myLocation;
  late LatLng direction = LatLng(0, 0);

  final Completer<GoogleMapController> mapsController =
      Completer<GoogleMapController>();

  final CameraPosition kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(0, 0),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  List<Pemilih> dataArray = [];
  int index = 0;

  Future<void> getData() async{
    List<Pemilih> data = await TodoDB().fetchAll();
    dataArray = data;
    for (var element in dataArray) {
      addMarker(
        LatLng(element.latAddress ?? 0, element.lngAddres ?? 0),
        title: element.name
      );
    }
    update();
  }

  Future<void> goToPlace(Map<String, dynamic> place, {String? title}) async {
    final String placeId = place['place_id'];
    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];

    final GoogleMapController controller = await mapsController.future;
    addMarker(LatLng(lat, lng), title: title);
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat, lng),
          zoom: 12
        ),
      ),
    );
    update();
  }

  void setPolyline(List<PointLatLng> points){
    final String polylineId = 'polyline_$polylineIdCount';
    polylineIdCount++;

    polylines.add(
      Polyline(
        polylineId: PolylineId(polylineId),
        width: 8,
        color: AppColors.blue,
        points: points.map((point)=>LatLng(point.latitude, point.longitude)).toList()
      )
    );
    update();
  }

  Future<void> goToPlaceDirection(
    double lat,
    double lng,
  ) async {

    final GoogleMapController controller = await mapsController.future;
    addMarker(LatLng(lat, lng));
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat, lng),
          zoom: 12
        ),
      ),
    );
    update();
  }

  Future<void> getDirection(String origin, String destination) async {
    var direction = await LocationService().getDirection(origin, destination);
    goToPlaceDirection(direction['start_location']['lat'], direction['start_location']['lng']);
    addMarker(LatLng(direction['end_location']['lat'], direction['end_location']['lng']));
    setPolyline(direction['polyline_decoded']);
  }
  
  Future<void> getCurrentLocation() async {
    final GoogleMapController controller = await mapsController.future;
    LocationService().getUserCurrentLocation().then((loc) async{
      myLocation = LatLng(loc.latitude, loc.longitude);
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(loc.latitude, loc.longitude),
            zoom: 12
          ),
        ),
      );
      update();
    });
  }

  Future<void> searchPlace(String value) async {
    var place = await LocationService().getPlace(value);
    marker.clear();
    polylines.clear();
    await getData();
    goToPlace(place);
    update();
  }

  void addMarker(LatLng point, {String? title}) {
    String markerId = 'marker_$markerIdCount';
    markerIdCount++;
    marker.add(
      Marker(
        infoWindow: InfoWindow(
          title: title ?? 'Location'
        ),
        markerId: MarkerId(markerId),
        position: point,
        onTap: () {
          direction = point;
          update();
        },
      )
    );
    update();
  }

  void hideButton()async{
    polylines.clear();
    marker.clear();
    await getData();
    direction = LatLng(0, 0);
    update();
  }

}