import 'package:carousel_slider/carousel_slider.dart';
import 'package:chargemod_assignment/features/HomePage/Models/ChargerLocation.dart';
import 'package:chargemod_assignment/features/HomePage/blocs/home_bloc.dart';
import 'package:chargemod_assignment/features/HomePage/blocs/home_event.dart';
import 'package:chargemod_assignment/features/HomePage/blocs/home_state.dart';
import 'package:chargemod_assignment/utilities/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<ChargerLocation> locationList = [
    ChargerLocation(name: "Anant Raj", street1: "14", street2: "Jawahar Nagar", city: "Bareilly", state: "UP"),
    ChargerLocation(name: "Aditya Raj", street1: "13", street2: "Nehru Nagar", city: "Bareilly", state: "UP"),
    ChargerLocation(name: "ASDFG Raj", street1: "15", street2: "Jawahar Nagar", city: "Bareilly", state: "UP"),
  ];
  HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        listener: (context, state){},
        builder: (context, state){
          switch(state.runtimeType){
            case HomeLocationChargersLoadedSuccessfullyState:
              final successState = state as HomeLocationChargersLoadedSuccessfullyState;
              return SafeArea(
                child: Container(
                  height: height,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/map.png'),
                                fit: BoxFit.fitHeight
                            )
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 16),
                          width: width,
                          //height: 200,
                          child: CarouselSlider(
                            options: CarouselOptions(height: 100.0),
                            items: successState.chargerLocations.map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Card(
                                    elevation: 5,
                                    child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        height: 100,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(i.name!, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, fontFamily: "Poppins", color: ColorConstants.chargemodBlack),),
                                            Text("${i.street1}, ${i.street2}, ${i.city}, ${i.state}", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, fontFamily: "Poppins", color: ColorConstants.chargemodGrey),)
                                          ],
                                        )
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            case HomeLocationChargersLoadingState:
              return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(ColorConstants.chargemodOrange),),);
            default:
              return Container();
          }
        },
      )
    );
  }
}
