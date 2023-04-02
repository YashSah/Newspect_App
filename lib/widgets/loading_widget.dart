import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter/consts/vars.dart';
import 'package:news_flutter/services/utils.dart';
import 'package:news_flutter/widgets/vertical_spacing.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  BorderRadius borderRadius = BorderRadius.circular(18);
  late Color baseShimmerColor, highlightShimmerColor, widgetShimmerColor;

  @override
  void didChangeDependencies() {
    var utils= Utils(context);
    baseShimmerColor=utils.baseShimmerColor;
    highlightShimmerColor=utils.highlightShimmerColor;
    widgetShimmerColor=utils.widgetShimmerColor;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return Expanded(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (ctx, index){
          return ArticlesShimmerEffectWidget(baseShimmerColor: baseShimmerColor, highlightShimmerColor: highlightShimmerColor, size: size, borderRadius: borderRadius, widgetShimmerColor: widgetShimmerColor);
        }),
    );
  }
}

class ArticlesShimmerEffectWidget extends StatelessWidget {
  const ArticlesShimmerEffectWidget({
    Key? key,
    required this.baseShimmerColor,
    required this.highlightShimmerColor,
    required this.size,
    required this.borderRadius,
    required this.widgetShimmerColor,
  }) : super(key: key);

  final Color baseShimmerColor;
  final Color highlightShimmerColor;
  final Size size;
  final BorderRadius borderRadius;
  final Color widgetShimmerColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        child: Stack(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 60,
                    width: 60,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Container(
                  color: Theme
                      .of(context)
                      .cardColor,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  child: Shimmer.fromColors(
                    baseColor: baseShimmerColor,
                    highlightColor: highlightShimmerColor,
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              color: widgetShimmerColor,
                                height: size.height * 0.12,
                                width: size.height * 0.12,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                               height: size.height*0.06,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: borderRadius,
                                  color: widgetShimmerColor,
                                ),
                              ),
                              const VerticalSpacing(5),
                              Align(
                                alignment: Alignment.topRight,
                                child:Container(
                                  height: size.height*0.025,
                                  width: size.width*0.4,
                                  decoration: BoxDecoration(
                                    borderRadius: borderRadius,
                                    color: Colors.red,
                                  ),
                                ),
                              ),

                              FittedBox(
                                child: Row(
                                  children: [

                                    ClipOval(
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                      color: widgetShimmerColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: size.height*0.025,
                                      width: size.width*0.4,
                                      decoration: BoxDecoration(
                                        borderRadius: borderRadius,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ]
          ),
        ),
      );
  }
}
