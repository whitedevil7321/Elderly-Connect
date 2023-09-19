import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

// ignore: camel_case_types
class volvideoCalling3 extends StatefulWidget {
  const volvideoCalling3({super.key});

  @override
  State<volvideoCalling3> createState() => _volvideoCalling3State();
}

// ignore: camel_case_types
class _volvideoCalling3State extends State<volvideoCalling3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ZegoUIKitPrebuiltCall(
        appID: 365566377,
        appSign:
            "a90bc5e6ddbbd706ceb86e5b02fa877cff63385528baa027759197744f198a5d",
        callID: "123",
        userID: "9630",
        userName: "Virendra Dhanray",
        config: ZegoUIKitPrebuiltCallConfig.groupVideoCall()
          ..onOnlySelfInRoom = (context) => Navigator.pop(context),
      )),
    );
  }
}
