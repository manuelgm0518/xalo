import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xalo/app_themes.dart';

class UdemyCard extends StatelessWidget {
  const UdemyCard({Key key, this.background, this.title, this.price, this.url}) : super(key: key);

  final String background;
  final String title;
  final String price;
  final String url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ClipRRect(
          borderRadius: kCircular,
          child: Container(
            width: Get.width / 2,
            height: Get.width / 2.5,
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.network(background, width: Get.width / 2, height: Get.height / 2.5, fit: BoxFit.cover),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      end: Alignment(0, -1),
                      begin: Alignment.bottomCenter,
                      colors: <Color>[Colors.black, Colors.transparent],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(title, maxLines: 2, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18), overflow: TextOverflow.ellipsis, softWrap: false),
                    Text(price, style: TextStyle(color: kAccentColor, fontSize: 16))
                  ],
                ).paddingAll(kSpacing),
                Align(
                  alignment: Alignment.topRight,
                  child: SvgPicture.network('https://www.udemy.com/staticx/udemy/images/v6/logo-coral.svg', width: 80),
                ).marginAll(kSpacing / 2)
              ],
            ),
          ),
        ),
      ),
      onTap: () => launch(url),
    );
  }
}
