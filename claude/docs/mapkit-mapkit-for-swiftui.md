<!--
Downloaded via https://llm.codes by @steipete on October 23, 2025 at 10:30 AM
Source URL: https://developer.apple.com/documentation/mapkit/mapkit-for-swiftui
Total pages processed: 100
URLs filtered: Yes
Content de-duplicated: Yes
Availability strings filtered: Yes
Code blocks only: No
-->

# https://developer.apple.com/documentation/mapkit/mapkit-for-swiftui

Collection

- MapKit
- MapKit for SwiftUI

API Collection

# MapKit for SwiftUI

MapKit for SwiftUI allows you to build map-centric views and apps across Apple platforms. You can design expressive and highly interactive Maps with minimal code by composing views, using ViewBuilders and view modifiers.

## Overview

Like MapKit for AppKit and UIKit, MapKit for SwiftUI allows you to take advantage of map styles ranging from satellite imagery to rich, 3D perspective imagery to present vivid maps. Using `MapContentBuilder` you can configure your maps to show `Marker` and `Annotation` views, or — for more specialized content — you can design your own SwiftUI views to place on the map. To add even more interactivity, MapKit for SwiftUI supports overlays to highlight areas on the map, enabling you to animate paths and directions using `MapPolyline`, or make it easy for people to dig deeper into on the ground details with tappable points of interest. People who use your app can also explore at street level using `LookAroundPreview` and Look Around viewer.

## Topics

Searching, displaying, and navigating to places

Convert place information between coordinates and user-friendly place names, get cycling directions, and conveniently display formatted addresses.

### Essentials

`struct Map`

A view that displays an embedded map interface.

`struct MapStyle`

A style that you can apply to a map.

### Annotations and overlays

`struct Annotation`

A customizable annotation used to indicate a location on a map.

`struct MapCircle`

A circular overlay with a configurable radius that you center on a geographic coordinate.

`struct MapPolygon`

A closed polygon overlay.

`struct MapPolyline`

An open polygon overlay consisting of one or more connected line segments.

`struct Marker`

A balloon-shaped annotation that marks a map location.

`struct UserAnnotation`

Displays the person’s current location on the map.

### Map controls

`struct MapCompass`

A view that reflects the current orientation of the associated map.

`struct MapLocationCompass`

A view that displays a combined user location button and map compass.

`struct MapPitchSlider`

A slider control that allows a person to change the pitch of the map.

`struct MapPitchToggle`

A button that sets the pitch of the associated map.

`struct MapScaleView`

Displays a legend with distance information for the associated map.

`struct MapUserLocationButton`

A button that sets the framing of the associated map to the user location.

`struct MapZoomStepper`

Buttons a person uses to adjust the zoom level of the map.

### Exploring at street level

`struct LookAroundPreview`

A view that provides a Look Around preview for a specific geographic location.

### Map features

`struct MapFeature`

A tappable map feature.

`struct MapSelection`

A value representing a selected feature on a map.

`protocol MapSelectable`

### Map customization

`struct MapCamera`

Defines a virtual viewpoint above the map surface.

`struct MapCameraBounds`

Defines an optional boundary of an area within which the map’s center needs to remain.

`struct MapCameraPosition`

A structure that describes how to position the map’s camera within the map.

`struct MapCameraUpdateContext`

A structure that defines additional information about the map camera.

`struct MapCameraUpdateFrequency`

A structure that describes when the map camera updates.

### Place information

`struct MapItemDetailSelectionAccessoryStyle`

The map item detail selection accessory style.

Specifies the selection accessory to display for the selected map item content.

Presents the accessory as an annotation callout on the map.

### Geocoding

`class MKGeocodingRequest`

A class that looks up a geographic coordinate using the provided string.

`class MKReverseGeocodingRequest`

A class that looks up address strings for the provided geographic coordinates.

### Representing places and addresses

`class MKMapItem`

A point of interest on the map.

`class MKAddress`

A class that contains a full address, and, optionally, a short address.

`class MKAddressRepresentations`

A class that provides formatted address strings.

GeoToolbox

Determine place descriptor information for map coordinates.

### Points of interest

`struct PointOfInterestCategories`

A structure you use to define points of interest to include or exclude on a map.

### Protocols

`protocol DynamicMapContent`

A  type of view that generates views from an underlying collection of data.

`protocol MapContent`

A protocol used to construct map content such as controls, markers, and annotations.

`struct MapContentBuilder`

A result builder that creates map content from closures you provide.

`struct MapContentView`

A view that contains content that displays on a map at a specific position, and that responds to specific interactions you specify.

### Structures

`struct DefaultUserAnnotationContent`

A structure that represents the view to show at the user’s location on the map.

`struct EmptyMapContent`

A map content element that doesn’t contain any content.

`struct MapProxy`

A proxy for accessing sizing information about a given map view.

`struct MapReader`

A container view that defines its contents as a function of information about the first contained map.

`struct TupleMapContent`

A view created from a Swift tuple of map content values.

`struct MapSelectableContentView`

## See Also

### The MapKit APIs

Adopting unified Maps URLs

Access Maps URLs and options for displaying Maps information across Apple platforms.

---

# https://developer.apple.com/documentation/mapkit

Framework

# MapKit

Display map or satellite imagery within your app, call out points of interest, and determine placemark information for map coordinates.

## Overview

Use MapKit to give your app a sense of place with maps and location information. You can use the MapKit framework to:

- Embed maps directly into your app’s windows and views.

- Add annotations and overlays to a map to call out points of interest.

- Add LookAround capabilities to enable users to explore locations at street level.

- Respond to user interactions with well known points of interest, geographical features, and boundaries.

- Provide text completion to make it easy for users to search for a destination or point of interest.

## Topics

### The MapKit APIs

MapKit for SwiftUI allows you to build map-centric views and apps across Apple platforms. You can design expressive and highly interactive Maps with minimal code by composing views, using ViewBuilders and view modifiers.

Adopting unified Maps URLs

Access Maps URLs and options for displaying Maps information across Apple platforms.

### Articles

MapKit classes, protocols, and entitlements that are no longer supported.

Preparing your app to be the default navigation app

Configure your navigation app so people can set it as the default on their devices.

### Structures

`struct AnyMapContent`

A type-erased map content.

## See Also

### Related Documentation

Location and Maps Programming Guide

MapKit JS

Embed interactive Apple Maps on your website, annotate points of interest, and perform georelated searches.

Apple Maps Server API

Reduce API calls and conserve device power by streamlining your app’s georelated searches.

---

# https://developer.apple.com/documentation/mapkit/mapcontentbuilder

- MapKit
- MapContentBuilder

Structure

# MapContentBuilder

A result builder that creates map content from closures you provide.

MapKitSwiftUIMac CatalystvisionOS

@resultBuilder
struct MapContentBuilder

## Overview

The `buildBlock(_:)` methods in this type create `MapContent` instances based on the number and types of sources you provide as parameters.

You don’t use this type directly. Instead, SwiftUI annotates the `content` parameter of the various `MapView` initializers with the `@MapContentBuilder` annotation, implicitly calling this builder for you.

## Topics

### Map content builders

Creates an empty map content block that contains no statements.

Creates a map content block that contains a single content result.

### Conditionally building map content

Compares content in a multistatement closure, resulting in use of the conditional content if the first argument you provide evaluates to  true.

Compares content in a multistatement closure, resulting in use of the conditional content if the second argument you provide evaluates to true.

Builds an expression within the map content builder.

Compares content in a multistatement closure, that produces an optional view that’s visible if the argument you provide evaluates to true.

Provides support for “if” statements with “available” macro clauses in multi-statement closures, producing conditional content for the “then” branch, such the conditionally-available branch.

## See Also

### Protocols

`protocol DynamicMapContent`

A  type of view that generates views from an underlying collection of data.

`protocol MapContent`

A protocol used to construct map content such as controls, markers, and annotations.

`struct MapContentView`

A view that contains content that displays on a map at a specific position, and that responds to specific interactions you specify.

---

# https://developer.apple.com/documentation/mapkit/marker

- MapKit
- Marker

Structure

# Marker

A balloon-shaped annotation that marks a map location.

MapKitSwiftUIMac CatalystvisionOS

@ `MainActor` @preconcurrency

## Overview

Use this view to create marker instances in the closure you provide to the `content` parameter in the `Map` initializers.

## Topics

### Creating a marker

Creates a marker at the given location with the label you provide.

Creates a marker at the given location with the provided title and image resource to display as the balloon’s icon.

Creates a marker at the given location with the provided title and a system image the map displays as the balloon’s icon.

`init(LocalizedStringKey, coordinate: CLLocationCoordinate2D)`

Creates a marker at the given location with the localized string key you provide.

`init(LocalizedStringKey, image: String, coordinate: CLLocationCoordinate2D)`

Creates a marker at the given location with the provided localized title and image resource to display as the balloon’s icon.

`init(LocalizedStringKey, monogram: Text, coordinate: CLLocationCoordinate2D)`

Creates a marker at the given location with the provided title key and monogram.

Creates a marker at the given location with the provided title string and monogram.

`init(LocalizedStringKey, systemImage: String, coordinate: CLLocationCoordinate2D)`

Creates a marker at the given location with a localized title, and a system image the map displays as the balloon’s icon.

Creates a marker at the given location with the provided label.

`init(item: MKMapItem)`

Creates a marker for a given map item using a MapKit-provided label.

### Displaying place information

Specifies the selection accessory to display for the selected map item content.

### Initializers

`init(LocalizedStringResource, coordinate: CLLocationCoordinate2D)`

Creates a marker at the given location.

`init(LocalizedStringResource, image: String, coordinate: CLLocationCoordinate2D)`

Creates a marker at the given location with an image displayed as the balloon’s icon.

`init(LocalizedStringResource, monogram: Text, coordinate: CLLocationCoordinate2D)`

Creates a marker at the given location with a monogram displayed as the balloon’s icon.

`init(LocalizedStringResource, systemImage: String, coordinate: CLLocationCoordinate2D)`

Creates a marker at the given location with a system image displayed as the balloon’s icon.

## Relationships

### Conforms To

- `MapContent`
- `Sendable`
- `SendableMetatype`

## See Also

### Annotations and overlays

`struct Annotation`

A customizable annotation used to indicate a location on a map.

`struct MapCircle`

A circular overlay with a configurable radius that you center on a geographic coordinate.

`struct MapPolygon`

A closed polygon overlay.

`struct MapPolyline`

An open polygon overlay consisting of one or more connected line segments.

`struct UserAnnotation`

Displays the person’s current location on the map.

---

# https://developer.apple.com/documentation/mapkit/annotation

- MapKit
- Annotation

Structure

# Annotation

A customizable annotation used to indicate a location on a map.

MapKitSwiftUIMac CatalystvisionOS

@ `MainActor` @preconcurrency

## Overview

Use this view to annotations in the closure you provide to the `content` parameter in the `Map` initializers.

## Topics

### Creating annotations

Creates an annotation that displays a view at a coordinate on the map.

Creates an annotation that displays a view at a coordinate on the map using a title key, coordinate, anchor location, and view you provide.

Creates an annotation that displays a view on the map using coordinates, anchor location, view, and label you provide.

### Displaying place information

Specifies the selection accessory to display for the selected map item content.

### Initializers

## Relationships

### Conforms To

- `MapContent`
- `Sendable`
- `SendableMetatype`

## See Also

### Annotations and overlays

`struct MapCircle`

A circular overlay with a configurable radius that you center on a geographic coordinate.

`struct MapPolygon`

A closed polygon overlay.

`struct MapPolyline`

An open polygon overlay consisting of one or more connected line segments.

`struct Marker`

A balloon-shaped annotation that marks a map location.

`struct UserAnnotation`

Displays the person’s current location on the map.

---

# https://developer.apple.com/documentation/mapkit/mappolyline

- MapKit
- MapPolyline

Structure

# MapPolyline

An open polygon overlay consisting of one or more connected line segments.

