import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helloapp/constants/Static.dart';
import 'package:helloapp/model/user_model.dart';
import 'package:helloapp/service/user_service.dart';
import 'package:uuid/uuid.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class AudioCall extends StatefulWidget {
  const AudioCall({Key? key}) : super(key: key);

  @override
  _AudioCallState createState() => _AudioCallState();
}

class _AudioCallState extends State<AudioCall> {
  late UserModal loggedInUser;
  late String callID;

  @override
  void initState() {
    super.initState();
    _fetchLoggedInUser();
    callID = generateCallID();
    storeCallID(callID);
  }

  void _fetchLoggedInUser() async {
    loggedInUser = await UserService.fetchLoggedInUser();
    setState(() {});
  }

  String generateCallID() {
    var uuid = Uuid();
    return uuid.v4();
  }

  void storeCallID(String callID) {
    final CollectionReference callsCollection =
        FirebaseFirestore.instance.collection('calls');
    callsCollection.doc(callID).set({'active': true});
  }

  @override
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModal>(
      future: UserService.fetchLoggedInUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          loggedInUser = snapshot.data!;
          return ZegoUIKitPrebuiltCall(
            appID: Static.appId,
            appSign: Static.appSign,
            callID: callID,
            userID: loggedInUser.uid!,
            userName: loggedInUser.name!,
            plugins: [ZegoUIKitSignalingPlugin()],
            config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall(),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        // Show a loading indicator while fetching the logged-in user
        return const CircularProgressIndicator();
      },
    );
  }
}
