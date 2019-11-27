# animated_overflow

[comment]: <> (Badges)
<a href="https://www.cosmossoftware.coffee">
   <img alt="Cosmos Software" src="https://img.shields.io/badge/Cosmos%20Software-Love%20Code-red" />
</a>

[![Pub](https://img.shields.io/pub/v/animated_overflow?color=g)](https://pub.dev/packages/animated_overflow)
[![License](https://img.shields.io/github/license/aliyigitbireroglu/flutter-animated-overflow?color=blue)](https://github.com/aliyigitbireroglu/flutter-animated-overflow/blob/master/LICENSE)

[comment]: <> (Introduction)
A simple widget for animating overflowing content horizontally or vertically with fade.

[comment]: <> (ToC)
[Media](#media) | [Description](#description) | [How-to-Use](#howtouse)


[comment]: <> (Media)
<a name="media"></a>
## Media

Watch on **Youtube**:

[v1.0.0](https://youtu.be/8Mq5oD5cWiw)
<br><br>
<img src="https://www.cosmossoftware.coffee/Common/Portfolio/GIFs/FlutterAnimatedOverflow.gif" height="450" max-height="450"/>
<br><br>


[comment]: <> (Description)
<a name="description"></a>
## Description
This is a simple widget for animating overflowing content horizontally or vertically with fade.


[comment]: <> (How-to-Use)
<a name="howtouse"></a>
## How-to-Use
Simply create an AnimatedOverflow as shown in the example:

```
AnimatedOverflow({
    Key key,
    animatedOverflowDirection,
    child,
    maxHeight,
    maxWidth,
    padding : 0.0,
    speed   : 50})
```

**Further Explanations:**

*For a complete set of descriptions for all parameters and methods, see the [documentation](https://pub.dev/documentation/animated_overflow/latest/).*

* The [animatedOverflowDirection] and [child] can't be null.
* The [maxHeight] is only considered if [animatedOverflowDirection] is [AnimatedOverflowDirection.VERTICAL] and it should not be null.
* The [maxWidth] is only considered if [animatedOverflowDirection] is [AnimatedOverflowDirection.HORIZONTAL] and it should not be null.


[comment]: <> (Notes)
## Notes
Any help, suggestion or criticism is appreciated! 

Cheers.

[comment]: <> (CosmosSoftware)
<br><br>
<img align="right" src="https://www.cosmossoftware.coffee/Common/Images/CosmosSoftwareIconTransparent.png" width="150" height="150"/>
<br><br>
