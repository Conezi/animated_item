# animated_item

#### A Flutter plugin that animates ListView and PageView item on scroll.

### Previews
---  

##### Animated item for [ListViews]

![](https://github.com/Conezi/animated_item/blob/main/demo/animated_item_preview.gif?raw=true)

##### Animated page for [PageViews]

![](https://github.com/Conezi/animated_item/blob/main/demo/animated_page_preview.gif?raw=true)

### Installation
---  

First, add `animated_item` as a dependency in your pubspec.yaml file.

```yaml
animated_item: ^<latest-version>
```

### Usage
---  
`AnimatedItem` uses the ScrollController's scroll offset to animate child in a [ListView].

```dart
ListView.builder(
  itemCount: colors.length,
  scrollDirection: Axis.horizontal,
  controller: _scaleController,
  itemBuilder: (context, index) {
    return AnimatedItem(
      controller: _scaleController,
      index: index,
      effect: const ScaleEffect(),
      child: Container(
        margin: const EdgeInsets.all(5.0),
        width: width,
        decoration: BoxDecoration(
          color: colors[index],
          borderRadius: _borderRadius),
      )
    );
  },
)
``` 

`AnimatedPage` uses the PageController's scroll offset to animate child in a [PageView].

```dart
PageView.builder(
  controller: _scaleController,
  itemCount: colors.length,
  itemBuilder: (context, index) {
    return AnimatedPage(
      controller: _scaleController,
      index: index,
      effect: const ScaleEffect(),
      child: Container(
        margin: const EdgeInsets.all(5.0),
        width: width,
        decoration: BoxDecoration(
          color: colors[index], 
          borderRadius: _borderRadius),
      )
    );
  },
)
```  

### Customization
---  

Here is a list of properties available to customize your effect:

| Name            | Type              | Description                                                                                  |
|-----------------|-------------------|----------------------------------------------------------------------------------------------|
| type            | AnimationType     | Determines start and end of effect.                                                          |
| snap            | bool              | If active items snaps back to original position when not scrolling.                          |
| animationAxis   | Axis              | Animation axis for [TranslateEffect].                                                        | 
| startOffset     | int               | The animation start offset for [TranslateEffect]. Use negative numbers to reverse translate. |
| alignment       | AlignmentGeometry | The alignment of the origin, relative to the size of the child.                              |
| verticalScale   | double            | Scale effect vertically.                                                                     |
| horizontalScale | double            | Scale effect horizontally.                                                                   |
| rotationAngle   | double            | Rotation angle for [RotateEffect].                                                           |
| opacity         | double            | Opacity determines how faded the item becomes. Higher numbers results to more fading.        |


### Contributions
---  

Contributions of any kind are more than welcome! Feel free to fork and improve `animated_item` in any way you want, make a pull request, or open an issue.

### Support the Library
---  

You can support the library by liking it on pub, staring in on Github and reporting any bugs you encounter.