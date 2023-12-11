import 'dart:developer';

import 'package:chargemod_assignment/utilities/color_constants.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  Widget _buildDropdownItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          // Text("+${country.phoneCode}(${country.isoCode})"),
        ],
      );

  final formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          alignment: Alignment.center,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height / 6,
                ),
                const Text(
                  "ChargeMOD",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                const Text(
                  "Let's Start",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                      fontSize: 40),
                ),
                const Text(
                  "From Login",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                      fontSize: 40,
                      color: ColorConstants.chargemodOrange),
                ),
                SizedBox(
                  height: height * 0.06,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: ColorConstants.chargemodLightestGrey)),
                      child: CountryPickerDropdown(
                        initialValue: 'in',
                        itemBuilder: _buildDropdownItem,
                        onValuePicked: (Country country) {
                          //print("${country.name}");
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      height: 50,
                      width: 219,
                      child: TextFormField(
                          controller: phoneNumberTEC,
                          keyboardType: TextInputType.number,
                          cursorColor: ColorConstants.chargemodGrey,
                          validator: (String? val){
                            if(val!.length != 10) return "Enter a valid phone number.";
                            return null;
                          },
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.phone_outlined),
                              labelText: "Enter phone number",
                              hintStyle: TextStyle(
                                  fontFamily: "ABeeZee",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                              labelStyle: TextStyle(
                                  fontFamily: "ABeeZee",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: ColorConstants.chargemodGrey),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                borderSide: BorderSide(
                                    color:
                                        ColorConstants.chargemodLightestGrey),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                borderSide: BorderSide(
                                    color:
                                        ColorConstants.chargemodLightestGrey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                borderSide: BorderSide(
                                    color:
                                        ColorConstants.chargemodLightestGrey),
                              ))),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                GestureDetector(
                  onTap: (){
                    if(formKey.currentState!.validate()){
                      log(phoneNumberTEC.text);
                    }
                  },
                  child: Container(
                    height: 38,
                    width: 289,
                    decoration: BoxDecoration(
                        color: ColorConstants.chargemodOrange,
                        borderRadius: BorderRadius.circular(6)),
                    child: const Center(
                      child: Text(
                        "Send OTP",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontFamily: "Poppins"),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                const Text(
                  "By Continuing you agree to our",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: ColorConstants.chargemodBlack,
                      fontFamily: "ABeeZee"),
                ),
                const Text.rich(TextSpan(
                    text: 'Terms & Condition ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ColorConstants.chargemodOrange,
                        fontFamily: "ABeeZee"),
                    children: <InlineSpan>[
                      TextSpan(
                        text: 'and ',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: ColorConstants.chargemodBlack,
                            fontFamily: "ABeeZee"),
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: ColorConstants.chargemodOrange,
                            fontFamily: "ABeeZee"),
                      )
                    ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
