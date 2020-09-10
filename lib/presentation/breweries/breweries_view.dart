import 'package:assignment/presentation/breweries/breweries_viewmodel.dart';
import 'package:assignment/presentation/breweries/widgets/brewery_item_widget.dart';
import 'package:assignment/presentation/model/breweries_item.dart';
import 'package:assignment/providers/providers.dart';
import 'package:assignment/utils/constants.dart';
import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;


class BreweriesView extends StatefulWidget {
  final BreweriesViewModel _breweriesViewModel;

  BreweriesView(this._breweriesViewModel);

  @override
  _BreweriesViewState createState() => _BreweriesViewState(_breweriesViewModel);
}

class _BreweriesViewState extends State<BreweriesView> {
  final BreweriesViewModel _breweriesViewModel;

  _BreweriesViewState(this._breweriesViewModel);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: _buildAppBar()),
        backgroundColor: Colors.white,
        body: StreamBuilder<List<BreweriesItem>>(
            stream:  breweriesStream,
            builder: (BuildContext context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(
                    child: Container(
                      child: Text(
                        Constants.NO_NETWORK_FOUND,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                  break;
                case ConnectionState.active:
                  if (snapshot.hasData) {
                    List<BreweriesItem> breweriesList = snapshot.data;
                    _breweriesViewModel.breweriesItem =
                    breweriesList[_breweriesViewModel.selectedIndex];
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildListBreweriesListView(breweriesList),
                        Container(
                          width: 1,
                          color: Color.fromRGBO(211,211,211,1),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(top: 30, left: 50,bottom: 30),
                            child: _breweriesViewModel.breweriesItem != null
                                ? _getBreweryDetails()
                                : Container(),
                          ),
                        )
                      ],
                    );
                  }
                  else if (snapshot.hasError) {
                    return Center(
                      child: Container(
                        child: Text(
                          Constants.NO_DATA_FOUND,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  }
                  return Container();
                  break;
                default:
                  return Container();
              }
            }),
      ),
    );
  }

  /// display List of breweries widget
  Widget _buildListBreweriesListView(List<BreweriesItem> breweriesList){
    return Container(
      width: 250,
      child: Padding(
          padding: EdgeInsets.only(left: 6),
          child: ListView.separated(
            shrinkWrap: true,
            primary: false,
            itemCount: breweriesList.length,
            itemBuilder:
                (BuildContext context, int currentIndex) {
              return BreweryItemWidget(
                onTap: () {
                  setState(() {
                    _breweriesViewModel.breweriesItem =
                    breweriesList[currentIndex];
                    _breweriesViewModel.selectedIndex =
                        currentIndex;
                  });
                },
                currentIndex: currentIndex,
                selectedIndex:
                _breweriesViewModel.selectedIndex,
                breweryName:
                breweriesList[currentIndex].name,
              );
            },
            separatorBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 6),
                child: Container(
                  height: 0.2,
                  color: Color.fromRGBO(211,211,211,1),
                ),
              );
            },
          )),
    );
  }

  /// Get Brewery Details View
  Widget _getBreweryDetails(){
   return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Text(
              Constants.BREWERY_DETAILS,
              style: TextStyle(
                  color: Color.fromRGBO(56 ,62, 59,1),
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
            Container(
              margin: EdgeInsets.only(
                  right: 50, top: 30),
              height: 0.1,
              color: Color.fromRGBO(211,211,211,1),
            ),
            _getTitleWidget(Constants.NAME,Icons.person),
            _getText(_breweriesViewModel.breweriesItem.name,
                textColor: Color.fromRGBO(56 ,62, 59,1),
                fontWeight: FontWeight.w700,
                topPadding: 8,
                fontSize: 19),
            _getTitleWidget(Constants.BREWERY_TYPE,Icons.crop_square),
            _getText(_breweriesViewModel
                .breweriesItem.breweryType,
                textColor: Color.fromRGBO(56 ,62, 59,1),
                fontWeight: FontWeight.w700,
                topPadding: 8,
                fontSize: 19),
            _getTitleWidget(Constants.ADDRESS,Icons.home),
            _getText(_breweriesViewModel
                .breweriesItem.formatedAddress,
                textColor: Color.fromRGBO(56 ,62, 59,1),
                fontWeight: FontWeight.w700,
                topPadding: 8,
                fontSize: 19),
            _getTitleWidget(Constants.CONTACT,Icons.phone),
            _getText(_breweriesViewModel
                .breweriesItem.phone,
                textColor: Color.fromRGBO(56 ,62, 59,1),
                fontWeight: FontWeight.w700,
                topPadding: 8,
                fontSize: 19),
            _getTitleWidget(Constants.VISIT,Icons.public),
            InkWell(
              onTap: (){
                if(_breweriesViewModel.breweriesItem.websiteUrl.isNotEmpty){
                  js.context.callMethod("open", [_breweriesViewModel.breweriesItem.websiteUrl]);
                }
              },
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: _getText(_breweriesViewModel
                  .breweriesItem.websiteUrl,
                  textColor: Colors.blue,
                  fontWeight: FontWeight.w700,
                  topPadding: 8,
                  isUrl: true,
                  fontSize: 19),
            ),
          ],
        ),
      ),
    );
  }

  /// build app bar
  Widget _buildAppBar(){
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.5,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(top: 3, left: 20),
        child: Text(
          Constants.BREWERIES_TITLE,
          style: TextStyle(
              color: Colors.pink,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  /// get name title widget
  Widget _getTitleWidget(String title,IconData icon){
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 42,right: 3,left: 3),
          child: Icon(icon,color: Color.fromRGBO(197 ,197, 197,1),size: 18,),
        ),
        _getText(title,
            textColor: Color.fromRGBO(197 ,197, 197,1),
            fontWeight: FontWeight.w500,
            topPadding: 40,
            rightPadding: 3,
            fontSize: 14),
      ],
    );
  }

  /// common text widget
  Widget _getText(String data,
      {double fontSize = 20,
        FontWeight fontWeight = FontWeight.w600,
        Color textColor = Colors.black,
        double topPadding = 15,
        double rightPadding = 20,
        bool isUrl = false}) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding, right: rightPadding),
      child: Text(
        data,
        style: TextStyle(
            decoration: isUrl ? TextDecoration.underline : null,
            color: textColor, fontSize: fontSize, fontWeight: fontWeight),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _breweriesViewModel.getBreweries();
  }

  @override
  void dispose() {
    super.dispose();
    streamController.close();
  }
}
