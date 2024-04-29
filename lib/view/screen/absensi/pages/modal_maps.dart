import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:portal_pns_flutter/helper/location_helper.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ModalMaps extends StatefulWidget {
  final Position position;
  final String address;
  const ModalMaps({Key? key, required this.position, required this.address})
      : super(key: key);

  @override
  State<ModalMaps> createState() => _ModalMapsState();
}

class _ModalMapsState extends State<ModalMaps> {
  late GoogleMapController _controller;
  late String _mapStyle;
  Set<Marker> _markers = {};
  bool loaction = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initMapsStyle();
  }

  void _initMapsStyle() async {
    await rootBundle.loadString('assets/maps_style.txt').then((value) {
      setState(() {
        _mapStyle = value;
      });
    });

    _markers = await LocationHelper.updateMarker(
            widget.position.latitude, widget.position.longitude)
        .then((value) => value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Adaptive.w(95),
      // height: Adaptive.h(85),
      child: StatefulBuilder(
        builder: (context, snapshot) {
          return Card(
            clipBehavior: Clip.antiAlias,
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                  width: Adaptive.w(95),
                  height: Adaptive.h(50),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: GoogleMap(
                    zoomControlsEnabled: false,
                    myLocationButtonEnabled: false,
                    onMapCreated: (controller) async {
                      controller.setMapStyle(_mapStyle);
                      await controller
                          .animateCamera(
                        CameraUpdate.newCameraPosition(
                          CameraPosition(
                            target: LatLng(widget.position.latitude,
                                widget.position.longitude),
                            zoom: 18,
                          ),
                        ),
                      )
                          .then((value) {
                        setState(() {
                          loaction = true;
                        });
                      });
                    },
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(
                        -4.9421465,
                        103.5724899,
                      ), // San Francisco coordinates
                      zoom: 10,
                    ),
                    markers: _markers,
                  ),
                ),
                Container(
                  width: Adaptive.w(95),
                  height: Adaptive.h(50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: Adaptive.h(2), horizontal: Adaptive.h(2)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () => Navigator.of(context).pop(),
                              child: Container(
                                padding: EdgeInsets.all(Adaptive.h(0.5)),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 7,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.close_rounded,
                                  size: 18.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (loaction)
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            vertical: Adaptive.h(2),
                            horizontal: Adaptive.h(3),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lokasi anda saat ini',
                                style: poppinsBold.copyWith(fontSize: 12.sp),
                              ),
                              // SizedBox(height: Adaptive.h(0.5)),
                              Text(
                                widget.address,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: poppinsRegular.copyWith(fontSize: 14.sp),
                              ),
                            ],
                          ),
                        )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
