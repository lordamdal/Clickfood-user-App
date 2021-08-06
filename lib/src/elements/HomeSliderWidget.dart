import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/app_config.dart' as config;
import '../helpers/helper.dart';
import '../models/route_argument.dart';
import '../models/slide.dart';
import 'HomeSliderLoaderWidget.dart';

class HomeSliderWidget extends StatefulWidget {
  final List<Slide> slides;

  @override
  _HomeSliderWidgetState createState() => _HomeSliderWidgetState();

  HomeSliderWidget({Key key, this.slides}) : super(key: key);
}

class _HomeSliderWidgetState extends State<HomeSliderWidget> {
  int _current = 0;
  AlignmentDirectional _alignmentDirectional;

  @override
  Widget build(BuildContext context) {
    return widget.slides == null || widget.slides.isEmpty
        ? HomeSliderLoaderWidget()
        : Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                height: 180,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                    _alignmentDirectional = Helper.getAlignmentDirectional(widget.slides.elementAt(index).textPosition);
                  });
                },
              ),
              items: widget.slides.map((Slide slide) {
                return Builder(
                  builder: (BuildContext context) {
                    return InkWell(
                      onTap: (){
                        if (slide.restaurant != null) {
                          Navigator.of(context)
                              .pushNamed('/Details', arguments: RouteArgument(id: '0', param: slide.restaurant.id, heroTag: 'home_slide'));
                        } else if (slide.food != null) {
                          Navigator.of(context).pushNamed('/Food', arguments: RouteArgument(id: slide.food.id, heroTag: 'home_slide'));
                        }
                      },
                    //  margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    //  height: 40,
                      // decoration: BoxDecoration(
                      //   boxShadow: [
                      //     BoxShadow(color: Theme.of(context).focusColor.withOpacity(0.15), blurRadius: 15, offset: Offset(0, 2)),
                      //   ],
                      // ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: CachedNetworkImage(
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.fill,
                       //   fit: Helper.getBoxFit(slide.imageFit),
                          imageUrl: slide.image.url,
                          placeholder: (context, url) => Image.asset(
                            'assets/img/loading.gif',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 140,
                          ),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 22, horizontal: 42),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: widget.slides.map((Slide slide) {
                  return Container(
                    width: 20.0,
                    height: 3.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        color: _current == widget.slides.indexOf(slide)
                            ? Helper.of(context).getColorFromHex(slide.indicatorColor)
                            : Helper.of(context).getColorFromHex(slide.indicatorColor).withOpacity(0.3)),
                  );
                }).toList(),
              ),
            ),
          ],
        );
  }
}
