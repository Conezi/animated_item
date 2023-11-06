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
AnimatedItem(
  controller: _scrollController,
  index: index,
  effect: const ScaleEffect(),
  child: Container(
    margin: const EdgeInsets.all(5.0),
    width: width,
    decoration: BoxDecoration(
      color: colors[index],
      borderRadius: _borderRadius),
  )
)
``` 

`AnimatedPage` uses the PageController's scroll offset to animate the active page in a [PageView].

```dart
AnimatedPage(
  controller: _pageController,
  index: index,
  effect: const RotateEffect(),
  child: Container(
    margin: const EdgeInsets.all(5.0),
    width: width,
    decoration: BoxDecoration(
      color: colors[index],
      borderRadius: _borderRadius),
  )
)
```  