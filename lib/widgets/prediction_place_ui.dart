import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wheelz/global/api.dart';
import 'package:wheelz/global/singleton.dart';
import 'package:wheelz/user/appInfo/app_info.dart';
import 'package:wheelz/user/models/address_model.dart';
import 'package:wheelz/user/models/prediction_model.dart';

class PredictionPlaceUI extends StatefulWidget {
  PredictionModel? predictedPlaceData;
  Function? selectDropOff;

  PredictionPlaceUI({
    super.key,
    this.predictedPlaceData,
    this.selectDropOff,
  });

  @override
  State<PredictionPlaceUI> createState() => _PredictionPlaceUIState();
}

class _PredictionPlaceUIState extends State<PredictionPlaceUI> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        AddressModel dropOffLocation = AddressModel();
        dropOffLocation.placeName = widget.predictedPlaceData!.main_text;
        dropOffLocation.latitudePosition = widget.predictedPlaceData!.lat;
        dropOffLocation.longitudePosition = widget.predictedPlaceData!.long;
        Provider.of<AppInfo>(context, listen: false)
            .updateDropOffLocation(dropOffLocation);

        Navigator.pop(context);
        Singleton().dropOff = dropOffLocation;
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
      ),
      child: SizedBox(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Icon(
                  Icons.share_location,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 13,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.predictedPlaceData!.main_text.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        widget.predictedPlaceData!.secondary_text.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
