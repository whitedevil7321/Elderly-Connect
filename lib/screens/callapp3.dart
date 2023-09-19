import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

// ignore: camel_case_types
class videoCalling3 extends StatefulWidget {
  const videoCalling3({super.key});

  @override
  State<videoCalling3> createState() => _videoCalling3State();
}

// ignore: camel_case_types
class _videoCalling3State extends State<videoCalling3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ZegoUIKitPrebuiltCall(
        appID: 365566377,
        appSign:
            "a90bc5e6ddbbd706ceb86e5b02fa877cff63385528baa027759197744f198a5d",
        callID: "123",
        userID: "9908",
        userName: "Virendra Dhanray",
        config: ZegoUIKitPrebuiltCallConfig.groupVideoCall()
          ..onOnlySelfInRoom = (context) => Navigator.pop(context),
      )),
    );
  }
}
