// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

part of mapbox_gl;

/// Type of map tiles to display.
// Enum constants must be indexed to match the corresponding int constants of
// the Android platform API, see
// <https://developers.google.com/android/reference/com/google/android/gms/maps/MapboxMap.html#MAP_TYPE_NORMAL>
enum MapType {
  /// Do not display map tiles.
  none,

  /// Normal tiles (traffic and labels, subtle terrain information).
  normal,

  /// Satellite imaging tiles (aerial photos)
  satellite,

  /// Terrain tiles (indicates type and height of terrain)
  terrain,

  /// Hybrid tiles (satellite images with some labels/overlays)
  hybrid,
}

class MapboxStyles {
  static const String MAPBOX_STREETS = "mapbox://styles/mapbox/streets-v11";
  /**
   * Outdoors: A general-purpose style tailored to outdoor activities. Using this constant means
   * your map style will always use the latest version and may change as we improve the style.
   */
  static const String OUTDOORS = "mapbox://styles/mapbox/outdoors-v11";

  /**
   * Light: Subtle light backdrop for data visualizations. Using this constant means your map
   * style will always use the latest version and may change as we improve the style.
   */
  static const String LIGHT = "mapbox://styles/mapbox/light-v10";

  /**
   * Dark: Subtle dark backdrop for data visualizations. Using this constant means your map style
   * will always use the latest version and may change as we improve the style.
   */
  static const String DARK = "mapbox://styles/mapbox/dark-v10";

  /**
   * Satellite: A beautiful global satellite and aerial imagery layer. Using this constant means
   * your map style will always use the latest version and may change as we improve the style.
   */
  static const String SATELLITE = "mapbox://styles/mapbox/satellite-v9";

  /**
   * Satellite Streets: Global satellite and aerial imagery with unobtrusive labels. Using this
   * constant means your map style will always use the latest version and may change as we
   * improve the style.
   */
  static const String SATELLITE_STREETS = "mapbox://styles/mapbox/satellite-streets-v11";

  /**
   * Traffic Day: Color-coded roads based on live traffic congestion data. Traffic data is currently
   * available in
   * <a href="https://www.mapbox.com/help/how-directions-work/#traffic-data">these select
   * countries</a>. Using this constant means your map style will always use the latest version and
   * may change as we improve the style.
   */
  static const String TRAFFIC_DAY = "mapbox://styles/mapbox/traffic-day-v2";

  /**
   * Traffic Night: Color-coded roads based on live traffic congestion data, designed to maximize
   * legibility in low-light situations. Traffic data is currently available in
   * <a href="https://www.mapbox.com/help/how-directions-work/#traffic-data">these select
   * countries</a>. Using this constant means your map style will always use the latest version and
   * may change as we improve the style.
   */
  static const String TRAFFIC_NIGHT = "mapbox://styles/mapbox/traffic-night-v2";
}

/// Bounds for the map camera target.
// Used with [MapboxMapOptions] to wrap a [LatLngBounds] value. This allows
// distinguishing between specifying an unbounded target (null `LatLngBounds`)
// from not specifying anything (null `CameraTargetBounds`).
class CameraTargetBounds {
  /// Creates a camera target bounds with the specified bounding box, or null
  /// to indicate that the camera target is not bounded.
  const CameraTargetBounds(this.bounds);

  /// The geographical bounding box for the map camera target.
  ///
  /// A null value means the camera target is unbounded.
  final LatLngBounds bounds;

  /// Unbounded camera target.
  static const CameraTargetBounds unbounded = CameraTargetBounds(null);

  dynamic _toJson() => <dynamic>[bounds?._toList()];

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final CameraTargetBounds typedOther = other;
    return bounds == typedOther.bounds;
  }

  @override
  int get hashCode => bounds.hashCode;

  @override
  String toString() {
    return 'CameraTargetBounds(bounds: $bounds)';
  }
}

/// Preferred bounds for map camera zoom level.
// Used with [MapboxMapOptions] to wrap min and max zoom. This allows
// distinguishing between specifying unbounded zooming (null `minZoom` and
// `maxZoom`) from not specifying anything (null `MinMaxZoomPreference`).
class MinMaxZoomPreference {
  const MinMaxZoomPreference(this.minZoom, this.maxZoom)
      : assert(minZoom == null || maxZoom == null || minZoom <= maxZoom);

  /// The preferred minimum zoom level or null, if unbounded from below.
  final double minZoom;

  /// The preferred maximum zoom level or null, if unbounded from above.
  final double maxZoom;

  /// Unbounded zooming.
  static const MinMaxZoomPreference unbounded =
      MinMaxZoomPreference(null, null);

  dynamic _toJson() => <dynamic>[minZoom, maxZoom];

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final MinMaxZoomPreference typedOther = other;
    return minZoom == typedOther.minZoom && maxZoom == typedOther.maxZoom;
  }

  @override
  int get hashCode => hashValues(minZoom, maxZoom);

  @override
  String toString() {
    return 'MinMaxZoomPreference(minZoom: $minZoom, maxZoom: $maxZoom)';
  }
}
