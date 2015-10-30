# SwiftMKMapViewDemo
MKMapView based demo application build using Swift 2, Xcode 7, and iOS 9

## Overview
Swift based demo that shows map functionality within iOS application. It uses ``MKMapView`` component to display map and ``MapKit`` for various map functionality. You can use this application as a base for any ``Map Based`` iOS project and expand it. It's free for personal or commercial use.

**It consist functionality below:**
+ Load map using ``MKMapView``
+ Change map type using ``UISegmentedControl``
+ Ask for location access permission upon.
+ Access user location using ``CoreLocation``
+ Zoon In/Out of map.

![ScreenShot iPhone4](../master/Screenshots/main-1t.png)
![ScreenShot iPhone4](../master/Screenshots/main-2t.png)

## Platform
+ Swift 2
+ Xcode 7
+ iOS 9

## Supported Device
iPhone 4s, 5, 5s, 5c, 6, 6 Plus, 6s, 6s Plus, all iPad having iOS 9.

## Technology Used
+ Map Component ``MKMapView``.
+ Map library ``MapKit``.
+ Change map type using ``UISegmentedControl``
+ Access user location using ``CoreLcoation`` 
+ Simple and Clean interface.
+ Build with Xcode storyboard.
+ Adaptive layout for major screen size support.
+ Created with ``Swift 2``, ``Xcode 7``, ``iOS 9``.

## How To Ask For Location Permission
For detecting user location below steps should be followed.

+ Do ``import CoreLocation`` within view controller. 
+ Add permission key/value pair within ``info.plist`` file.
+ Ask for location permission within ``viewDidLoad()``. 
+ Once permission granted, you can access location anytime.

Add permission key (type string) within ``info.plist`` file.
<pre>
Key:  NSLocationWhenInUseUsageDescription
Value: Like to know your current location.
</pre>

Add below code within ``viewDidLoad()`` for asking location permission.
<pre>
override func viewDidLoad() {
  super.viewDidLoad()
  
  //...
  
  // request location access permission from user.
  self.locationManager.requestWhenInUseAuthorization()

  //---
}
</pre>

## Screenshots

![ScreenShot iPhone4](../master/Screenshots/main-1t.png)
![ScreenShot iPhone4](../master/Screenshots/main-2t.png)

![ScreenShot iPhone4](../master/Screenshots/main-3t.png)
![ScreenShot iPhone4](../master/Screenshots/main-4t.png)

## License
SwiftMKMapViewDemo is available under the MIT license. See the LICENSE file for more info.
