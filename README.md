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
  }, // Can be null
)
```  