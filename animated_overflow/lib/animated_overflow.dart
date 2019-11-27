//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  © Cosmos Software | Ali Yigit Bireroglu                                                                                                          /
//  All material used in the making of this code, project, program, application, software et cetera (the "Intellectual Property")                    /
//  belongs completely and solely to Ali Yigit Bireroglu. This includes but is not limited to the source code, the multimedia and                    /
//  other asset files.                                                                                                                               /
//  If you were granted this Intellectual Property for personal use, you are obligated to include this copyright text at all times.                  /
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

import 'package:flutter/material.dart';

import 'package:simple_animations/simple_animations.dart';

enum AnimatedOverflowDirection {
  VERTICAL,
  HORIZONTAL,
}

class AnimatedOverflow extends StatefulWidget {
  ///Use this value to determine the direction of this [AnimatedOverflow].
  final AnimatedOverflowDirection animatedOverflowDirection;

  ///The widget that is to be displayed by this [AnimatedOverflow].
  final Widget child;

  ///The maximum height of this [AnimatedOverflow]. This value is only considered if [animatedOverflowDirection] is [AnimatedOverflowDirection.VERTICAL] and it should not be null.
  final double maxHeight;

  ///The maximum width of this [AnimatedOverflow]. This value is only considered if [animatedOverflowDirection] is [AnimatedOverflowDirection.HORIZONTAL] and it should not be null.
  final double maxWidth;

  ///The padding to be applied around the [child]. If [animatedOverflowDirection] is [AnimatedOverflowDirection.VERTICAL], this padding is applied around the top and the bottom of the [child]. Else, it is applied around the left and the right of the [child]. The [stops] of the [LinearGradient] are also determined by this value.
  final double padding;

  ///The speed of the animation of this [AnimatedOverflow].
  final double speed;

  const AnimatedOverflow({
    Key key,
    this.animatedOverflowDirection,
    this.child,
    this.maxHeight,
    this.maxWidth,
    this.padding: 0.0,
    this.speed: 50,
  })  : assert(animatedOverflowDirection != null && child != null),
        assert(animatedOverflowDirection != AnimatedOverflowDirection.VERTICAL || maxHeight != null),
        assert(animatedOverflowDirection != AnimatedOverflowDirection.HORIZONTAL || maxWidth != null),
        super(key: key);

  @override
  _AnimatedOverflowState createState() {
    return _AnimatedOverflowState();
  }
}

class _AnimatedOverflowState extends State<AnimatedOverflow> {
  GlobalKey _globalKey;
  ScrollController _scrollController;
  double _maxDimension;
  EdgeInsets _padding;
  Size _size;
  MultiTrackTween _multiTrackTween;
  DateTime _lastFrame;
  Duration _frameRate;
  bool _showSelf;

  AnimatedOverflowDirection get _animatedOverflowDirection => widget.animatedOverflowDirection;
  double get _dimensionOfInterest => _animatedOverflowDirection == AnimatedOverflowDirection.VERTICAL ? _size.height : _size.width;
  double get _containerWidth => _animatedOverflowDirection == AnimatedOverflowDirection.VERTICAL ? _size.width : _maxDimension;
  double get _containerHeight => _animatedOverflowDirection == AnimatedOverflowDirection.VERTICAL ? _maxDimension : _size.height;
  Alignment get _gradientBegin => _animatedOverflowDirection == AnimatedOverflowDirection.VERTICAL ? Alignment.topCenter : Alignment.centerLeft;
  Alignment get _gradientEnd => _animatedOverflowDirection == AnimatedOverflowDirection.VERTICAL ? Alignment.bottomCenter : Alignment.centerRight;
  Axis get _scrollDirection => _animatedOverflowDirection == AnimatedOverflowDirection.VERTICAL ? Axis.vertical : Axis.horizontal;
  bool get _shouldAnimate => _dimensionOfInterest > _maxDimension;

  void onPostFrameCallback(Duration duration) {
    if (_lastFrame != null) {
      _frameRate = Duration(milliseconds: DateTime.now().difference(_lastFrame).inMilliseconds);
    }
    _lastFrame = DateTime.now();
    if (!_showSelf) {
      setState(() {
        RenderBox _renderBox = _globalKey.currentContext.findRenderObject();
        _size = _renderBox.size;

        if (_shouldAnimate) {
          _multiTrackTween = MultiTrackTween(
            [
              Track("offset").add(
                Duration(seconds: (_renderBox.size.width / widget.speed).round()),
                Tween(begin: 0.0, end: _dimensionOfInterest - _maxDimension),
                curve: Curves.easeInOut,
              ),
            ],
          );
        }

        _showSelf = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _globalKey = GlobalKey();
    _scrollController = ScrollController(initialScrollOffset: 0.0);
    _maxDimension = _animatedOverflowDirection == AnimatedOverflowDirection.VERTICAL ? widget.maxHeight : widget.maxWidth;
    _padding = _animatedOverflowDirection == AnimatedOverflowDirection.VERTICAL ? EdgeInsets.only(top: widget.padding, bottom: widget.padding) : EdgeInsets.only(left: widget.padding, right: widget.padding);
    _frameRate = Duration(milliseconds: 1);
    _showSelf = false;
    WidgetsBinding.instance.addPostFrameCallback(onPostFrameCallback);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_showSelf) {
      if (_animatedOverflowDirection == AnimatedOverflowDirection.VERTICAL) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              key: _globalKey,
              child: Padding(
                padding: _padding,
                child: widget.child,
              ),
            ),
          ],
        );
      } else {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              key: _globalKey,
              child: Padding(
                padding: _padding,
                child: widget.child,
              ),
            ),
          ],
        );
      }
    } else if (_shouldAnimate) {
      return ControlledAnimation(
        playback: Playback.MIRROR,
        tween: _multiTrackTween,
        duration: _multiTrackTween.duration,
        builder: (BuildContext context, dynamic animation) {
          try {
            _scrollController.animateTo(animation["offset"], duration: _frameRate, curve: Curves.linear);
          } catch (_) {}
          return Container(
            width: _containerWidth,
            height: _containerHeight,
            child: ClipRect(
              child: ShaderMask(
                shaderCallback: (Rect rect) {
                  return LinearGradient(
                    begin: _gradientBegin,
                    end: _gradientEnd,
                    colors: [Colors.transparent, Colors.black, Colors.black, Colors.black, Colors.transparent],
                    stops: [
                      0.0,
                      widget.padding / _maxDimension,
                      0.5,
                      (_maxDimension - widget.padding) / _maxDimension,
                      1.0,
                    ],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: CustomScrollView(
                  controller: _scrollController,
                  scrollDirection: _scrollDirection,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        key: _globalKey,
                        child: Padding(
                          padding: _padding,
                          child: widget.child,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } else {
      return widget.child;
    }
  }
}
