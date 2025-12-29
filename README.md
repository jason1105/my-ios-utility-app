# Runner Utility - iOS Running Conversion App

<img src="https://img.shields.io/badge/iOS-15.0+-blue.svg" alt="iOS 15.0+">
<img src="https://img.shields.io/badge/Swift-5.5+-orange.svg" alt="Swift 5.5+">
<img src="https://img.shields.io/badge/SwiftUI-2.0+-green.svg" alt="SwiftUI 2.0+">
<img src="https://img.shields.io/badge/Xcode-15.0+-blue.svg" alt="Xcode 15.0+">

A beginner-friendly iOS utility app for marathon runners built with SwiftUI. This app provides quick and easy conversions for distances, speeds, and paces - all the essential tools a runner needs!

## 📱 Features

### Distance Conversions
- **Miles ↔ Kilometers**: Convert between the two most common distance units
- **Meters ↔ Feet**: Useful for elevation and track measurements
- **Quick Reference**: Pre-calculated common race distances (5K, 10K, Half Marathon, Marathon)

### Unified Speed & Pace Conversions
All speed and pace units in one unified view! Edit any field and watch all others update automatically:
- **mph** (miles per hour) - Speed in imperial units
- **km/h** (kilometers per hour) - Speed in metric units
- **min/mile** (minutes per mile) - Running pace in imperial units
- **min/km** (minutes per kilometer) - Running pace in metric units

**Understanding Speed vs Pace:**
- **Speed** (🚀) tells you how fast you're moving (mph or km/h)
- **Pace** (🏃‍♂️) tells you how long it takes to cover a distance (min/mile or min/km)
- Example: Running at **6 mph** is the same as a **10:00 min/mile** pace
- The relationship: Speed = 60 ÷ Pace (when using matching units)

**Key Features:**
- ⚡ **Real-time bidirectional conversion** - Edit any field, all others update instantly
- 🔄 **MM:SS format for pace** - More intuitive format (e.g., 8:30 instead of 8.5)
- 📊 **Visual feedback** - Colored border shows which field you're editing
- 📚 **Quick Reference** - Common running speeds and paces for all units
- 💡 **Educational** - Understand how speed and pace relate to each other

### User Experience
- ⚡ **Real-time conversion** as you type
- 📊 **Visual organization** with color-coded sections
- 🎯 **Clean, modern interface** using SwiftUI
- 📱 **Tab-based navigation** for easy access to different tools
- 🏃‍♂️ **Runner-friendly pace format** (MM:SS) for easier understanding

## 🚀 Getting Started

### Prerequisites

To run this app, you'll need:
- **A Mac computer** (MacBook, iMac, Mac Mini, or Mac Studio)
- **macOS** 13.0 (Ventura) or later
- **Xcode** 15.0 or later (free from the Mac App Store)
- **No developer account needed** for running in the simulator!

### Installation Steps

