// Copyright 2023 Conezi. All rights reserved.

enum AnimationType {
  /// Animates on entrance
  animateIn,

  /// Animates on exit
  animateOut,

  /// Animates at the start of the scroll axis
  start,

  /// Animates at the end of the scroll axis
  end,

  /// Animates both on entrance and on exit
  always
}

enum AnimationScrollDirection {
  /// User scrolling to the [forward] direction
  forward,

  /// User scrolling to the [reverse] direction
  reverse,
}
