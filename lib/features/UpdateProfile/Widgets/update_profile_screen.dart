import 'dart:developer';

import 'package:chargemod_assignment/bottom_navigation.dart';
import 'package:chargemod_assignment/features/UpdateProfile/blocs/update_profile_bloc.dart';
import 'package:chargemod_assignment/features/UpdateProfile/blocs/update_profile_event.dart';
import 'package:chargemod_assignment/features/UpdateProfile/blocs/update_profile_state.dart';
import 'package:chargemod_assignment/utilities/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateProfileScreen extends StatefulWidget {
  final String phoneNumber;
  const UpdateProfileScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {

  final formKey = GlobalKey<FormState>();
  TextEditingController firstNameTEC = TextEditingController();
  TextEditingController lastNameTEC = TextEditingController();
  TextEditingController emailNameTEC = TextEditingController();
  UpdateProfileBloc updateProfileBloc = UpdateProfileBloc();

  @override
  void initState() {
    super.initState();
    updateProfileBloc.add(UpdateProfileInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Update Profile", style: TextStyle(color: ColorConstants.chargemodBlack, fontSize: 16, fontWeight: FontWeight.w400, fontFamily: "Poppins"),),
      ),
      body: BlocConsumer<UpdateProfileBloc, UpdateProfileState>(
        bloc: updateProfileBloc,
        listener: (context, state){
          if(state is ProfileSavedSuccessfullyState){
            Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => BottomNavigation()), (route) => false);
          }
        },
        builder: (context, state){
          switch(state.runtimeType){
            case UpdateProfileInitialState:
              return SafeArea(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("First Name", style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: ColorConstants.chargemodBlack
                        )),
                        Container(
                          margin: EdgeInsets.only(top: 5, bottom: 20),
                          height: 41,
                          child: TextFormField(
                              controller: firstNameTEC,
                              keyboardType: TextInputType.name,
                              cursorColor: ColorConstants.chargemodGrey,
                              validator: (String? val){
                                if(val!.length == 0) return "Enter first name";
                                return null;
                              },
                              decoration: const InputDecoration(
                                  labelText: "First Name",
                                  hintStyle: TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                      color: ColorConstants.chargemodGrey,
                                      fontSize: 12),
                                  labelStyle: TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
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
                        const Text("Last Name", style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: ColorConstants.chargemodBlack
                        )),
                        Container(
                          margin: EdgeInsets.only(top: 5, bottom: 20),
                          height: 41,
                          child: TextFormField(
                              controller: lastNameTEC,
                              keyboardType: TextInputType.name,
                              cursorColor: ColorConstants.chargemodGrey,
                              validator: (String? val){
                                if(val!.length == 0) return "Enter last name";
                                return null;
                              },
                              decoration: const InputDecoration(
                                  labelText: "Last Name",
                                  hintStyle: TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                      color: ColorConstants.chargemodGrey,
                                      fontSize: 12),
                                  labelStyle: TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
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
                        const Text("Email", style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: ColorConstants.chargemodBlack
                        )),
                        Container(
                          margin: EdgeInsets.only(top: 5, bottom: 20),
                          height: 41,
                          child: TextFormField(
                              controller: emailNameTEC,
                              keyboardType: TextInputType.name,
                              cursorColor: ColorConstants.chargemodGrey,
                              validator: (value) {
                                if(value == null || value.isEmpty || !value.contains('@') || !value.contains('.')){
                                  return 'Enter valid email';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  labelText: "Email",
                                  hintStyle: TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                      color: ColorConstants.chargemodGrey,
                                      fontSize: 12),
                                  labelStyle: TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
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
                        const Text("Phone Number", style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: ColorConstants.chargemodBlack
                        )),
                        Container(
                          margin: EdgeInsets.only(top: 5, left: 5),
                          child: Text(widget.phoneNumber, style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: ColorConstants.chargemodGrey
                          )),
                        ),
                        Spacer(),
                        Container(
                          alignment: Alignment.center,
                          child: Text("Completing Your Profile", style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: ColorConstants.chargemodBlack
                          )),
                        ),
                        SizedBox(height: 5,),
                        Container(
                          alignment: Alignment.center,
                          child: Text("This action will reflect in your activities and payments after saving. We ask for email details for recieving monthly activity and notifications.", style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: ColorConstants.chargemodGrey
                          )),
                        ),
                        SizedBox(height: 10,),
                        Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: (){
                              if(formKey.currentState!.validate()){
                                log("validated");
                                updateProfileBloc.add(SaveUpdatedProfileEvent(firstName: firstNameTEC.text, lastName: lastNameTEC.text, email: emailNameTEC.text, phoneNumber: widget.phoneNumber));
                              }
                            },
                            child: Container(
                              height: 43,
                              width: width-30,
                              decoration: BoxDecoration(
                                  color: ColorConstants.chargemodOrange,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(
                                child: Text(
                                  "Save Changes",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      fontFamily: "ABeeZee"),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            case SavingProfileState:
              return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(ColorConstants.chargemodOrange),),);
            default:
              return Container();
          }
        },
        listenWhen: (prev, current){
          return current is UpdateProfileActionState;
        },
        buildWhen: (prev, current){
          return current is !UpdateProfileActionState;
        },
      ),
    );
  }
}