1. **Install Xcode** (if you haven't already)
   - Open the **Mac App Store**
   - Search for "Xcode"
   - Click **Get** or **Install** (it's free, but the download is large - around 15GB)
   - Wait for the installation to complete (this can take a while)

2. **Download or Clone this Project**
   
   **Option A: Download as ZIP**
   - Click the green **Code** button on GitHub
   - Select **Download ZIP**
   - Extract the ZIP file to a location you'll remember (like your Desktop or Documents)
   
   **Option B: Clone with Git** (if you have Git installed)
   ```bash
   git clone https://github.com/jason1105/my-ios-utility-app.git
   cd my-ios-utility-app
   ```

3. **Open the Project in Xcode**
   - Navigate to the project folder
   - Double-click on `RunnerUtility.xcodeproj`
   - Xcode will open automatically

4. **Run the App**
   - At the top of Xcode, you'll see a device selector (usually says "iPhone 15 Pro" or similar)
   - Click it to choose your preferred iPhone simulator
   - Click the **Play** button (▶️) or press `Cmd + R`
   - Wait for the simulator to launch and the app to build
   - The app will automatically open in the simulator!

### First Time Using Xcode?

Don't worry! Here's what you need to know:

- **The simulator** is a virtual iPhone that runs on your Mac - no physical device needed
- **Building** means Xcode is converting your code into a running app (takes 10-30 seconds)
- **If you see errors**, try going to Product → Clean Build Folder, then try running again
- The simulator can be controlled like a real iPhone (click to tap, drag to scroll)

## 📖 What is SwiftUI?

**SwiftUI** is Apple's modern framework for building user interfaces across all Apple platforms. Here's why we're using it:

### Benefits for Beginners
- **Declarative syntax**: You describe *what* you want, not *how* to create it
- **Live previews**: See your changes in real-time without running the app
- **Less code**: Accomplish more with fewer lines compared to UIKit
- **Modern**: Released in 2019, it's the future of iOS development
- **Cross-platform**: Same code works on iOS, iPadOS, macOS, watchOS, and tvOS

### Example
```swift
// SwiftUI - Simple and clear
Text("Hello, Runner!")
    .font(.title)
    .foregroundColor(.blue)
```

Compare this to older UIKit code which requires 5-10 lines for the same result!

## 📁 Project Structure

```
RunnerUtility/
├── RunnerUtility.xcodeproj/          # Xcode project file
│   └── project.pbxproj                # Project configuration
├── RunnerUtility/                     # Main app folder
│   ├── RunnerUtilityApp.swift         # App entry point (@main)
│   ├── ContentView.swift              # Main screen with tabs
│   ├── Models/                        # Data models and logic
│   │   └── ConversionModels.swift     # All conversion calculations
│   ├── Views/                         # UI screens
│   │   ├── DistanceConversionView.swift
│   │   └── UnifiedSpeedPaceConversionView.swift
│   ├── Assets.xcassets/               # Images, colors, icons
│   │   └── AppIcon.appiconset/        # App icon placeholder
│   └── Preview Content/               # Assets for Xcode previews
└── README.md                          # This file!
```

### Key Files Explained

**RunnerUtilityApp.swift**
- The starting point of your app
- Contains the `@main` attribute marking the entry point
- Sets up the initial view (ContentView)

**ContentView.swift**
- Main screen with two tabs
- Uses `TabView` to organize different conversion tools
- Simple and easy to modify

**ConversionModels.swift**
- Contains all the math for conversions
- Organized into three structs: `DistanceConverter`, `SpeedConverter`, `PaceConverter`
- Static functions mean you can call them without creating an instance
- Includes MM:SS pace formatting and parsing functions
- Handles conversions between all speed and pace units

**View Files** (in Views folder)
- **DistanceConversionView.swift**: Handles distance conversions (miles, kilometers, meters, feet)
- **UnifiedSpeedPaceConversionView.swift**: NEW! Unified view showing all speed and pace units together
  - Real-time bidirectional conversion between mph, km/h, min/mile, and min/km
  - Edit any field and all others update automatically
  - Uses MM:SS format for pace fields
  - Includes helpful reference tables and educational content

## 🏃‍♂️ Understanding Speed and Pace

One of the key features of this app is helping runners understand the relationship between **speed** and **pace**.

### What's the Difference?

**Speed (🚀)** measures how fast you're moving:
- Expressed as **mph** (miles per hour) or **km/h** (kilometers per hour)
- Example: "I'm running at 6 mph"
- Common in the USA for treadmill displays

**Pace (🏃‍♂️)** measures how long it takes to cover a distance:
- Expressed as **min/mile** (minutes per mile) or **min/km** (minutes per kilometer)
- Example: "I'm running at an 8:30 min/mile pace" (8 minutes 30 seconds per mile)
- Common in running communities worldwide

### The Mathematical Relationship

Speed and pace are **inversely related**. The formula is:
```
Speed (mph) = 60 ÷ Pace (min/mile)
Pace (min/mile) = 60 ÷ Speed (mph)
```

### Real-World Examples

Here are some common running speeds and their equivalent paces:

| Speed (mph) | Speed (km/h) | Pace (min/mile) | Pace (min/km) | Description |
|------------|-------------|----------------|--------------|-------------|
| 5.0 mph | 8.0 km/h | 12:00 | 7:27 | Easy jog, comfortable conversation |
| 6.0 mph | 9.7 km/h | 10:00 | 6:13 | Comfortable pace, can still talk |
| 6.7 mph | 10.7 km/h | 9:00 | 5:35 | Moderate pace, working but sustainable |
| 7.5 mph | 12.1 km/h | 8:00 | 4:58 | Good pace, aerobic workout |
| 8.6 mph | 13.8 km/h | 7:00 | 4:21 | Fast pace, challenging |
| 10.0 mph | 16.1 km/h | 6:00 | 3:44 | Race pace for many runners |

### Why This Matters

Understanding both speed and pace helps you:
- **Set treadmill speed** based on your outdoor pace
- **Compare performances** across different measurement systems
- **Plan training runs** using either format
- **Track improvements** in a way that makes sense to you
- **Communicate with other runners** regardless of their preferred units

### Using the Unified Converter

The new unified Speed & Pace converter makes this relationship crystal clear:
1. Enter your speed or pace in **any** of the four units
2. Watch as all other units update automatically in real-time
3. See the relationship between speed and pace instantly
4. Use the MM:SS format for pace (more intuitive than decimal)
5. Reference common values in the quick reference table

## 🎨 How to Modify the App

### Change Colors

Find any line with `.foregroundColor(.blue)` and change `.blue` to:
- `.red`, `.green`, `.orange`, `.purple`, `.pink`, `.yellow`
- Or create custom: `Color(red: 0.5, green: 0.2, blue: 0.8)`

```swift
// Before
.foregroundColor(.blue)

// After
.foregroundColor(.purple)
```

### Add a New Tab

In `ContentView.swift`, add before the closing `}` of `TabView`:

```swift
MyNewView()
    .tabItem {
        Label("My Tab", systemImage: "star")
    }
```

### Change Decimal Places

Find lines like `String(format: "%.2f", value)` and change the `2`:

```swift
// 2 decimal places: 3.14
String(format: "%.2f", value)

// 4 decimal places: 3.1416
String(format: "%.4f", value)
```

### Add a New Conversion

1. Add the conversion function in `ConversionModels.swift`:
```swift
static func myNewConversion(_ input: Double) -> Double {
    return input * 2.5  // Your calculation here
}
```

2. Add UI in the appropriate View file (copy an existing section)

### Modify the Quick Reference Tables

Find the "Quick Reference" sections in the View files and modify the values:

```swift
HStack {
    Text("My Distance:")
    Spacer()
    Text("My Value")
        .foregroundColor(.secondary)
}
```

## 🎓 Learning Resources

### Official Apple Resources
- [SwiftUI Tutorials](https://developer.apple.com/tutorials/swiftui) - Apple's official tutorials
- [Swift Documentation](https://swift.org/documentation/) - Learn Swift language
- [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/) - Design best practices

### Free Online Courses
- [100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui) - Comprehensive free course
- [Swift Playgrounds](https://www.apple.com/swift/playgrounds/) - Learn Swift on iPad or Mac
- [CS193p Stanford](https://cs193p.sites.stanford.edu/) - University course on iOS development

### YouTube Channels
- **Sean Allen** - Clear iOS tutorials for beginners
- **Paul Hudson (Hacking with Swift)** - Comprehensive Swift/SwiftUI content
- **Code With Chris** - Beginner-friendly iOS tutorials
- **Stewart Lynch** - Practical SwiftUI examples

### Communities
- [Swift Forums](https://forums.swift.org/) - Official Swift discussion
- [r/swift](https://www.reddit.com/r/swift/) - Reddit community
- [r/iOSProgramming](https://www.reddit.com/r/iOSProgramming/) - iOS development subreddit
- [Stack Overflow](https://stackoverflow.com/questions/tagged/swiftui) - Q&A for specific problems

## 🐛 Common Issues and Solutions

### Issue: "Cannot find 'RunnerUtility' in scope"
**Solution**: Clean the build folder (Product → Clean Build Folder) and rebuild

### Issue: Simulator is very slow
**Solution**: 
- Close other apps to free up memory
- Use a simpler simulator (iPhone SE instead of iPhone 15 Pro Max)
- Restart your Mac

### Issue: App crashes immediately
**Solution**: 
- Check the console for error messages (bottom pane in Xcode)
- Make sure you haven't removed any required files
- Try resetting the simulator (Device → Erase All Content and Settings)

### Issue: Changes don't appear
**Solution**:
- Save all files (File → Save or Cmd+S)
- Clean build folder and rebuild
- Make sure you're editing the right file

### Issue: "No such module 'SwiftUI'"
**Solution**: Make sure your Deployment Target is set to iOS 15.0 or later
- Select the project in the left sidebar
- Select the RunnerUtility target
- Check the "Deployment Info" section

### Issue: Keyboard won't appear in simulator
**Solution**: 
- Toggle hardware keyboard: I/O → Keyboard → Connect Hardware Keyboard
- Or press Cmd+K to toggle keyboard

## 🔮 Future Enhancement Ideas

Here are ideas to extend this app (great learning projects!):

### Beginner Level
- [ ] Add haptic feedback when buttons are pressed
- [ ] Remember last used values when reopening the app
- [ ] Add a clear/reset button
- [ ] Support dark mode with custom colors
- [ ] Add more quick reference values

### Intermediate Level
- [ ] Race time calculator (distance + pace = finish time)
- [ ] Split calculator (calculate splits for a race distance)
- [ ] Training pace zones based on recent race times
- [ ] Save favorite conversions or calculations
- [ ] Add HealthKit integration to pull running data

### Advanced Level
- [ ] Elevation gain/loss converter
- [ ] Calorie calculator based on distance, pace, and weight
- [ ] Race predictor (predict race times based on training paces)
- [ ] Integration with Strava or other running apps
- [ ] Apple Watch companion app
- [ ] Widgets for Home Screen

## 🎨 Design Suggestions

### App Icon
Currently using a placeholder. To add a custom icon:
1. Create a 1024x1024 pixel image
2. Use a tool like [App Icon Generator](https://appicon.co/) to create all sizes
3. Drag the icon into `Assets.xcassets/AppIcon.appiconset` in Xcode

### Color Schemes
Consider these color combinations for your tabs:
- **Distance**: Blue (represents water/distance)
- **Speed**: Orange/Red (represents energy)
- **Pace**: Purple/Green (represents time/growth)

### Typography
The app uses system fonts. To customize:
```swift
.font(.custom("YourFontName", size: 18))
```

### Animations
Add simple animations to make the app feel more alive:
```swift
.animation(.easeInOut, value: someValue)
```

## 🤝 Contributing

This is a learning project! Feel free to:
- Fork the repository
- Make improvements
- Add new features
- Share with other beginners
- Create issues for questions or bugs

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Built with ❤️ for beginner iOS developers
- Inspired by the running community
- Uses Apple's SF Symbols for icons
- SwiftUI for modern, declarative UI

## 📞 Need Help?

- **Found a bug?** Open an issue on GitHub
- **Have a question?** Check Stack Overflow or Swift Forums
- **Want to learn more?** Check the Learning Resources section above

---

## 🏃‍♂️ Happy Running and Happy Coding!

Remember: Every expert was once a beginner. Don't be afraid to experiment, break things, and learn. The best way to learn iOS development is by building things!

**Pro Tips for Learning:**
1. Start with small changes to see how things work
2. Read the comments in the code - they're there to help!
3. Use Xcode's autocomplete (start typing and press Enter)
4. Command+Click on any function or type to see its definition
5. Use print() statements to debug (see values in the console)
6. Don't worry about making mistakes - you can always undo (Cmd+Z)

**Next Steps:**
1. Get the app running in the simulator ✅
2. Make a small change (like a color) and see it update
3. Try adding a new quick reference value
4. Experiment with a new conversion
5. Share what you've built!

Good luck on your iOS development journey! 🚀