MapKitSwiftUIMac CatalystvisionOS

struct MapPolyline

## Overview

Use this view to create map polylines instances in the closure you provide to the `content` parameter in the `Map` initializers.

## Topics

### Creating a polyline

`init(MKPolyline)`

Creates a polyline from polyline you provide.

`init(MKRoute)`

Creates a polyline that traces the route you provide.

[`init(coordinates: [CLLocationCoordinate2D], contourStyle: MapPolyline.ContourStyle)`](https://developer.apple.com/documentation/mapkit/mappolyline/init(coordinates:contourstyle:))

Creates a polyline that traces a path between the given coordinates using the specifed contour style.

[`init(points: [MKMapPoint], contourStyle: MapPolyline.ContourStyle)`](https://developer.apple.com/documentation/mapkit/mappolyline/init(points:contourstyle:))

Creates a new polyline that traces a path between the provided points using the specifed contour style.

### Styling the polyline

`struct ContourStyle`

Values that define how MapKit styles lines to represent the contour of the Earth.

## Relationships

### Conforms To

- `Copyable`
- `MapContent`

## See Also

### Annotations and overlays

`struct Annotation`

A customizable annotation used to indicate a location on a map.

`struct MapCircle`

A circular overlay with a configurable radius that you center on a geographic coordinate.

`struct MapPolygon`

A closed polygon overlay.

`struct Marker`

A balloon-shaped annotation that marks a map location.

`struct UserAnnotation`

Displays the person’s current location on the map.

---

# https://developer.apple.com/documentation/mapkit/lookaroundpreview

- MapKit
- LookAroundPreview

Structure

# LookAroundPreview

A view that provides a Look Around preview for a specific geographic location.

MapKitSwiftUIMac CatalystvisionOS

@ `MainActor` @preconcurrency
struct LookAroundPreview

## Overview

Use a `LookAroundPreview` to create preview imagery for a specific geographic location on the map that you can place in your view. In the following example, a travel recommendations app displays and styles a stack of Look Around previews it generates from an array of `ItineraryItem` structures that contain the location’s title and Look Around scene:

struct LookAroundPreviewsView: View {
let itinerary: [ItineraryItem]
var body: some View {
ScrollView {
LazyVStack {
ForEach(itinerary) { item in
LookAroundPreview(initialScene: item.lookAroundScene)
.frame(height: 128)
.overlay(alignment: .bottomTrailing) {
Text(item.title)
.font(.caption)
.foregroundColor(.white)
.padding()
}
}
}
}
}
}

To display a Look Around viewer a person can explore, apply a `lookAroundViewer` view modifier to a specific view, then add a control the user interacts with to display the Look Around viewer. In the following example, the `lookAroundViewer` view modifier observes a binding to Boolean value to determine whether to display the Look Around viewer.

var lookAroundScene: MKLookAroundScene?

@State private var isLookingAround: Bool = false

var body: some View {
MyInterestingView()
.lookAroundViewer(isPresented: $isLookingAround, initialScene: lookAroundScene)
.toolbar {
ToolbarItem {
Button(action: { lookingAround = true }) {
Image(systemName: "binoculars")
}
}
}
}

## Topics

### Creating a Look Around preview

`init(initialScene: MKLookAroundScene?, allowsNavigation: Bool, showsRoadLabels: Bool, pointsOfInterest: PointOfInterestCategories, badgePosition: MKLookAroundBadgePosition)`

Creates a Look Around preview with an initial scene, navigation, road label, points of interest, and badge position you specify.

Creates a Look Around preview with a binding to a scene, navigation, road label, points of interest, and badge position you specify.

## Relationships

### Conforms To

- `Sendable`
- `SendableMetatype`
- `View`

---

# https://developer.apple.com/documentation/mapkit/searching-displaying-and-navigating-to-places

- MapKit
- MapKit for SwiftUI
- Searching, displaying, and navigating to places

Sample Code

# Searching, displaying, and navigating to places

Convert place information between coordinates and user-friendly place names, get cycling directions, and conveniently display formatted addresses.

Download

Xcode 26.0+

## Overview

---

# https://developer.apple.com/documentation/mapkit/map

- MapKit
- Map

Structure

# Map

A view that displays an embedded map interface.

MapKitSwiftUIMac CatalystvisionOS

@ `MainActor` @preconcurrency

## Overview

Use this SwiftUI view to display a `Map` with markers, annotations, and custom content you provide. You can configure the `Map` to optionally display the user’s location, track a location, and display various controls to allow them to interact with and control the map’s display. The following example displays a map of downtown San Francisco that shows different markers, and an annotation with custom view content at specific locations:

struct ContentView: View {
var body: some View {
Map {
Marker("San Francisco City Hall", coordinate: cityHallLocation)
.tint(.orange)
Marker("San Francisco Public Library", coordinate: publicLibraryLocation)
.tint(.blue)
Annotation("Diller Civic Center Playground", coordinate: playgroundLocation) {
ZStack {
RoundedRectangle(cornerRadius: 5)
.fill(Color.yellow)
Text("🛝")
.padding(5)
}
}
}
.mapControlVisibility(.hidden)
}
}

You create markers, annotations, and overlays using `MapContentBuilder` with any of several `MapContent` types including:

- `Annotation`

- `UserAnnotation`

- `Marker`

- `MapCircle`

- `MapPolygon`

- `MapPolyline`

You can also add a variety of controls to allow a person to interact with the map to change the map’s scale, display or hide the device’s current location, and so on:

- `MapCompass`

- `MapPitchButton`

- `MapPitchSlider`

- `MapScaleView`

- `MapUserLocationButton`

- `MapZoomStepper`

## Topics

### Creating a map

`init(bounds: MapCameraBounds?, interactionModes: MapInteractionModes, scope: Namespace.ID?)`

Creates a new, empty map with the bounds, interaction modes, and scope you provide.

Creates a new map with the bounds, interaction modes, scope, and content you provide.

Creates a new, empty map with the bounds, interaction modes, a binding to a map feature, and scope you provide.

Creates a new, empty map with the bounds, interaction modes, the selected map feature, and scope you provide.

Creates a new map with the bounds, interaction modes, selected map feature, scope, and map content you provide.

Creates a new map with the bounds, interaction modes, selected value, scope, and map content you provide.

`init(initialPosition: MapCameraPosition, bounds: MapCameraBounds?, interactionModes: MapInteractionModes, scope: Namespace.ID?)`

Creates a new, empty map with the initial camera position, bounds, interaction modes, and scope you provide.

Creates a new map with the initial camera position, bounds, interaction modes, scope, and map content you provide.

Creates a new, empty map with the initial camera position, bounds, interaction modes, selected map feature, and scope you provide.

Creates a new map with the initial camera position, bounds, interaction modes, selected map feature, scope, and content you provide.

Creates a new map with the initial camera position, bounds, interaction modes, scope, and content you provide.

Creates a new map with the initial camera position, bounds, interaction modes, selected feature, scope, and content you provide.

`struct MapInteractionModes`

Options that indicate the user interactions that the map responds to.

### Deprecated

Map protocols and view modifiers that are no longer supported.

### Displaying place information

Specifies the selection accessory to display for the selected map item content.

## Relationships

### Conforms To

- `Sendable`
- `SendableMetatype`
- `View`

## See Also

### Essentials

`struct MapStyle`

A style that you can apply to a map.

---

# https://developer.apple.com/documentation/mapkit/mapstyle

- MapKit
- MapStyle

Structure

# MapStyle

A style that you can apply to a map.

MapKitSwiftUIMac CatalystvisionOS

struct MapStyle

## Topics

### Creating map styles

Creates a hybrid map style that includes the elevation, point of interest, and traffic characteristics you specify.

Creates a map style based on satellite imagery with the elevation characteristics you specify.

Creates a standard map style that includes the elevation, point of interest, and traffic characteristics you specify.

`struct Elevation`

Values you use to determine whether a map renders elevation.

`struct StandardEmphasis`

Values that control how the framework emphasizes map features.

### Map styles

`static var hybrid: MapStyle`

A map style that represents a satellite image of the area, including the paths of roads with their names layered on top.

`static var imagery: MapStyle`

A map style that represents a satellite image of the area the map displays.

`static var standard: MapStyle`

A map style that represents the default map presentation, which is a street map that shows the position of all roads and some road names, depending upon the zoom level of the map.

## See Also

### Essentials

`struct Map`

A view that displays an embedded map interface.

---

# https://developer.apple.com/documentation/mapkit/mapcircle

- MapKit
- MapCircle

Structure

# MapCircle

A circular overlay with a configurable radius that you center on a geographic coordinate.

MapKitSwiftUIMac CatalystvisionOS

struct MapCircle

## Overview

Use this view to create circular overlays in the closure you provide to the `content` parameter in `Map` initializers.

## Topics

### Creating a map circle

`init(MKCircle)`

Creates a circle overlay from an existing map circle object.

`init(center: CLLocationCoordinate2D, radius: CLLocationDistance)`

Creates a circle with the center coordinate and radius you specify.

`init(mapRect: MKMapRect)`

Creates the largest possible circle centered within the given map rectangle.

## Relationships

### Conforms To

- `Copyable`
- `MapContent`

## See Also

### Annotations and overlays

`struct Annotation`

A customizable annotation used to indicate a location on a map.

`struct MapPolygon`

A closed polygon overlay.

`struct MapPolyline`

An open polygon overlay consisting of one or more connected line segments.

`struct Marker`

A balloon-shaped annotation that marks a map location.

`struct UserAnnotation`

Displays the person’s current location on the map.

---

# https://developer.apple.com/documentation/mapkit/mappolygon

- MapKit
- MapPolygon

Structure

# MapPolygon

A closed polygon overlay.

MapKitSwiftUIMac CatalystvisionOS

struct MapPolygon

## Overview

Use this view to create map polygons instances in the closure you provide to the `content` parameter in the `Map` initializers.

## Topics

### Creating a map polygon

[`init(coordinates: [CLLocationCoordinate2D])`](https://developer.apple.com/documentation/mapkit/mappolygon/init(coordinates:))

Creates a polygon from a list of coordinates you provide.

[`init(points: [MKMapPoint])`](https://developer.apple.com/documentation/mapkit/mappolygon/init(points:))

Creates a polygon from a list of map points.

`init(MKPolygon)`

Creates a polygon from the polygon you provide.

## Relationships

### Conforms To

- `Copyable`
- `MapContent`

## See Also

### Annotations and overlays

`struct Annotation`

A customizable annotation used to indicate a location on a map.

`struct MapCircle`

A circular overlay with a configurable radius that you center on a geographic coordinate.

`struct MapPolyline`

An open polygon overlay consisting of one or more connected line segments.

`struct Marker`

A balloon-shaped annotation that marks a map location.

`struct UserAnnotation`

Displays the person’s current location on the map.

---

# https://developer.apple.com/documentation/mapkit/userannotation

- MapKit
- UserAnnotation

Structure

# UserAnnotation

Displays the person’s current location on the map.

MapKitSwiftUIMac CatalystvisionOS

@ `MainActor` @preconcurrency

## Overview

Displays the person’s current location using the system styled user location indicator.

## Topics

### Creating a user annotation

`init()`

Creates an annotation that displays the person’s current location.

`init(anchor: UnitPoint)`

Creates an annotation that displays the person’s current location using the system styled user location indicator with the specified anchor point.

Creates an annotation that displays a person’s current location using the system styled user location indicator with the specified anchor point using a custom view.

Create an annotation that displays the person’s current location of the user using a custom view.

### Information about a person’s location

`struct UserLocation`

A structure that contains Information about the person’s current location.

## Relationships

### Conforms To

- `MapContent`
- `Sendable`
- `SendableMetatype`

## See Also

### Annotations and overlays

`struct Annotation`

A customizable annotation used to indicate a location on a map.

`struct MapCircle`

A circular overlay with a configurable radius that you center on a geographic coordinate.

`struct MapPolygon`

A closed polygon overlay.

`struct MapPolyline`

An open polygon overlay consisting of one or more connected line segments.

`struct Marker`

A balloon-shaped annotation that marks a map location.

---

# https://developer.apple.com/documentation/mapkit/mapcompass

- MapKit
- MapCompass

Structure

# MapCompass

A view that reflects the current orientation of the associated map.

MapKitSwiftUIMac CatalystvisionOS

@ `MainActor` @preconcurrency
struct MapCompass

## Overview

You can use `MapCompass` with a `Map` as a stand alone view, as shown in the following example:

struct CompassButtonTestView: View {
@Namespace var mapScope
var body: some View {
VStack {
Map(scope: mapScope)
MapCompass(scope: mapScope)
}
.mapScope(mapScope)
}
}

You can also use `MapCompass` with the `Map/mapControls(_:)`, modifier, as shown below:

Map()
.mapControls {
MapCompass()
}

Tapping the compass reorients the map so that North is at the top of the `Map` view.

## Topics

### Creating a map compass

`init(scope: Namespace.ID?)`

Creates a new map compass with the scope you specify.

## Relationships

### Conforms To

- `Sendable`
- `SendableMetatype`
- `View`

## See Also

### Map controls

`struct MapLocationCompass`

A view that displays a combined user location button and map compass.

`struct MapPitchSlider`

A slider control that allows a person to change the pitch of the map.

`struct MapPitchToggle`

A button that sets the pitch of the associated map.

`struct MapScaleView`

Displays a legend with distance information for the associated map.

`struct MapUserLocationButton`

A button that sets the framing of the associated map to the user location.

`struct MapZoomStepper`

Buttons a person uses to adjust the zoom level of the map.

---

# https://developer.apple.com/documentation/mapkit/maplocationcompass

- MapKit
- MapLocationCompass

Structure

# MapLocationCompass

A view that displays a combined user location button and map compass.

MapKitSwiftUI

@ `MainActor` @preconcurrency
struct MapLocationCompass

## Overview

In watchOS 10 and later, this view displays a combined `MapUserLocationButton` and `MapCompass` control. When the map camera has a heading of zero (where north is up), this view shows the user location button. When the map camera is in a rotated state, it shows a compass.

Use `MapLocationCompass` in conjunction with `Map` as a standalone view, as shown in this example:

struct LocationCompassTestView: View {
@Namespace var mapScope

var body: some View {
VStack {
Map(scope: mapScope)
MapLocationCompass(scope: mapScope)
}
.mapScope(mapScope)
}
}

You can also use `MapLocationCompass` in conjunction with the `mapControls(_:)` modifier. For example:

Map()
.mapControls {
MapLocationCompass()
}

## Topics

### Creating a map loction compass

`init(scope: Namespace.ID?)`

Creates a new map location compass with the provided scope.

## Relationships

### Conforms To

- `Sendable`
- `SendableMetatype`
- `View`

## See Also

### Map controls

`struct MapCompass`

A view that reflects the current orientation of the associated map.

`struct MapPitchSlider`

A slider control that allows a person to change the pitch of the map.

`struct MapPitchToggle`

A button that sets the pitch of the associated map.

`struct MapScaleView`

Displays a legend with distance information for the associated map.

`struct MapUserLocationButton`

A button that sets the framing of the associated map to the user location.

`struct MapZoomStepper`

Buttons a person uses to adjust the zoom level of the map.

---

# https://developer.apple.com/documentation/mapkit/mappitchslider

- MapKit
- MapPitchSlider

Structure

# MapPitchSlider

A slider control that allows a person to change the pitch of the map.

MapKitSwiftUI

@ `MainActor` @preconcurrency
struct MapPitchSlider

## Topics

### Creating a map pitch slider

`init(scope: Namespace.ID?)`

Creates a new map pitch slider with the scope you specify.

## Relationships

### Conforms To

- `Sendable`
- `SendableMetatype`
- `View`

## See Also

### Map controls

`struct MapCompass`

A view that reflects the current orientation of the associated map.

`struct MapLocationCompass`

A view that displays a combined user location button and map compass.

`struct MapPitchToggle`

A button that sets the pitch of the associated map.

`struct MapScaleView`

Displays a legend with distance information for the associated map.

`struct MapUserLocationButton`

A button that sets the framing of the associated map to the user location.

`struct MapZoomStepper`

Buttons a person uses to adjust the zoom level of the map.

---

# https://developer.apple.com/documentation/mapkit/mappitchtoggle

- MapKit
- MapPitchToggle

Structure

# MapPitchToggle

A button that sets the pitch of the associated map.

MapKitSwiftUIMac CatalystvisionOS

@ `MainActor` @preconcurrency
struct MapPitchToggle

## Overview

The `MapPitchToggle` control sets the pitch of the associated map to a pleasing angle if flat, or returns the map to flat if pitched.

You can use this control in conjunction with `Map` as a standalone view, as this example shows:

struct MyMapView: View {
@Namespace var mapScope

var body: some View {
VStack {
Map(scope: mapScope)
MapPitchToggle(scope: mapScope)
}
.mapScope(mapScope)
}
}

Alternatively, use `MapPitchToggle` in conjunction with the `mapControls(_:)` modifier. For example:

Map()
.mapControls {
MapPitchToggle()
}

## Topics

### Creating a map pitch toggle

`init(scope: Namespace.ID?)`

Creates a new map pitch toggle control with the provided scope.

## Relationships

### Conforms To

- `Sendable`
- `SendableMetatype`
- `View`

## See Also

### Map controls

`struct MapCompass`

A view that reflects the current orientation of the associated map.

`struct MapLocationCompass`

A view that displays a combined user location button and map compass.

`struct MapPitchSlider`

A slider control that allows a person to change the pitch of the map.

`struct MapScaleView`

Displays a legend with distance information for the associated map.

`struct MapUserLocationButton`

A button that sets the framing of the associated map to the user location.

`struct MapZoomStepper`

Buttons a person uses to adjust the zoom level of the map.

---

# https://developer.apple.com/documentation/mapkit/mapscaleview

- MapKit
- MapScaleView

Structure

# MapScaleView

Displays a legend with distance information for the associated map.

MapKitSwiftUIMac CatalystvisionOS

@ `MainActor` @preconcurrency
struct MapScaleView

## Overview

You can use this with `Map` as a standalone view, for example:

struct ScaleTestView: View {
@Namespace var mapScope

var body: some View {
VStack {
Map(scope: mapScope)
MapCompass(scope: mapScope)
}
.mapScope(mapScope)
}
}

The scale indicator grows and shrinks (although visually, its frame is static) based on the zoom level of the map. By default the leading edge remains anchored and the trailing edge moves as the scale changes. If the scale is trailing aligned, then it may be more visually appealing to anchor the `ScaleView` to the trailing edge

ZStack(alignment: .trailing) {
Map(mapScope)
MapScaleView(anchorEdge: .trailing, scope: mapScope)
}
.mapScope(mapScope)

You can also use `MapScaleView` with the `mapControls(_:)` modifier, as shown in this example:

Map()
.mapControls {
MapScaleView()
}

## Topics

### Creating a map scale view

`init(anchorEdge: HorizontalEdge, scope: Namespace.ID?)`

Creates a map scale view.

`init(alignment: HorizontalAlignment, scope: Namespace.ID?)`

Creates a scale view with the provided alignment and scope.

## Relationships

### Conforms To

- `Sendable`
- `SendableMetatype`
- `View`

## See Also

### Map controls

`struct MapCompass`

A view that reflects the current orientation of the associated map.

`struct MapLocationCompass`

A view that displays a combined user location button and map compass.

`struct MapPitchSlider`

A slider control that allows a person to change the pitch of the map.

`struct MapPitchToggle`

A button that sets the pitch of the associated map.

`struct MapUserLocationButton`

A button that sets the framing of the associated map to the user location.

`struct MapZoomStepper`

Buttons a person uses to adjust the zoom level of the map.

---

# https://developer.apple.com/documentation/mapkit/mapuserlocationbutton

- MapKit
- MapUserLocationButton

Structure

# MapUserLocationButton

A button that sets the framing of the associated map to the user location.

MapKitSwiftUIMac CatalystvisionOS

@ `MainActor` @preconcurrency
struct MapUserLocationButton

## Overview

Use `MapUserLocationButton` in conjunction with `Map` as a stand alone view, as shown in this example:

struct LocationButtonTestView: View {
@Namespace var mapScope
var body: some View {
VStack {
Map(scope: mapScope)
MapUserLocationButton(scope: mapScope)
}
.mapScope(mapScope)
}
}

You can also use `MapUserLocationButton` in conjunction with the `Map/mapControls(_:)` modifier as shown in this example:

Map()
.mapControls {
MapUserLocationButton()
}

## Topics

### Creating a map user location button

`init(scope: Namespace.ID?)`

Creates a new user location button with the scope you specify.

## Relationships

### Conforms To

- `Sendable`
- `SendableMetatype`
- `View`

## See Also

### Map controls

`struct MapCompass`

A view that reflects the current orientation of the associated map.

`struct MapLocationCompass`

A view that displays a combined user location button and map compass.

`struct MapPitchSlider`

A slider control that allows a person to change the pitch of the map.

`struct MapPitchToggle`

A button that sets the pitch of the associated map.

`struct MapScaleView`

Displays a legend with distance information for the associated map.

`struct MapZoomStepper`

Buttons a person uses to adjust the zoom level of the map.

---

# https://developer.apple.com/documentation/mapkit/mapzoomstepper

- MapKit
- MapZoomStepper

Structure

# MapZoomStepper

Buttons a person uses to adjust the zoom level of the map.

MapKitSwiftUI

@ `MainActor` @preconcurrency
struct MapZoomStepper

## Overview

You typically use `MapZoomStepper` with `Map` as a stand alone view, as shown in the following example:

struct ZoomStepperTestView: View {
@Namespace var mapScope
var body: some View {
VStack {
Map(scope: mapScope)
MapZoomStepper(scope: mapScope)
}
.mapScope(mapScope)
}
}

You can also use a MapZoomStepper in conjunction with the `Map/mapControls(_:)` modifier, as show in here:

Map()
.mapControls {
MapZoomStepper()
}

## Topics

### Creating a zoom stepper

`init(scope: Namespace.ID?)`

Creates a new zoom stepper with the scope you specify.

## Relationships

### Conforms To

- `Sendable`
- `SendableMetatype`
- `View`

## See Also

### Map controls

`struct MapCompass`

A view that reflects the current orientation of the associated map.

`struct MapLocationCompass`

A view that displays a combined user location button and map compass.

`struct MapPitchSlider`

A slider control that allows a person to change the pitch of the map.

`struct MapPitchToggle`

A button that sets the pitch of the associated map.

`struct MapScaleView`

Displays a legend with distance information for the associated map.

`struct MapUserLocationButton`

A button that sets the framing of the associated map to the user location.

---

# https://developer.apple.com/documentation/mapkit/mapfeature

- MapKit
- MapFeature

Structure

# MapFeature

A tappable map feature.

MapKitSwiftUIMac CatalystvisionOS

struct MapFeature

## Overview

Tappable map features can include single points of interest, such as hotels and restaurants, a territory, or a physical map feature such as an ocean, basin, river, or mountain range.

## Topics

### Accessing the feature’s properties

`var kind: MapFeature.FeatureKind`

The kind of feature represented by the map feature.

`struct FeatureKind`

The kind of feature represented by a map feature.

`var coordinate: CLLocationCoordinate2D`

The coordinate of the map feature.

`var title: String?`

The title of the map feature.

`var backgroundColor: Color?`

The background color associated with the map feature.

`var image: Image?`

An image associated with the map feature.

`var pointOfInterestCategory: MKPointOfInterestCategory?`

The point of interest category of the map feature.

## Relationships

### Conforms To

- `Copyable`
- `Equatable`
- `Hashable`

## See Also

### Map features

`struct MapSelection`

A value representing a selected feature on a map.

`protocol MapSelectable`

---

# https://developer.apple.com/documentation/mapkit/mapselection

- MapKit
- MapSelection

Structure

# MapSelection

A value representing a selected feature on a map.

MapKitSwiftUIMac Catalyst

## Topics

### Creating a map selection

`init(SelectionValue)`

Creates a map selection with a tag.

### Getting the properties

`var value: SelectionValue?`

The selection of the given tag value.

## Relationships

### Conforms To

- `Equatable`
- `Hashable`
- `MapSelectable`

## See Also

### Map features

`struct MapFeature`

A tappable map feature.

`protocol MapSelectable`

---

# https://developer.apple.com/documentation/mapkit/mapselectable

- MapKit
- MapSelectable

Protocol

# MapSelectable

MapKitSwiftUIMac CatalystvisionOS

protocol MapSelectable : `Hashable`

## Topics

### Initializers

`init(MapFeature?)`

**Required**

### Instance Properties

`var feature: MapFeature?`

## Relationships

### Inherits From

- `Equatable`
- `Hashable`

### Conforming Types

- `MapSelection`

## See Also

### Map features

`struct MapFeature`

A tappable map feature.

`struct MapSelection`

A value representing a selected feature on a map.

---

# https://developer.apple.com/documentation/mapkit/mapcamera

- MapKit
- MapCamera

Structure

# MapCamera

Defines a virtual viewpoint above the map surface.

MapKitSwiftUIMac CatalystvisionOS

struct MapCamera

## Overview

`MapCamera` allows you to specify the viewpoint of a `Map`, as well as affect how MapKit presents the map to the user.

To create a map view with a 3D perspective, `MapCamera` takes input from the camera and device:

- The location of the camera on the map.

- The compass heading to indicate the camera’s viewing direction.

- The pitch of the camera relative to the map perpendicular.

- The camera’s distance from the target point.

## Topics

### Creating a map camera

`init(MKMapCamera)`

Creates a map camera from the given MapKit camera object.

`init(centerCoordinate: CLLocationCoordinate2D, distance: Double, heading: Double, pitch: Double)`

Creates a camera using the specified distance, pitch, and heading information.

### Accessing the camera properties

`var centerCoordinate: CLLocationCoordinate2D`

The map coordinate at the center of the map view.

`var distance: Double`

The distance from the center point of the map to the camera, in meters.

`var heading: Double`

The heading of the camera, in degrees, relative to true North.

`var pitch: Double`

The viewing angle of the camera, in degrees.

## Relationships

### Conforms To

- `Equatable`

## See Also

### Map customization

`struct MapCameraBounds`

Defines an optional boundary of an area within which the map’s center needs to remain.

`struct MapCameraPosition`

A structure that describes how to position the map’s camera within the map.

`struct MapCameraUpdateContext`

A structure that defines additional information about the map camera.

`struct MapCameraUpdateFrequency`

A structure that describes when the map camera updates.

---

# https://developer.apple.com/documentation/mapkit/mapcamerabounds

- MapKit
- MapCameraBounds

Structure

# MapCameraBounds

Defines an optional boundary of an area within which the map’s center needs to remain.

MapKitSwiftUIMac CatalystvisionOS

struct MapCameraBounds

## Overview

Using the `MapCameraBounds` initializers you can also define an optional camera zoom range that limits the distances that a person can zoom the map camera to.

## Topics

### Creating a map camera bounds

`init(centerCoordinateBounds: MKCoordinateRegion, minimumDistance: Double?, maximumDistance: Double?)`

Creates a camera bounds with the specified region boundary and zoom ranges.

`init(centerCoordinateBounds: MKMapRect, minimumDistance: Double?, maximumDistance: Double?)`

Creates a camera bounds with the specified map rectangle boundary and zoom ranges.

`init(minimumDistance: Double?, maximumDistance: Double?)`

Creates a camera bounds with the zoom ranges you specify.

## See Also

### Map customization

`struct MapCamera`

Defines a virtual viewpoint above the map surface.

`struct MapCameraPosition`

A structure that describes how to position the map’s camera within the map.

`struct MapCameraUpdateContext`

A structure that defines additional information about the map camera.

`struct MapCameraUpdateFrequency`

A structure that describes when the map camera updates.

---

# https://developer.apple.com/documentation/mapkit/mapcameraposition

- MapKit
- MapCameraPosition

Structure

# MapCameraPosition

A structure that describes how to position the map’s camera within the map.

MapKitSwiftUIMac CatalystvisionOS

struct MapCameraPosition

## Overview

`MapCameraPosition` contains a variety of properties that you can use to control the semantic framings of the camera in relation to its position to the map, such as `automatic`, which frames the content of the map, and the `camera` property, which allows you to specify an explicit camera position.

When you pass `MapCameraPosition` as a binding to a map, the map adjusts its camera to frame the requested content, or to exactly match the camera `MapCameraPosition` specifies. If a person interacts with the `Map` in a way that moves the map, the map resets the position to a value that specifies `positionedByUser`.

## Topics

### Creating a camera position

Creates a new camera position from an existing map camera you provide.

Creates a new camera position centered on a map item and automatic pitch selection you provide.

Creates a new camera position with the map boundaries you provide.

Creates a new camera position the coordinate region you provide.

Creates a camera position with the specific fallback position and optionally follows the user’s heading.

### Information about camera position and framing

`static var automatic: MapCameraPosition`

The position that frames the map’s content.

`var allowsAutomaticPitch: Bool`

The setting that allows the map’s camera to automatically set the pitch when framing the item.

`var camera: MapCamera?`

A map camera that defines the camera positioning.

`var fallbackPosition: MapCameraPosition?`

The position to use if the framework hasn’t resolved the person’s location.

`var item: MKMapItem?`

The item the map is framing.

`var positionedByUser: Bool`

A Boolean value that indicates whether the person specified the camera position by interacting with the map.

`var rect: MKMapRect?`

The position that frames the given map rectangle.

`var region: MKCoordinateRegion?`

The coordinate region to frame.

### Accessing information about someone’s location

`var followsUserHeading: Bool`

A Boolean value that indicates whether the map is following someone’s heading.

`var followsUserLocation: Bool`

A Boolean value that indicates whether the map is following someone’s location.

## Relationships

### Conforms To

- `Equatable`

## See Also

### Map customization

`struct MapCamera`

Defines a virtual viewpoint above the map surface.

`struct MapCameraBounds`

Defines an optional boundary of an area within which the map’s center needs to remain.

`struct MapCameraUpdateContext`

A structure that defines additional information about the map camera.

`struct MapCameraUpdateFrequency`

A structure that describes when the map camera updates.

---

# https://developer.apple.com/documentation/mapkit/mapcameraupdatecontext

- MapKit
- MapCameraUpdateContext

Structure

# MapCameraUpdateContext

A structure that defines additional information about the map camera.

MapKitSwiftUIMac CatalystvisionOS

struct MapCameraUpdateContext

## Topics

### Accessing information about the camera

`let camera: MapCamera`

The current map camera.

`let rect: MKMapRect`

A map rectangle that approximates the view of the map’s camera.

`let region: MKCoordinateRegion`

A map region that approximates the view of the map’s camera.

## See Also

### Map customization

`struct MapCamera`

Defines a virtual viewpoint above the map surface.

`struct MapCameraBounds`

Defines an optional boundary of an area within which the map’s center needs to remain.

`struct MapCameraPosition`

A structure that describes how to position the map’s camera within the map.

`struct MapCameraUpdateFrequency`

A structure that describes when the map camera updates.

---

# https://developer.apple.com/documentation/mapkit/mapcameraupdatefrequency

- MapKit
- MapCameraUpdateFrequency

Structure

# MapCameraUpdateFrequency

A structure that describes when the map camera updates.

MapKitSwiftUIMac CatalystvisionOS

struct MapCameraUpdateFrequency

## Topics

### Timing of camera updates

`static var continuous: MapCameraUpdateFrequency`

A value that indicates that all camera updates are continuous, including while interactions are taking place.

`static var onEnd: MapCameraUpdateFrequency`

A value that indicates the camera updates when map interactions are complete.

## See Also

### Map customization

`struct MapCamera`

Defines a virtual viewpoint above the map surface.

`struct MapCameraBounds`

Defines an optional boundary of an area within which the map’s center needs to remain.

`struct MapCameraPosition`

A structure that describes how to position the map’s camera within the map.

`struct MapCameraUpdateContext`

A structure that defines additional information about the map camera.

---

# https://developer.apple.com/documentation/mapkit/mapitemdetailselectionaccessorystyle

- MapKit
- MapItemDetailSelectionAccessoryStyle

Structure

# MapItemDetailSelectionAccessoryStyle

The map item detail selection accessory style.

MapKitSwiftUIMac Catalyst

struct MapItemDetailSelectionAccessoryStyle

## Topics

### Accessory styles

`static var automatic: MapItemDetailSelectionAccessoryStyle`

A value that allows the framework to choose an appropriate callout style automatically.

`static var callout: MapItemDetailSelectionAccessoryStyle`

The accessory, shown as an annotation callout on the map.

`static var caption: MapItemDetailSelectionAccessoryStyle`

An “Open in Apple Maps” link below the content’s label.

`static var sheet: MapItemDetailSelectionAccessoryStyle`

The map item detail sheet.

### Callout styles

`struct CalloutStyle`

The style to use for callout content.

`static var automatic: MapItemDetailSelectionAccessoryStyle.CalloutStyle`

`static var compact: MapItemDetailSelectionAccessoryStyle.CalloutStyle`

A compact, space-saving callout style.

`static var full: MapItemDetailSelectionAccessoryStyle.CalloutStyle`

A rich, detailed callout style that is suitable for large map views.

### Type Methods

Presents the accessory as an annotation callout on the map.

## See Also

### Place information

Specifies the selection accessory to display for the selected map item content.

---

# https://developer.apple.com/documentation/mapkit/mapcontent/mapitemdetailselectionaccessory(_:)

#app-main)

- MapKit
- MapContent
- mapItemDetailSelectionAccessory(\_:)

Instance Method

# mapItemDetailSelectionAccessory(\_:)

Specifies the selection accessory to display for the selected map item content.

MapKitSwiftUIMac Catalyst

@ `MainActor` @preconcurrency

## Parameters

`style`

The map item detail selection accessory style. If `nil`, no selection accessory appears.

## See Also

### Place information

`struct MapItemDetailSelectionAccessoryStyle`

The map item detail selection accessory style.

Presents the accessory as an annotation callout on the map.

---

# https://developer.apple.com/documentation/mapkit/mapitemdetailselectionaccessorystyle/callout(_:)

#app-main)

- MapKit
- MapItemDetailSelectionAccessoryStyle
- callout(\_:)

Type Method

# callout(\_:)

Presents the accessory as an annotation callout on the map.

MapKitSwiftUIMac Catalyst

## Parameters

`style`

The `MapItemDetailSelectionAccessoryStyle.CalloutStyle` to use.

## See Also

### Place information

`struct MapItemDetailSelectionAccessoryStyle`

The map item detail selection accessory style.

Specifies the selection accessory to display for the selected map item content.

---

# https://developer.apple.com/documentation/mapkit/mkgeocodingrequest

- MapKit
- MKGeocodingRequest

Class

# MKGeocodingRequest

A class that looks up a geographic coordinate using the provided string.

class MKGeocodingRequest

## Discussion

Use this class to look up the coordinate for an address string you provide, for example if you want to display the location in a map. This example shows how to use a `Task` modifier on a SwiftUI view to geocode an array of street addresses to the corresponding coordinates that MapKit returns in an array of `MKMapItem` objects.

struct MyGeocoderView: View {

let addressVisits = [\
"Bethesda Terrace, Central Park \n New York, NY 10023 \n United States",\
"Mill Creek Park Fountain, \n Kansas City, Missouri, \n United States",\
"Archibald Fountain, 110 Elizabeth St \n Sydney NSW 2000 \n Australia"\
]
@State var addressVisitMapItems: [MKMapItem] = []
var body: some View {
// SwiftUI body views
}
.onAppear {
Task {
var addressMapItems = MKMapItem
for address in addressVisits {
if let request = MKGeocodingRequest(addressString: address) {
do {
let mapitems = try await request.mapItems
if let mapitem = mapitems.first {
addressMppItems.append(mapitem)
}
} catch let error {
print("error: \(error)")
}
}
}
addressVisitMapItems = addressMapItems

// The `addressVisitMapItems` array contains `MKMapItem` items that provide information that describe
// the geographic coordinates, the specific address, and other rich data about the provided locations:
//
// "New York, NY 10023 United States" at (40.76821482, -73.98669500)
// "West 43rd St, Kansas City, MO 64111 United States" at (39.04979190, -94.59874170)
// "110 Elizabeth St Sydney NSW 2000 Australia" at (33.87171620, 151.21150870)
}
}

## Topics

### Creating a geocoding request object

`init?(addressString: String)`

Initializes a new geocoder request object with the provided address string.

### Getting the geocoder’s state

`var isLoading: Bool`

A Boolean value that indicates whether the current geocoding request is in a loading state.

`var isCancelled: Bool`

A Boolean value that indicates whether the current geocoding request is in a cancelled state.

### Controlling the geocoder’s operation

`func cancel()`

A function you call to cancel a geocoding request that’s in progress.

### Getting information about the geocoder

`var addressString: String`

The string used to initialize the geocoder.

Returns the map items relevant to the geocoded location.

`var preferredLocale: Locale?`

A value that indicates the default locale the geocoder should use when processing requests.

`var region: MKCoordinateRegion`

The geographic region for the framework to use as the bounds for the request; defaults to a region that covers the whole world.

## Relationships

### Inherits From

- `NSObject`

### Conforms To

- `CVarArg`
- `CustomDebugStringConvertible`
- `CustomStringConvertible`
- `Equatable`
- `Hashable`
- `NSObjectProtocol`

## See Also

### Geocoding

`class MKReverseGeocodingRequest`

A class that looks up address strings for the provided geographic coordinates.

---

# https://developer.apple.com/documentation/mapkit/mkreversegeocodingrequest

- MapKit
- MKReverseGeocodingRequest

Class

# MKReverseGeocodingRequest

A class that looks up address strings for the provided geographic coordinates.

class MKReverseGeocodingRequest

## Discussion

Use this class to look up an address by a coordinate you provide. This example shows how to use a `Task` modifier on a SwiftUI view to reverse geocodes an array of coordinates to the corresponding addresses that MapKit returns in an array of `MKMapItem` objects.

struct MyReverseGeocoderView: View {

let fountainCoordinates = [\
CLLocation(latitude: 39.042617, longitude: -94.587526),\
CLLocation(latitude: 40.774313, longitude: -73.970835),\
CLLocation(latitude: -33.870986, longitude: 151.211786),\
CLLocation(latitude: 41.875790, longitude: -87.618953),\
]

// An array that holds resolved information about the fountains.
@State var fountains: [MKMapItem] = []

var body: some View {
// SwiftUI body views
}
.task {
var fountainMapItems = MKMapItem
for coordinate in fountainCoordinates {
if let request = MKReverseGeocodingRequest(location: coordinate) {
let mapitems = try? await request.mapItems
if let mapitem = mapitems?.first {
fountainMapItems.append(mapitem)
}
}
}
fountains = fountainMapItems
// The fountains `MKMapItems` array contains information describing
// details about the following places based on the provided coordinates:
//
// Mill Creek Park Fountain, Kansas City, Missouri
// Bethesda Terrace Fountain, Central Park, New York City
// Archibald Fountain, Sydney, Australia
// Buckingham Fountain, Chicago, Illinois
}
}

## Topics

### Creating a request object

`init?(location: CLLocation)`

Initializes a new reverse geocoder request object with the provided location.

### Getting the reverse geocoder’s state

`var isLoading: Bool`

A Boolean value that indicates whether the current reverse geocoding request is in a loading state.

`var isCancelled: Bool`

A Boolean value that indicates whether the current reverse geocoding request is in a cancelled state.

`var location: CLLocation`

The location provided to the initializer.

### Controlling the reverse geocoder’s operation

`func cancel()`

A method you call to cancel a reverse geocoding request that’s in progress.

### Getting information about map items and the reverse geocoder’s locale’

Returns the map items relevant to the reverse geocoded location.

`var preferredLocale: Locale?`

A value that indicates the preferred locale for the addresses the request returns, or `nil` if the framework should use the device locale.

## Relationships

### Inherits From

- `NSObject`

### Conforms To

- `CVarArg`
- `CustomDebugStringConvertible`
- `CustomStringConvertible`
- `Equatable`
- `Hashable`
- `NSObjectProtocol`

## See Also

### Geocoding

`class MKGeocodingRequest`

A class that looks up a geographic coordinate using the provided string.

---

# https://developer.apple.com/documentation/mapkit/mkmapitem

- MapKit
- MKMapItem

Class

# MKMapItem

A point of interest on the map.

class MKMapItem

## Mentioned in

Identifying unique locations with Place IDs

## Overview

A map item includes a geographic location and any interesting data that might apply to that location, such as the address at that location and the name of a business at that address. You can also create a special `MKMapItem` object representing the user’s location.

Use this class to do the following:

- Share map-related data with the Maps app.

- Handle requests for directions that originate from the Maps app.

To display information in the Maps app, create an `MKMapItem` object with the information you want to display and call the `openMaps(with:launchOptions:)` method. The Maps app displays that location on the map and shows the information you provide.

If you implement a routing app, the Maps app provides two `MKMapItem` objects representing the start and end points. Use the information in those two objects to plot the route and generate directions.

## Topics

### Creating map items

`init(placemark: MKPlacemark)`

Creates and returns a map item object using the specified placemark object.

Deprecated

Creates and returns a singleton map item object representing the user’s location.

### Accessing the map item attributes

`class Identifier`

A unique identifier for a place.

A set of alternative identifiers for a place.

`var identifier: MKMapItem.Identifier?`

`var isCurrentLocation: Bool`

A Boolean value that indicates whether the map item represents the user’s location.

`var name: String?`

The descriptive name associated with the map item.

`var placemark: MKPlacemark`

The placemark object containing the location information.

`var pointOfInterestCategory: MKPointOfInterestCategory?`

The point-of-interest category for the map item.

`var phoneNumber: String?`

The phone number associated with a business at the specified location.

`var timeZone: TimeZone?`

The time zone of the specified location.

`var url: URL?`

The URL associated with the specified location.

### Launching the Maps app

Opens the Maps app and displays the specified map items.

Opens the Maps app using the specified map items and options.

Opens the Maps app from a particular scene using the specified map items and options.

Opens the Maps app and displays the map item.

Opens the Maps app from a particular scene using the specified options.

### Serializing a map item

`let MKMapItemTypeIdentifier: String`

A constant that indicates the type of a serialized map item.

### Opening items at launch time

Launch options to specify when opening map items in the Maps app.

Strings that represent the possible values of the launch options direction mode key.

### Initializers

`init?(coder: NSCoder)`

`init(location: CLLocation, address: MKAddress?)`

Creates and returns a map item object using the specified location and address objects.

### Instance Properties

`var address: MKAddress?`

The address object.

`var addressRepresentations: MKAddressRepresentations?`

The address representations object that contains various address representations useful for display purposes.

`var location: CLLocation`

The location object.

## Relationships

### Inherits From

- `NSObject`

### Conforms To

- `CVarArg`
- `Copyable`
- `CustomDebugStringConvertible`
- `CustomStringConvertible`
- `Equatable`
- `Hashable`
- `NSCoding`
- `NSItemProviderReading`
- `NSItemProviderWriting`
- `NSObjectProtocol`
- `NSSecureCoding`

## See Also

### Essentials

Enabling Maps capability in Xcode

Configure your routing app to support providing directions.

Obtain information about a point of interest that persists over its lifetime.

`class MKMapView`

An embeddable map interface, similar to the one that the Maps app provides.

---

# https://developer.apple.com/documentation/mapkit/mkaddress

- MapKit
- MKAddress

Class

# MKAddress

A class that contains a full address, and, optionally, a short address.

class MKAddress

## Discussion

MapKit capabilities, such as Search and Reverse geocoding, populate the `MKAddress` of a `MKMapItem` with a full address, and a short address, if the framework has one.

When presenting a Place Card using an `MKMapItemDetailViewController` or a selection accessory on an annotation you created using an `MKMapItem`, MapKit uses the full address provided if you create the `MKMapitem` using `init(location:address:)`.

## Topics

### Creating an address

`init?(fullAddress: String, shortAddress: String?)`

Initializes a new address with a location’s full address using a string and a short address that provides an abbreviated form of the address such as a street address.

### Getting the full and short addresses

`var fullAddress: String`

A string that represents a place’s full address

`var shortAddress: String?`

A string that represents the short address of a location, such as it’s street address and city.

## Relationships

### Inherits From

- `NSObject`

### Conforms To

- `CVarArg`
- `CustomDebugStringConvertible`
- `CustomStringConvertible`
- `Equatable`
- `Hashable`
- `NSObjectProtocol`

## See Also

### Representing places and addresses

`class MKMapItem`

A point of interest on the map.

`class MKAddressRepresentations`

A class that provides formatted address strings.

GeoToolbox

Determine place descriptor information for map coordinates.

---

# https://developer.apple.com/documentation/mapkit/mkaddressrepresentations

- MapKit
- MKAddressRepresentations

Class

# MKAddressRepresentations

A class that provides formatted address strings.

class MKAddressRepresentations

## Discussion

Use this class to obtain formatted address strings for a place’s full address, city, or region.

## Topics

### Getting parts of an address

`var cityName: String?`

The name of the city.

`var cityWithContext: String?`

The city name along with the country name, to provide additional disambiguating context.

`var regionName: String?`

The region name, such as “United States”.

`var region: Locale.Region?`

### Getting a full address and city name

Returns the the location’s full address, optionally including the country or on a single link without line breaks.

The city name and, optionally and if applicable, state and region to provide additional disambiguating context.

### Controlling the degree of disambiguation to include in an address representation

`enum ContextStyle`

Values that describe the degree of disambiguation context to include in an address representation.

## Relationships

### Inherits From

- `NSObject`

### Conforms To

- `CVarArg`
- `CustomDebugStringConvertible`
- `CustomStringConvertible`
- `Equatable`
- `Hashable`
- `NSObjectProtocol`

## See Also

### Representing places and addresses

`class MKMapItem`

A point of interest on the map.

`class MKAddress`

A class that contains a full address, and, optionally, a short address.

GeoToolbox

Determine place descriptor information for map coordinates.

---

# https://developer.apple.com/documentation/mapkit/pointofinterestcategories

- MapKit
- PointOfInterestCategories

Structure

# PointOfInterestCategories

A structure you use to define points of interest to include or exclude on a map.

MapKitSwiftUIMac CatalystvisionOS

struct PointOfInterestCategories

## Topics

### Categories to include or exclude

`static var all: PointOfInterestCategories`

A list of all points of interest categories, both included and excluded.

`static var excludingAll: PointOfInterestCategories`

A list of point of interest categories to exclude from display on the map.

### Modifying the categories to include or exclude

Show all points of interest except those belonging to certain categories using the array you provide.

Show all points of interest except those belonging to certain categories using the list you provide.

Show only points of interest belonging to certain categories from the provided array.

Show only points of interest belonging to certain categories from the provided list.

## Relationships

### Conforms To

- `Copyable`
- `ExpressibleByArrayLiteral`

---

# https://developer.apple.com/documentation/mapkit/dynamicmapcontent

- MapKit
- DynamicMapContent

Protocol

# DynamicMapContent

A  type of view that generates views from an underlying collection of data.

MapKitSwiftUIMac CatalystvisionOS

protocol DynamicMapContent : `MapContent`

## Topics

### Accessing the data

`var data: Self.Data`

The collection of underlying data.

**Required**

### Associated types

`associatedtype Data : Collection`

The type represents the data this protocol contains.

## Relationships

### Inherits From

- `MapContent`

## See Also

### Protocols

`protocol MapContent`

A protocol used to construct map content such as controls, markers, and annotations.

`struct MapContentBuilder`

A result builder that creates map content from closures you provide.

`struct MapContentView`

A view that contains content that displays on a map at a specific position, and that responds to specific interactions you specify.

---

# https://developer.apple.com/documentation/mapkit/mapcontent

- MapKit
- MapContent

Protocol

# MapContent

A protocol used to construct map content such as controls, markers, and annotations.

MapKitSwiftUIMac CatalystvisionOS

@ `MainActor` @preconcurrency
protocol MapContent

## Topics

### Accessing the view body

`var body: Self.Body`

The content and behavior of the view.

**Required**

### Supplying annotation titles

Sets the visibility of titles for markers and annotations.

Sets the visibility of subtitles for markers and annotations.

### Setting the content style

Specifies the shape style used to fill content in drawing map overlays.

The tint shape style to apply to map content.

### Setting stroke properties

Applies the given shape style to drawn map overlays using the line width you specify.

Applies the given shape style to drawn map overlays using the stroke style you specify.

Applies the given stoke drawn map overlays using the line width you specify.

Applies the given stroke style to drawn map overlays.

### Setting the overlay level

Specifies the position of overlays relative to other map content.

### Associated types

`associatedtype Body : MapContent`

### Displaying place information

Specifies the selection accessory to display for the selected map item content.

### Instance Methods

Sets the unique tag value of this piece of map content.

## Relationships

### Inherited By

- `DynamicMapContent`

### Conforming Types

- `Annotation`
- `AnyMapContent`
- `EmptyMapContent`
- `MapCircle`
- `MapPolygon`
- `MapPolyline`
- `Marker`
- `TupleMapContent`
- `UserAnnotation`

## See Also

### Protocols

`protocol DynamicMapContent`

A  type of view that generates views from an underlying collection of data.

`struct MapContentBuilder`

A result builder that creates map content from closures you provide.

`struct MapContentView`

A view that contains content that displays on a map at a specific position, and that responds to specific interactions you specify.

---

# https://developer.apple.com/documentation/mapkit/mapcontentview

- MapKit
- MapContentView

Structure

# MapContentView

A view that contains content that displays on a map at a specific position, and that responds to specific interactions you specify.

MapKitSwiftUIMac CatalystvisionOS

@ `MainActor` @preconcurrency

## Relationships

### Conforms To

- `Sendable`
- `SendableMetatype`
- `View`

## See Also

### Protocols

`protocol DynamicMapContent`

A  type of view that generates views from an underlying collection of data.

`protocol MapContent`

A protocol used to construct map content such as controls, markers, and annotations.

`struct MapContentBuilder`

A result builder that creates map content from closures you provide.

---

# https://developer.apple.com/documentation/mapkit/defaultuserannotationcontent

- MapKit
- DefaultUserAnnotationContent

Structure

# DefaultUserAnnotationContent

A structure that represents the view to show at the user’s location on the map.

MapKitSwiftUIMac CatalystvisionOS

@ `MainActor` @preconcurrency
struct DefaultUserAnnotationContent

## Overview

Don’t use this type directly. Instead, MapKit creates this type on your behalf.

## Relationships

### Conforms To

- `Sendable`
- `SendableMetatype`
- `View`

## See Also

### Structures

`struct EmptyMapContent`

A map content element that doesn’t contain any content.

`struct MapProxy`

A proxy for accessing sizing information about a given map view.

`struct MapReader`

A container view that defines its contents as a function of information about the first contained map.

`struct TupleMapContent`

A view created from a Swift tuple of map content values.

`struct MapSelectableContentView`

---

# https://developer.apple.com/documentation/mapkit/emptymapcontent

- MapKit
- EmptyMapContent

Structure

# EmptyMapContent

A map content element that doesn’t contain any content.

MapKitSwiftUIMac CatalystvisionOS

@ `MainActor` @preconcurrency
struct EmptyMapContent

## Topics

### Creating an empty map content structure

`init()`

Creates an empty map content element.

## Relationships

### Conforms To

- `MapContent`
- `Sendable`
- `SendableMetatype`

## See Also

### Structures

`struct DefaultUserAnnotationContent`

A structure that represents the view to show at the user’s location on the map.

`struct MapProxy`

A proxy for accessing sizing information about a given map view.

`struct MapReader`

A container view that defines its contents as a function of information about the first contained map.

`struct TupleMapContent`

A view created from a Swift tuple of map content values.

`struct MapSelectableContentView`

---

# https://developer.apple.com/documentation/mapkit/mapproxy

- MapKit
- MapProxy

Structure

# MapProxy

A proxy for accessing sizing information about a given map view.

MapKitSwiftUIMac CatalystvisionOS

struct MapProxy

## Topics

### Creating a camera proxy

Creates a camera in the context of the map that frames the given coordinate region.

Creates a camera in the context of the map that frames the given map rectangle.

Creates a camera in the context of the map that frames the given map item.

### Converting between coordinate spaces

Converts a map coordinate to a point in the specified coordinate space.

Converts a point in the specified coordinate space to a map coordinate.

## See Also

### Structures

`struct DefaultUserAnnotationContent`

A structure that represents the view to show at the user’s location on the map.

`struct EmptyMapContent`

A map content element that doesn’t contain any content.

`struct MapReader`

A container view that defines its contents as a function of information about the first contained map.

`struct TupleMapContent`

A view created from a Swift tuple of map content values.

`struct MapSelectableContentView`

---

# https://developer.apple.com/documentation/mapkit/mapreader

- MapKit
- MapReader

Structure

# MapReader

A container view that defines its contents as a function of information about the first contained map.

MapKitSwiftUIMac CatalystvisionOS

@ `MainActor` @preconcurrency

## Overview

The map reader’s content builder receives a `MapProxy` instance. You can use this instance to get the information you’ll need to convert between a `MapCamera` and a `MKMapRect` or `MKCoordinateRegion`.

## Topics

### Creating a map reader

Creates an instance that allows view content to reference information about a contained map.

## Relationships

### Conforms To

- `Sendable`
- `SendableMetatype`
- `View`

## See Also

### Structures

`struct DefaultUserAnnotationContent`

A structure that represents the view to show at the user’s location on the map.

`struct EmptyMapContent`

A map content element that doesn’t contain any content.

`struct MapProxy`

A proxy for accessing sizing information about a given map view.

`struct TupleMapContent`

A view created from a Swift tuple of map content values.

`struct MapSelectableContentView`

---

# https://developer.apple.com/documentation/mapkit/tuplemapcontent

- MapKit
- TupleMapContent

Structure

# TupleMapContent

A view created from a Swift tuple of map content values.

MapKitSwiftUIMac CatalystvisionOS

@ `MainActor` @frozen @preconcurrency

## Topics

### Accessing the tuple value

`var value: T`

The contents of the tuple.

## Relationships

### Conforms To

- `MapContent`
- `Sendable`
- `SendableMetatype`

## See Also

### Structures

`struct DefaultUserAnnotationContent`

A structure that represents the view to show at the user’s location on the map.

`struct EmptyMapContent`

A map content element that doesn’t contain any content.

`struct MapProxy`

A proxy for accessing sizing information about a given map view.

`struct MapReader`

A container view that defines its contents as a function of information about the first contained map.

`struct MapSelectableContentView`

---

# https://developer.apple.com/documentation/mapkit/mapselectablecontentview

- MapKit
- MapSelectableContentView

Structure

# MapSelectableContentView

MapKitSwiftUIMac CatalystvisionOS

@ `MainActor` @preconcurrency

## Relationships

### Conforms To

- `Sendable`
- `SendableMetatype`
- `View`

## See Also

### Structures

`struct DefaultUserAnnotationContent`

A structure that represents the view to show at the user’s location on the map.

`struct EmptyMapContent`

A map content element that doesn’t contain any content.

`struct MapProxy`

A proxy for accessing sizing information about a given map view.

`struct MapReader`

A container view that defines its contents as a function of information about the first contained map.

`struct TupleMapContent`

A view created from a Swift tuple of map content values.

---

# https://developer.apple.com/documentation/mapkit/mapkit-for-appkit-and-uikit

Collection

- MapKit
- MapKit for AppKit and UIKit

API Collection

# MapKit for AppKit and UIKit

## Topics

### Essentials

Enabling Maps capability in Xcode

Configure your routing app to support providing directions.

Identifying unique locations with Place IDs

Obtain information about a point of interest that persists over its lifetime.

`class MKMapView`

An embeddable map interface, similar to the one that the Maps app provides.

`class MKMapItem`

A point of interest on the map.

### Map coordinates

`struct MKCoordinateRegion`

A rectangular geographic region that centers around a specific latitude and longitude.

`struct MKCoordinateSpan`

The width and height of a map region.

`struct MKMapRect`

A rectangular area on a two-dimensional map projection.

`struct MKMapPoint`

A point on a two-dimensional map projection.

`struct MKMapSize`

Width and height information on a two-dimensional map projection.

`class MKDistanceFormatter`

A utility object that converts between a geographic distance and a string-based expression of that distance.

### Map customization

`class MKMapCamera`

A virtual camera for defining the appearance of the map.

`class MKCompassButton`

A specialized view that displays the compass heading for its associated map.

`class MKScaleView`

A specialized view that displays the scale information for its associated map.

`class MKZoomControl`

A specialized view that displays and controls the zoom level of the map view.

`class MKPitchControl`

A specialized view that displays and controls the pitch angle of the map view.

`class MKUserTrackingButton`

A specialized button that allows the user to toggle whether the map tracks to the heading the user is facing.

`class MKUserTrackingBarButtonItem`

A specialized bar button item that allows the user to toggle whether the map tracks to the heading the user is facing.

### Annotations and overlays

Create annotations to add indicators and additional details for specific locations on a map.

Create overlays to highlight geographic regions or paths.

### Directions

`class MKDirections`

A utility object that computes directions and travel-time information based on the route information you provide.

`class Request`

The start and end points of a route, along with the planned mode of transportation.

`class Response`

The route information that Apple servers return in response to your request for directions.

`class ETAResponse`

The travel-time information that Apple servers return.

`class MKRoute`

A single route between a requested start and end point.

`class Step`

One portion of an overall route.

### Geographical features

Displaying an Indoor Map

Use the Indoor Mapping Data Format (IMDF) to show an indoor map with custom overlays and points of interest.

`class MKGeoJSONDecoder`

An object that decodes GeoJSON objects into MapKit types.

`class MKGeoJSONFeature`

The decoded representation of a GeoJSON feature.

`protocol MKGeoJSONObject`

Objects that the GeoJSON decoder can return.

### Local search

Interacting with nearby points of interest

Provide automatic search completions for a partial search query, search the map for relevant locations nearby, and retrieve details for selected points of interest.

`enum MKLocalSearchRegionPriority`

A value that indicates the importance of the configured region.

`struct ResultType`

Options that indicate types of search results.

`class MKLocalSearch`

A utility object for initiating map-based searches and processing the results.

`struct Options`

A structure that contains options for filtering results in a search.

`class MKAddressFilter`

An object that filters which address options to include or exclude in search results.

Options that indicate types of search completions.

`class MKLocalSearchCompleter`

A utility object for generating a list of completion strings based on a partial search string that you provide.

`class MKLocalSearchCompletion`

A fully formed string that completes a partial string.

`class MKLocalPointsOfInterestRequest`

A structured request to use when searching for points of interest.

### Exploring at street level

`class MKLookAroundScene`

A utility class that encapsulates information the framework requires to retrieve and display a specific Look Around location’s imagery.

`class MKLookAroundSceneRequest`

A class you use to request a LookAround scene at the location you specify.

`class MKLookAroundViewController`

A class that manages the presentation and display of a LookAround view.

`class MKLookAroundSnapshotter`

A utility class that you use to create a static image from a LookAround scene.

### Place information

`protocol MKMapItemDetailViewControllerDelegate`

The methods that you use to receive events from an associated map view controller.

`class MKMapItemDetailViewController`

An object that displays detailed information about a map item.

`class MapItemDetailPresentationStyle`

The type of map item detail accessory presentation to use.

`class MKSelectionAccessory`

The type of accessory to display for a selected annotation.

`enum CalloutStyle`

The style to use for a map item detail callout presentation.

### Points of interest

`class MKMapFeatureAnnotation`

A class that describes an annotation element on the map’s display such as a point of interest, territorial boundary, or physical feature.

`struct MKMapFeatureOptions`

A structure you use to tell the map which kinds of features users can interact with.

`class MKMapItemRequest`

A utility class you use to request additional information about a map feature.

`class MKIconStyle`

A class you use to customize the annotation view icon of a point of interest (POI) on the map.

`class MKPointOfInterestFilter`

A filter that includes or excludes point of interest categories from a map view, local search, or local search completer.

`struct MKPointOfInterestCategory`

A point of interest category.

### Static map snapshots

`class MKMapSnapshotter`

A utility class for capturing a map and its content into an image.

`class Snapshot`

An image that a snapshotter object generates.

### Reference

The functions of the MapKit framework provide convenient ways to package map-related data structures.

### Errors

`let MKErrorDomain: String`

The error domain for MapKit.

`struct MKError`

Error constants for the MapKit framework.

`enum Code`

### Deprecated

Map protocols and view modifiers that are no longer supported.

## See Also

### The MapKit APIs

MapKit for SwiftUI allows you to build map-centric views and apps across Apple platforms. You can design expressive and highly interactive Maps with minimal code by composing views, using ViewBuilders and view modifiers.

Adopting unified Maps URLs

Access Maps URLs and options for displaying Maps information across Apple platforms.

---

# https://developer.apple.com/documentation/mapkit/unified-map-urls

- MapKit
- Adopting unified Maps URLs

Article

# Adopting unified Maps URLs

Access Maps URLs and options for displaying Maps information across Apple platforms.

## Overview

In iOS 18.4 and later, macOS 15.4 and later, and watchOS 11.4 and later, the Maps platform provides a new, unified collection of URLs that offers the same functionality on all devices. Use the Maps path components to control aspects of the Maps display, ranging from the presentation of a simple map centered on a location you provide, to finding specific points of interest (POIs) and providing complex multistop driving, walking, or transit directions.

## Frame the map display

Use the `/frame` path component and `query` parameters to control aspects of the map’s framing and representation. This component allows you to set a map’s orientation, style, visible area (the map’s span), and other perspective controls, as described in the table below.

| Parameter | Description |
| --- | --- |
| `center` | Frames the map on a specific center described by comma-separated coordinate pair, such as `40.773957,-73.970974`. |
| `span` | Specifies the size of the area around the center point of the search in degrees of longitude and latitude, for example `0.05,0.05`, which is approximately one km for these examples. For more information on what these distances mean at different latitudes, see `init(latitudeDelta:longitudeDelta:)`. |
| `mode` | Sets the map’s mode to optionally allow location tracking: values can be `follow` or `follow-with-heading`, or `none`. |
| `heading` | Sets the direction toward which the map orients. |
| `pitch` | Sets the the vertical angle the map is oriented to. |
| `distance` | Sets the apparent distance from the viewer to the map surface; this parameter also affects the map’s `span`. |
| `map` | Sets the type of map to display: values can be `explore`, `driving`, `transit`, `satellite`, or `hybrid`. |

The following `/frame` path component examples demonstrate different kinds of map framing, along with details, where necessary, on how specific parameters affect what the map displays.

- Center the map at specific coordinate —

- Set map mode to transit and center map at specific coordinate —

- Set the map mode to `explore` and set user tracking to `follow` —

- Set map mode to `explore`; this setting cause the map to focus on a specified coordinate, and sets the map camera attributes —

- Set the map mode to `explore`, and set location tracking mode to `follow` — If you’re setting tracking mode and camera properties, the tracking mode takes precedence. Setting camera properties requires a center coordinate.

- Center the map at a specific coordinate and frame the map to the specified span —  It’s also possible to frame the map using the `distance` parameter, for example,

- Set the map mode to `explore`, which centers the map at a specified coordinate, and sets the map camera elevation, heading, and angle; in this example, facing East (90˚), a distance of 1 km, and a map pitch of 15˚ —

- Center the map at a specific coordinate and set the camera `distance` —

- Center the map at a specific coordinate and set the camera to the specified properties — If you provide both the `span` and `camera` properties, the `camera` properties take precedence, since they’re more specific than a `span`.

## Perform general searches

You can use the `/search` path component to search for specific kinds of locations using several `query` parameters.

| Parameter | Description |
| --- | --- |
| `center` | Searches the map starting at a specific center point described by a comma-separated coordinate pair, such as `40.773957,-73.970974`. |
| `query` | A search string. This parameter can be a general point of interest (POI) such as `pizza`, or a specific location such as an address string, such as `1000 Fifth Avenue, NY, NY`, or a city name such as `San Francisco`. For a list of POIs, see `MKPointOfInterestCategory`. |
| `span` | A span that specifies the size of the area around the center point of the search in degrees of longitude and latitude, for example `0.05,0.05` which is approximately 1 km for these examples. For more information on what these distances mean at different latitudes, see `init(latitudeDelta:longitudeDelta:)`. |

The following `/search` path component examples demonstrate how to use the `search` path component to find `pizza`, one of Maps’ POI identifiers, using different kinds of location and distance descriptions.

- Show results for `pizza` around a person’s location: The default center point is a person’s location.

- Show results for `pizza` centered on Trafalgar Square in London, United Kingdom —

- Show results for `pizza` within approximately 1 km around Washington Square Park in New York City —

## Show the place card of a POI

Using the `/place` path component enables you to specify a place card that shows useful details about points of interest on the map. Use the parameters in the following table to specify a POI and optionally the place card name and map type.

| Parameter | Description |
| --- | --- |
| `coordinate` | The latitude and longitude of the location, as a comma-separated pair of floating point values that represent latitude and longitude. |
| `address` | The address of the location, such as “1000 Fifth Ave, New York, NY”. |
| `place-id` | A Place ID is a unique identifier for a POI, such as `I521E602783BA9605`, The Metropolitan Museum of Art at 1000 Fifth Avenue, New York, NY 10028, United States; for more information on Place IDs, see Identifying unique locations with Place IDs. |
| `map` | The type of map to display. Maps supports `explore`, `driving`, `transit`, `satellite`, or `hybrid` as the map type. |

The following examples demonstrate different place card details along with details, where necessary, on how specific parameters affect what the maps displays.

- Show the address 1000 Fifth Ave, NY, NY, which is located at the specified coordinate and associated POIs near this address —

- Show 1000 Fifth Ave, NY, NY, 10028 using an address string and display associated POIs near this address:

- Show the place at PlaceID `IF149E70A3B3C4CB2` — American Museum of Natural History, 200 Central Park W, New York, NY 10024, United States — To find a specific Place ID, you can use `MKMapItem` in AppKit and UIKit, `Place` in MapKitJS, or see Place ID Lookup.

- Show a place card at the specified coordinate with custom name you provide — You can use this parameter when dropping a pin if you need to display a custom name for the place card.

- Show a person’s current location — This parameter requires that a person has given permission for Maps to display their location.

- Show the location of a person’s parked car — This parameter requires that a person has given Maps permission to record the place they parked.

## Explore the environment using Look Around

Use the `/look-around` path component and one of the following parameters to specify the initial location to start a session using Look Around.

| Parameter | Description |
| --- | --- |
| `coordinate` | The latitude and longitude of the location as a comma-separated pair of floating point values that represent latitude and longitude. |
| `address` | The address of the location. This parameter is an address string, such as “1000 Fifth Avenue, New York, NY 10028”. |
| `place-id` | A Place ID, which is a unique identifier for a point of interest, such as `I521E602783BA9605`, The Metropolitan Museum of Art at 1000 Fifth Avenue, New York, NY 10028, United States; for more information on Place IDs, see Identifying unique locations with Place IDs. |

The following examples demonstrate Look Around experiences in different cities:

- The San Francisco Ferry Building —

- The New York Stock Exchange, New York City, United States —

- The Tower of London, London, United Kingdom —

- The Eiffel Tower, Paris, France —

## Request directions

Use the `/directions` path component and following query parameters in several combinations to request directions.

| Parameters | Description | Values | Notes |
| --- | --- | --- | --- |
| `source` | The starting point of the navigation route | Specify an address, coordinate, or a place name | |
| `source-place-id` | An optional place identifier for the source parameter | A Place ID | Specifying a `source-place-id` also requires the `source` parameter |
| `destination` | The ending destination of the navigation route | Specify an address, coordinate, or a place name | |
| `destination-place-id` | An optional place identifier for the destination parameter | A Place ID | Specifying a `destination-place-id` also requires the `destination` parameter |
| `waypoint` | This parameter describes destinations in between the `source` and `destination` you can use for multistop routing | Specify an address, coordinate, or a place name | You can specify multiple waypoints by repeating the `waypoint` parameter |
| `waypoint-place-id` | An optional place identifier for the waypoint parameter | A Place ID, which is a unique identifier for a point of interest, such as `I521E602783BA9605`, The Metropolitan Museum of Art at 1000 Fifth Avenue, New York, NY 10028, United States; for more information on Place IDs, see Identifying unique locations with Place IDs | |
| `mode` | The transportation mode | You can specify one of `driving`, `walking`, `transit`, or `cycling` | |
| `avoid` | The route preferences are specific to the transportation mode | You can specify `tolls`, `highways`, `busy-roads`, or `stairs` | Specify multiple options by using a comma (,) as the delimiter |
| `transit-preferences` | The preferred method of travel for transit | Available modes are `bus`, `subway`, `commuter`, or `ferry` | Specify multiple options by using the comma (,) as the delimiter |
| `start` | Starts navigation after the delay in seconds that you specify | An integer that indicates the number of seconds to delay | |

You can use the query parameters to the `directions` path in a large number of combinations to control how Maps displays directions. Limitations on the combinators or side effect that they may have are listed in the table above.

- Show driving directions from a person’s current location to San Francisco City Hall:

- Show the step-by-step walking directions from the San Franciso Ferry Building to San Francisco City Hall:

- Show multistop driving directions to The San Francisco Ferry Building and San Francisco City Hall — You can specify multiple `waypoint` parameters for different waypoints.

- Show multistop driving directions, in New York City, from Riverside Park to The American Museum of Natural History, The Metropolitan Museum of Art, and The New York Public Library —

- Show transit directions from the New York Public Library to the American Museum of Natural History in New York City — Leaving off the `source` instructs Maps to display directions using public transit to the specified destination from a person’s current location, which might not be practical depending on a person’s location.

- Show driving directions from The American Museum of Natural History in New York City to Jones Beach State Park on Long Island, New York, avoiding tolls, if possible —

- Show driving directions to 941 Alamo Dr, in San Francisco, CA avoiding tolls and highways, if possible — You can use ‘,’ as a separator to specify multiple `avoid` options.

- Show walking directions from, a person’s current location to 1 La Avanzada St, San Francisco, CA avoiding highways, hills, stairs, and busy roads, if possible — The `avoid` options are only applicable to their respective transportation modes.

- Show transit directions from a person’s current location to Sausalito, preferring bus and ferry — Leaving off the `source` instructs Maps to display directions using public transit to the specified destination from a person’s current location, which might not be practical depending on their location.

## Find guides and curated places

Using the `/guides` path component, you can ask Maps to provide details about place guides and curated collections using the following URL:

## Report a problem

If you find an issue with Apple Maps, you can report a problem using the `/report-a-problem path` component, followed by any of the following parameters:

| Parameters | Description | Values |
| --- | --- | --- |
| `coordinate` | The latitude and longitude of the location | A comma-separated pair of floating point values that represent latitude and longitude |
| `address` | The address of the location | An address string, such as 1000 Fifth Avenue |
| `place-id` | The unique Place ID for a point of interest; for example, the place ID `I8CAD8EFA77AA3D42` represents Bethesda Terrace in New York City’s Central Park | For more information on Place IDs, see Identifying unique locations with Place IDs |

### Example problem reports

You can report a problem using the same kinds of location descriptors the other queries use. The following examples show how to report a problem using a coordinate, an address, or a Place ID.

- Report a problem at the coordinate `40.753035,-73.981846` (The New York Public Library at 42nd St & 5th Ave in New York City) -

- Report a problem at the address 1000 Fifth Avenue, New York, NY 10028 United States —

- Report a problem at Place ID `IBE1F65094A7A13B1`, the San Francisco Ferry Building —

When you open the `report-a-problem` URL, Maps opens a problem report sheet to ask a person for more detail on the nature of the problem, which Apple uses to investigate the report.

## Retrieve a full Maps URL from a shortened URL

When people share a map URL from Maps, this system creates a shortened version that’s more efficient to send in the app, for example, Messages or Mail. If you need to recover the full URL, follow these steps:

1. Check to see if the URL is a shortened Apple Maps URL; the host portion of an Apple shortened Maps URLs always end in `maps.apple` (no `.com`).

2. Attempt to access the URL programmatically, the full Apple Maps URL is accessible from the `HTTP 301` redirect response that the `maps.apple` server returns.

## See Also

### The MapKit APIs

MapKit for SwiftUI allows you to build map-centric views and apps across Apple platforms. You can design expressive and highly interactive Maps with minimal code by composing views, using ViewBuilders and view modifiers.

---

# https://developer.apple.com/documentation/mapkit/mapcontentbuilder)



---

# https://developer.apple.com/documentation/mapkit/marker)



---

# https://developer.apple.com/documentation/mapkit/annotation)



---

# https://developer.apple.com/documentation/mapkit/mappolyline),



---

# https://developer.apple.com/documentation/mapkit/lookaroundpreview)



---

# https://developer.apple.com/documentation/mapkit/searching-displaying-and-navigating-to-places)

# The page you're looking for can't be found.

Search developer.apple.comSearch Icon

---

# https://developer.apple.com/documentation/mapkit/map)



---

# https://developer.apple.com/documentation/mapkit/mapstyle)



---

# https://developer.apple.com/documentation/mapkit/mapcircle)



---

# https://developer.apple.com/documentation/mapkit/mappolygon)



---

# https://developer.apple.com/documentation/mapkit/mappolyline)



---

# https://developer.apple.com/documentation/mapkit/userannotation)



---

# https://developer.apple.com/documentation/mapkit/mapcompass)



---

# https://developer.apple.com/documentation/mapkit/maplocationcompass)



---

# https://developer.apple.com/documentation/mapkit/mappitchslider)



---

# https://developer.apple.com/documentation/mapkit/mappitchtoggle)



---

# https://developer.apple.com/documentation/mapkit/mapscaleview)



---

# https://developer.apple.com/documentation/mapkit/mapuserlocationbutton)



---

# https://developer.apple.com/documentation/mapkit/mapzoomstepper)



---

# https://developer.apple.com/documentation/mapkit/mapfeature)



---

# https://developer.apple.com/documentation/mapkit/mapselection)



---

# https://developer.apple.com/documentation/mapkit/mapselectable)



---

# https://developer.apple.com/documentation/mapkit/mapcamera)



---

# https://developer.apple.com/documentation/mapkit/mapcamerabounds)



---

# https://developer.apple.com/documentation/mapkit/mapcameraposition)



---

# https://developer.apple.com/documentation/mapkit/mapcameraupdatecontext)



---

# https://developer.apple.com/documentation/mapkit/mapcameraupdatefrequency)



---

# https://developer.apple.com/documentation/mapkit/mapitemdetailselectionaccessorystyle)

# The page you're looking for can't be found.

Search developer.apple.comSearch Icon

---

# https://developer.apple.com/documentation/mapkit/mapcontent/mapitemdetailselectionaccessory(_:))

)#app-main)

# The page you're looking for can't be found.

Search developer.apple.comSearch Icon

---

# https://developer.apple.com/documentation/mapkit/mapitemdetailselectionaccessorystyle/callout(_:))

)#app-main)

# The page you're looking for can't be found.

Search developer.apple.comSearch Icon

---

# https://developer.apple.com/documentation/mapkit/mkgeocodingrequest)



---

# https://developer.apple.com/documentation/mapkit/mkreversegeocodingrequest)



---

# https://developer.apple.com/documentation/mapkit/mkmapitem)



---

# https://developer.apple.com/documentation/mapkit/mkaddress)



---

# https://developer.apple.com/documentation/mapkit/mkaddressrepresentations)



---

# https://developer.apple.com/documentation/mapkit/pointofinterestcategories)



---

# https://developer.apple.com/documentation/mapkit/dynamicmapcontent)



---

# https://developer.apple.com/documentation/mapkit/mapcontent)



---

# https://developer.apple.com/documentation/mapkit/mapcontentview)



---

# https://developer.apple.com/documentation/mapkit/defaultuserannotationcontent)



---

# https://developer.apple.com/documentation/mapkit/emptymapcontent)



---

# https://developer.apple.com/documentation/mapkit/mapproxy)



---

# https://developer.apple.com/documentation/mapkit/mapreader)



---

# https://developer.apple.com/documentation/mapkit/tuplemapcontent)



---

# https://developer.apple.com/documentation/mapkit/mapselectablecontentview)



---

# https://developer.apple.com/documentation/mapkit/mapkit-for-appkit-and-uikit)



---

# https://developer.apple.com/documentation/mapkit/unified-map-urls)



---

# https://developer.apple.com/documentation/mapkit/annotation/init(_:coordinate:anchor:accessoryanchor:content:)-6rxmn

-6rxmn#app-main)

- MapKit
- Annotation
- init(\_:coordinate:anchor:accessoryAnchor:content:)

Initializer

# init(\_:coordinate:anchor:accessoryAnchor:content:)

Creates an annotation that displays a view at a coordinate on the map.

MapKitSwiftUIMac Catalyst

@ `MainActor` @preconcurrency
init(
_ titleKey: `LocalizedStringKey`,
coordinate: `CLLocationCoordinate2D`,
anchor: `UnitPoint` = .center,
accessoryAnchor: `UnitPoint`,

) where Label == `Text`

## Parameters

`titleKey`

The localized string key to use to look up the title.

`coordinate`

The coordinate position of the annotation.

`anchor`

A `UnitPoint` value that indicates how to position the content around the provided coordinate.

`accessoryAnchor`

A `UnitPoint` value that indicates how to place accessories around the provided content.

`content`

The view to place on the map.

## See Also

### Creating annotations

Creates an annotation that displays a view at a coordinate on the map using a title key, coordinate, anchor location, and view you provide.

Creates an annotation that displays a view on the map using coordinates, anchor location, view, and label you provide.

---

# https://developer.apple.com/documentation/mapkit/annotation/init(_:coordinate:anchor:accessoryanchor:content:)-14m3t

-14m3t#app-main)

- MapKit
- Annotation
- init(\_:coordinate:anchor:accessoryAnchor:content:)

Initializer

# init(\_:coordinate:anchor:accessoryAnchor:content:)

Creates an annotation that displays a view at a coordinate on the map.

MapKitSwiftUIMac Catalyst

@ `MainActor` @preconcurrency

_ title: S,
coordinate: `CLLocationCoordinate2D`,
anchor: `UnitPoint` = .center,
accessoryAnchor: `UnitPoint`,

) where Label == `Text`, S : `StringProtocol`

## Parameters

`title`

The title of the annotation.

`coordinate`

The coordinate position of the annotation.

`anchor`

A `UnitPoint` value that indicates how to position the content around the provided coordinate.

`accessoryAnchor`

A `UnitPoint` value that indicates how to place accessories around the provided content.

`content`

The view to place on the map.

## See Also

### Creating annotations

Creates an annotation that displays a view at a coordinate on the map using a title key, coordinate, anchor location, and view you provide.

Creates an annotation that displays a view on the map using coordinates, anchor location, view, and label you provide.

---

# https://developer.apple.com/documentation/mapkit/annotation/init(coordinate:anchor:accessoryanchor:content:label:)

#app-main)

- MapKit
- Annotation
- init(coordinate:anchor:accessoryAnchor:content:label:)

Initializer

# init(coordinate:anchor:accessoryAnchor:content:label:)

Creates an annotation that displays a view at a coordinate on the map.

MapKitSwiftUIMac Catalyst

@ `MainActor` @preconcurrency
init(
coordinate: `CLLocationCoordinate2D`,
anchor: `UnitPoint` = .center,
accessoryAnchor: `UnitPoint`,

)

## Parameters

`coordinate`

The coordinate position of the annotation.

`anchor`

A `UnitPoint` value that indicates how to position the content around the provided coordinate.

`accessoryAnchor`

A `UnitPoint` value that indicates how to place accessories around the provided content.

`content`

The view to place on the map.

`label`

The label for the annotation, including a title, and optional subtitle.

## See Also

### Creating annotations

Creates an annotation that displays a view at a coordinate on the map using a title key, coordinate, anchor location, and view you provide.

Creates an annotation that displays a view on the map using coordinates, anchor location, view, and label you provide.

---

# https://developer.apple.com/documentation/mapkit/annotation/init(item:anchor:accessoryanchor:content:)

#app-main)

- MapKit
- Annotation
- init(item:anchor:accessoryAnchor:content:)

Initializer

# init(item:anchor:accessoryAnchor:content:)

Creates an annotation that displays a view at a coordinate on the map.

MapKitSwiftUIMac Catalyst

@ `MainActor` @preconcurrency
init(
item: `MKMapItem`,
anchor: `UnitPoint` = .center,
accessoryAnchor: `UnitPoint` = .center,

) where Label == `Text`

## Parameters

`item`

A map item that provides a label and coordinate for the annotation.

`anchor`

A `UnitPoint` value that indicates how to position the content around the provided coordinate.

`accessoryAnchor`

A `UnitPoint` value that indicates how to place accessories around the provided content.

`content`

The view to place on the map.

## See Also

### Creating annotations

Creates an annotation that displays a view at a coordinate on the map using a title key, coordinate, anchor location, and view you provide.

Creates an annotation that displays a view on the map using coordinates, anchor location, view, and label you provide.

---

# https://developer.apple.com/documentation/mapkit/annotation/init(_:coordinate:anchor:content:)-2w242

-2w242#app-main)

- MapKit
- Annotation
- init(\_:coordinate:anchor:content:)

Initializer

# init(\_:coordinate:anchor:content:)

Creates an annotation that displays a view at a coordinate on the map.

MapKitSwiftUIMac CatalystvisionOS

@ `MainActor` @preconcurrency
init(
_ titleKey: `LocalizedStringKey`,
coordinate: `CLLocationCoordinate2D`,
anchor: `UnitPoint` = .center,

) where Label == `Text`

## Parameters

`titleKey`

The localized string key to use to look up the title.

`coordinate`

The coordinate position of the annotation.

`anchor`

A `UnitPoint` value that indicates how to position the content around the provided coordinate.

`content`

The view to place on the map.

## See Also

### Creating annotations

Creates an annotation that displays a view at a coordinate on the map using a title key, coordinate, anchor location, and view you provide.

Creates an annotation that displays a view on the map using coordinates, anchor location, view, and label you provide.

---

