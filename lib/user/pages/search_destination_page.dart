import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wheelz/global/global_var.dart';
import 'package:wheelz/methods/common_methods.dart';
import 'package:wheelz/user/models/prediction_model.dart';
import 'package:wheelz/user/models/search_info.dart';
import 'package:wheelz/widgets/prediction_place_ui.dart';

import '../appInfo/app_info.dart';

class SearchDestinationPage extends StatefulWidget {
  const SearchDestinationPage({super.key});

  @override
  State<SearchDestinationPage> createState() => _SearchDestinationPageState();
}

class _SearchDestinationPageState extends State<SearchDestinationPage> {
  var accessToken =
      'pk.eyJ1IjoiamVhZnJlZXp5IiwiYSI6ImNrYmpicjczYjBucjIyeGxzNGRjNHMxejEifQ.bY_8hqCiG-LBMG1xXreqdA';
  TextEditingController pickUpTextEditingController = TextEditingController();
  TextEditingController destinationTextEditingController =
      TextEditingController();
  List<PredictionModel> dropOffPredictionsPlacesList = [];
  List<SearchInfo> items = [];

  void placeAutoComplete(String val) async {
    await addressSuggestion(val).then((value) {
      setState(() {
        items = value;
      });
    });
  }

  Future<List<SearchInfo>> addressSuggestion(String address) async {
    try {
      // Central geopoint
      double latitude = 7.3045349;
      double longitude = 5.1294792;
      int limit = 10;

      Response response = await Dio().get(
        "https://photon.komoot.io/api/",
        queryParameters: {
          "q": address,
          "lat": latitude,
          "lon": longitude,
          "limit": limit,
        },
      );

      final responseData = response.data;

      if (responseData is Map) {
        var featuresList = List.from(responseData["features"] ?? []);
        var predictionsList = featuresList.map((place) {
          String name = place['properties']['name'] ?? '';
          return PredictionModel(main_text: name);
        }).toList();

        setState(() {
          dropOffPredictionsPlacesList = predictionsList;
        });

        return featuresList
            .map((feature) => SearchInfo.fromJson(feature))
            .toList();
      } else {
        log("Invalid response format: $responseData");
        return [];
      }
    } catch (e) {
      log("Error in addressSuggestion: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AppInfo>(builder: (context, appInfo, _) {
        if (appInfo.pickUpLocation != null &&
            appInfo.pickUpLocation!.humanReadableAddress != null) {
          String userAddress = appInfo.pickUpLocation!.humanReadableAddress!;
          pickUpTextEditingController.text = userAddress;
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              Card(
                elevation: 10,
                child: Container(
                  height: 230,
                  decoration: const BoxDecoration(
                    color: Colors.black12,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5.0,
                        spreadRadius: 0.5,
                        offset: Offset(0.7, 0.7),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 24, top: 48, right: 24, bottom: 20),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 6,
                        ),

                        //icon button - title
                        Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                            const Center(
                              child: Text(
                                "Set Dropoff Location",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 18,
                        ),

                        //pickup text field
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/initial.png",
                              height: 16,
                              width: 16,
                            ),
                            const SizedBox(
                              width: 18,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: TextField(
                                    controller: pickUpTextEditingController,
                                    decoration: const InputDecoration(
                                        hintText: "Pickup Address",
                                        fillColor: Colors.white12,
                                        filled: true,
                                        border: InputBorder.none,
                                        isDense: true,
                                        contentPadding: EdgeInsets.only(
                                            left: 11, top: 9, bottom: 9)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 11,
                        ),

                        //destination text field
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/final.png",
                              height: 16,
                              width: 16,
                            ),
                            const SizedBox(
                              width: 18,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: TextField(
                                    controller:
                                        destinationTextEditingController,
                                    onChanged: (inputText) {
                                      // searchLocation(inputText, searchBounds);
                                      if (inputText != "") {
                                        placeAutoComplete(inputText);
                                      } else {
                                        items.clear();
                                        setState(() {});
                                      }
                                    },
                                    decoration: const InputDecoration(
                                        hintText: "Destination Address",
                                        fillColor: Colors.white12,
                                        filled: true,
                                        border: InputBorder.none,
                                        isDense: true,
                                        contentPadding: EdgeInsets.only(
                                            left: 11, top: 9, bottom: 9)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // ...items
              //     .map((e) => ListTile(
              //           leading: const Icon(Icons.place),
              //           title: Text(e.properties!.name!),
              //         ))
              //     .toList(),
              //display prediction results for destination place
              (dropOffPredictionsPlacesList.length > 0)
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: ListView.separated(
                        padding: const EdgeInsets.all(0),
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 3,
                            child: PredictionPlaceUI(
                              predictedPlaceData:
                                  dropOffPredictionsPlacesList[index],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(
                          height: 2,
                        ),
                        itemCount: dropOffPredictionsPlacesList.length,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                      ),
                    )
                  : Container(),
            ],
          ),
        );
      }),
    );
  }
}
