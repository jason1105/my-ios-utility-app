# App Screenshots & Visual Guide

## Overview
This document describes the visual appearance and user interface of the Runner Utility app.

## Main Interface

### Tab Bar (Bottom Navigation)
The app uses a tab bar at the bottom of the screen with three tabs:

1. **Distance Tab** 📏
   - Icon: Ruler
   - Color: Blue accent

2. **Speed Tab** 📈
   - Icon: Speedometer
   - Color: Blue accent

3. **Pace Tab** ⏱️
   - Icon: Timer
   - Color: Blue accent

---

## Screen 1: Distance Conversions

### Layout Structure
```
┌─────────────────────────────────┐
│        Distance        🔙        │  ← Navigation bar
├─────────────────────────────────┤
│                                 │
│  ┌─────────────────────────┐   │
│  │ 🏃 Miles ↔ Kilometers   │   │  ← Section header (blue)
│  │                         │   │
│  │ Miles                   │   │
│  │ [Enter miles.........]  │   │  ← Input field
│  │                         │   │
│  │         🔄              │   │  ← Swap button (blue)
│  │                         │   │
│  │ Kilometers              │   │
│  │ [Enter kilometers...]   │   │  ← Input field
│  └─────────────────────────┘   │
│                                 │
│  ┌─────────────────────────┐   │
│  │ 🔼 Meters ↔ Feet        │   │  ← Section header (green)
│  │                         │   │
│  │ Meters                  │   │
│  │ [Enter meters.......]   │   │  ← Input field
│  │                         │   │
│  │         🔄              │   │  ← Swap button (green)
│  │                         │   │
│  │ Feet                    │   │
│  │ [Enter feet.........]   │   │  ← Input field
│  └─────────────────────────┘   │
│                                 │
│  ┌─────────────────────────┐   │
│  │ Quick Reference         │   │  ← Blue background
│  │ 5K:           3.11 miles│   │
│  │ 10K:          6.21 miles│   │
│  │ Half Marathon: 13.11 mi │   │
│  │ Marathon:     26.22 mi  │   │
│  └─────────────────────────┘   │
│                                 │
└─────────────────────────────────┘
    📏      📈      ⏱️              ← Tab bar
  Distance Speed  Pace
```

### Features
- Two conversion sections in rounded, light gray cards
- Swap buttons for quick value reversal
- Quick reference table with common race distances
- Real-time conversion as you type

---

## Screen 2: Speed Conversions

### Layout Structure
```
┌─────────────────────────────────┐
│         Speed         🔙         │
├─────────────────────────────────┤
│                                 │
│  ┌─────────────────────────┐   │
│  │ 🔵 Speed Conversion     │   │  ← Orange icon
│  │                         │   │
│  │ Miles per hour (mph)    │   │
│  │ [Enter mph..........]   │   │
│  │                         │   │
│  │         🔄              │   │  ← Swap button (orange)
│  │                         │   │
│  │ Kilometers/hour (km/h)  │   │
│  │ [Enter km/h.........]   │   │
│  └─────────────────────────┘   │
│                                 │
│  ┌─────────────────────────┐   │
│  │ 🔀 Pace ↔ Speed        │   │  ← Purple icon
│  │ Convert between running │   │
│  │ pace and speed          │   │
│  │                         │   │
│  │ Pace (minutes per mile) │   │
│  │ [e.g., 8.5 for 8:30...] │   │
│  │ Tip: Enter 8.5 for 8:30 │   │
│  │                         │   │
│  │         🔄              │   │  ← Swap button (purple)
│  │                         │   │
│  │ Speed (mph)             │   │
│  │ [Speed in mph.......]   │   │
│  └─────────────────────────┘   │
│                                 │
│  ┌─────────────────────────┐   │
│  │ Quick Reference         │   │  ← Orange background
│  │ Common Running Speeds   │   │
│  │                         │   │
│  │ 12:00 min/mile  5.0 mph │   │
│  │   Easy jog              │   │
│  │                         │   │
│  │ 10:00 min/mile  6.0 mph │   │
│  │   Comfortable pace      │   │
│  │                         │   │
│  │ 9:00 min/mile   6.7 mph │   │
│  │   Moderate pace         │   │
│  │ ... (more entries)      │   │
│  └─────────────────────────┘   │
│                                 │
└─────────────────────────────────┘
    📏      📈      ⏱️
  Distance Speed  Pace
```

### Features
- Speed conversion (mph ↔ km/h)
- Pace to speed conversion with helpful hints
- Reference table showing common running paces with descriptions

---

## Screen 3: Pace Conversions

