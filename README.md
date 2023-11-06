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
`AnimatedItem` uses the ScrollController's scroll offset to animate the active item in a [ListView].

```dart
ListView.builder(
  itemCount: colors.length,
  scrollDirection: Axis.horizontal,
  controller: _scaleController,
  padding: const EdgeInsets.symmetric(horizontal: 10.0),
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

`AnimatedPage` uses the PageController's scroll offset to animate the active page in a [PageView].

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

| Name                  | Type          | Description                                                       |
|-----------------------|---------------|-------------------------------------------------------------------|
| type             | AnimationType | determines start and end or the effect                            |
| snap        | bool          | If active items snap back to original position when not scrolling |

### Contributions
---  

Contributions of any kind are more than welcome! Feel free to fork and improve `animated_item` in any way you want, make a pull request, or open an issue.

### Support the Library
---  

You can support the library by liking it on pub, staring in on Github and reporting any bugs you encounter.