import 'package:chargemod_assignment/utilities/color_constants.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  final String isoCode;
  final String phoneNumber;
  const OTPScreen({Key? key, required this.isoCode, required this.phoneNumber}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back, color: ColorConstants.chargemodBlack,size: 20,)),
        title: Text("Verification", style: TextStyle(color: ColorConstants.chargemodBlack, fontSize: 16, fontWeight: FontWeight.w400, fontFamily: "Poppins"),),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              Text("We’ve send you the verification\ncode on +${widget.isoCode} ${widget.phoneNumber}", style: TextStyle(color: ColorConstants.chargemodBlack, fontSize: 14, fontWeight: FontWeight.w400, fontFamily: "ABeeZee"),textAlign: TextAlign.center,)
            ],
          ),
        ),
      ),
    );
  }
}
