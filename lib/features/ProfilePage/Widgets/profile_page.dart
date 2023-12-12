import 'package:chargemod_assignment/utilities/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Widget listItem(String title, String iconImage) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: ColorConstants.chargemodBlack),
      ),
      leading: Container(
        height: 39,
        width: 39,
        decoration: BoxDecoration(
          color: ColorConstants.chargemodLightestGrey,
          shape: BoxShape.circle,
        ),
        child: Center(
            child: SvgPicture.asset(
          "assets/images/$iconImage",
          height: 20,
          width: 20,
        )),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: ColorConstants.chargemodBlack,
        size: 14,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Text(
                    "Hello",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                        color: ColorConstants.chargemodGrey),
                  ),
                  Text(
                    "Anant Raj",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                        color: ColorConstants.chargemodBlack),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Card(
                    elevation: 5,
                    color: ColorConstants.white,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                      height: 131,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              image: AssetImage(
                                "assets/images/profile_badge_bg.png",
                              ),
                              fit: BoxFit.fitWidth)),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Energy Balance",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                    color: ColorConstants.chargemodGrey),
                              ),
                              Text(
                                "99999 kWH",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Poppins",
                                    color: ColorConstants.chargemodBlack),
                              ),
                              Text(
                                "Added 100 kWH on 20/11/2022",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Poppins",
                                    color: ColorConstants.chargemodGrey),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5, top: 10),
                                height: 24,
                                width: 126,
                                decoration: BoxDecoration(
                                    color: ColorConstants.brightGreen,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                  child: Text(
                                    "+ Add Energy",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontFamily: "Poppins"),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/images/profile_badge.svg",
                                semanticsLabel: 'profileBadge',
                                height: 54,
                                width: 54,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5, top: 14),
                                height: 24,
                                width: 126,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: ColorConstants.chargemodBlack)),
                                child: const Center(
                                  child: Text(
                                    "55 Points",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: ColorConstants.chargemodBlack,
                                        fontFamily: "Poppins"),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.035,
                  ),
                  Card(
                    elevation: 5,
                    surfaceTintColor: ColorConstants.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        listItem("My Payments", "my_payments_icon.svg"),
                        Divider(),
                        listItem("My Electric Vehicles",
                            "my_electric_vehicles_icon.svg"),
                        Divider(),
                        listItem("My Favorite Stations",
                            "my_favorite_stations_icon.svg"),
                        Divider(),
                        listItem("Alpha Membership", "alpha_membership.svg"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.035,
                  ),
                  Container(
                    height: 38,
                    decoration: BoxDecoration(
                        color: ColorConstants.chargemodOrange,
                        borderRadius: BorderRadius.circular(6)),
                    child: const Center(
                      child: Text(
                        "Buy Machines From chargeMOD",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontFamily: "Poppins"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.035,
                  ),
                  Card(
                    elevation: 5,
                    surfaceTintColor: ColorConstants.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        listItem("My Devices", "my_devices_icon.svg"),
                        Divider(),
                        listItem("My Orders", "my_orders_icon.svg"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.035,
                  ),
                  Card(
                    elevation: 5,
                    surfaceTintColor: ColorConstants.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        listItem("Help", "help_icon.svg"),
                        Divider(),
                        listItem("Raise Complaint", "raise_complaint_icon.svg"),
                        Divider(),
                        listItem("About Us", "about_us_icon.svg"),
                        Divider(),
                        listItem("Privacy Policy", "privacy_policy.svg"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.035,
                  ),
                  Container(
                    height: 38,
                    decoration: BoxDecoration(
                        color: ColorConstants.chargemodOrange,
                        borderRadius: BorderRadius.circular(6)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/images/logout_icon.svg"),
                          Text(
                            "  Logout",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontFamily: "Poppins"),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  SvgPicture.asset(
                    "assets/images/chargemod_image_logo.svg",
                    height: 30,
                    width: 30,
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Text(
                    "V 1.0.0 (001)",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontFamily: "Poppins"),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Text(
                    "Copyright © 2022 BPM Power Pvt Ltd.",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontFamily: "Poppins"),
                  ),
                  Text(
                    "All rights reserved.",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontFamily: "Poppins"),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