### Layout Structure
```
┌─────────────────────────────────┐
│          Pace         🔙         │
├─────────────────────────────────┤
│                                 │
│  ┌─────────────────────────┐   │
│  │ ⏱️ Pace Conversion      │   │  ← Red icon
│  │ Convert your running    │   │
│  │ pace between miles/km   │   │
│  │                         │   │
│  │ Minutes/mile (min/mile) │   │
│  │ [e.g., 8.5 for 8:30...] │   │
│  │ = 8:30 min/mile         │   │  ← Formatted display
│  │                         │   │
│  │         🔄              │   │  ← Swap button (red)
│  │                         │   │
│  │ Minutes/km (min/km)     │   │
│  │ [e.g., 5.3 for 5:18...] │   │
│  │ = 5:18 min/km           │   │  ← Formatted display
│  │                         │   │
│  │ 💡 Tip: Enter pace as   │   │
│  │    decimal (8.5 = 8:30) │   │
│  └─────────────────────────┘   │
│                                 │
│  ┌─────────────────────────┐   │
│  │ Marathon Pace Chart     │   │  ← Red background
│  │ Finish times based on   │   │
│  │ pace (standard distances)│   │
│  │                         │   │
│  │ Pace   5K    10K   Half │   │  ← Header
│  │ ────────────────────────│   │
│  │ 7:00  21:44  43:28 1:31 │   │
│  │ 8:00  24:50  49:41 1:44 │   │
│  │ 9:00  27:57  55:53 1:57 │   │
│  │ ... (more paces)        │   │
│  └─────────────────────────┘   │
│                                 │
│  ┌─────────────────────────┐   │
│  │ Training Pace Zones     │   │  ← Purple background
│  │ Based on 9:00 easy pace │   │
│  │                         │   │
│  │ 🟢 Easy Run             │   │
│  │    9:00-10:00 min/mile  │   │
│  │    Base building        │   │
│  │                         │   │
│  │ 🟠 Tempo                │   │
│  │    7:45-8:15 min/mile   │   │
│  │    Comfortably hard     │   │
│  │                         │   │
│  │ 🔴 Interval             │   │
│  │    6:30-7:30 min/mile   │   │
│  │    Hard, short bursts   │   │
│  │                         │   │
│  │ 🔵 Long Run             │   │
│  │    9:30-10:30 min/mile  │   │
│  │    Slower than easy     │   │
│  └─────────────────────────┘   │
│                                 │
└─────────────────────────────────┘
    📏      📈      ⏱️
  Distance Speed  Pace
```

### Features
- Pace conversion with formatted time display (MM:SS)
- Marathon pace chart showing predicted finish times
- Training pace zones with color indicators
- Most comprehensive reference information

---

## Design Details

### Color Scheme
- **Primary Accent**: Blue (iOS default)
- **Distance Section**: Blue icons
- **Speed Section**: Orange icons
- **Pace Section**: Red/Purple icons
- **Background Cards**: Light gray (system gray 6)
- **Quick Reference Cards**: Colored with 10% opacity

### Typography
- **Navigation Titles**: Large, bold system font
- **Section Headers**: Headline weight
- **Input Labels**: Subheadline, secondary color
- **Help Text**: Caption/Caption2, secondary color
- **Input Fields**: System font with rounded border

### Spacing & Layout
- **Section Spacing**: 30pt between major sections
- **Internal Padding**: 15pt within sections
- **Card Padding**: 12pt internal padding
- **Corner Radius**: 12pt for all cards

### Interactive Elements
- **Text Fields**: Rounded border style, decimal keyboard
- **Swap Buttons**: Circle with arrow icon, colored to match section
- **Real-time Updates**: Conversions happen as you type

### Accessibility
- Uses system fonts (supports Dynamic Type)
- High contrast between text and backgrounds
- Clear labels for all inputs
- SF Symbols for consistent iconography

---

## User Experience Flow

1. **Launch**: App opens to Distance tab
2. **Input**: Tap any field, decimal keyboard appears
3. **Convert**: Result updates in real-time
4. **Swap**: Tap swap button to reverse values
5. **Switch**: Tap tab bar to access other conversions
6. **Reference**: Scroll down to see quick reference tables

---

## Screenshots Instructions

**To take screenshots in Xcode simulator:**
1. Run the app in simulator
2. Navigate to the desired screen
3. Press `Cmd + S` to save screenshot to Desktop
4. Screenshots are saved as PNG files

**Best screenshot opportunities:**
- Each tab with sample conversions
- Quick reference tables
- Swap button interaction
- Different iPhone sizes (SE, 15 Pro, 15 Pro Max)

---

## Notes for Developers

This app uses:
- Native iOS UI elements
- System colors for consistency
- SF Symbols for icons
- SwiftUI for all views
- No external dependencies
- Supports iOS 15.0+
- Responsive layout for all iPhone sizes
