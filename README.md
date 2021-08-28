# iOS-Vibration
Many ways to vibrate your app
```swift
enum Vibration: Int, CaseIterable {
    case error = 0
    case success
    case warning
    case light
    case medium
    case heavy
    @available(iOS 13.0, *)
    case soft
    @available(iOS 13.0, *)
    case rigid
    case selection
    case oldSchool
    case v1519 // weak 
    case v1520 // strong
    case v1521 // 3 weak
}
```
