# Facebook Marketplace Viewer iOS App

A dedicated iOS app for browsing Facebook Marketplace with a clean, minimal interface.

## Features

✅ WebView for Facebook Marketplace
✅ Custom toolbar with quick access
✅ Saved searches functionality
✅ Push notifications for new listings
✅ Quick category filters
✅ Dark mode support
✅ Minimal, clean UI

## Tools Required on Your MacBook Air

### 1. Xcode (Required)
- **Download**: Mac App Store (free)
- **Version**: Latest version (Xcode 15 or newer recommended)
- **Size**: ~15-20 GB
- **What it is**: Apple's official IDE for iOS development

### 2. Apple Developer Account
- **Free Account**: Allows testing on your own device for 7 days
- **Paid Account**: $99/year - Required for App Store distribution
- **Sign up**: https://developer.apple.com

### 3. macOS Requirements
- macOS Ventura (13.0) or later recommended
- At least 20 GB free storage for Xcode

---

## Setup Instructions

### Step 1: Install Xcode

1. Open the **Mac App Store**
2. Search for "Xcode"
3. Click "Get" or "Download"
4. Wait for installation (may take 30-60 minutes)
5. Open Xcode and accept the license agreement
6. Install additional components when prompted

### Step 2: Create New Xcode Project

1. Open Xcode
2. Select "Create a new Xcode project"
3. Choose "iOS" → "App" → Click "Next"
4. Fill in:
   - **Product Name**: MarketplaceViewer
   - **Team**: Select your Apple ID (sign in if needed)
   - **Organization Identifier**: com.yourname (use your name)
   - **Bundle Identifier**: Will auto-generate (e.g., com.yourname.MarketplaceViewer)
   - **Interface**: SwiftUI
   - **Language**: Swift
   - **Storage**: None
5. Click "Next" and choose where to save the project
6. Click "Create"

### Step 3: Add the Code Files

1. In Xcode's left sidebar (Navigator), you'll see your project files
2. Delete the default `ContentView.swift` and `MarketplaceViewerApp.swift` files
3. Right-click on the "MarketplaceViewer" folder → "Add Files to MarketplaceViewer"
4. Add all the .swift files I provided:
   - MarketplaceViewerApp.swift
   - ContentView.swift
   - MarketplaceWebView.swift
   - CustomToolbar.swift
   - QuickFiltersBar.swift
   - SavedSearchManager.swift
   - SavedSearchesView.swift
   - FiltersView.swift
   - NotificationManager.swift
   - SettingsView.swift

### Step 4: Configure Info.plist

1. In Xcode, find "Info.plist" in the project navigator
2. Replace its contents with the Info.plist file I provided
3. Or manually add these keys:
   - Privacy - User Notifications Usage Description
   - App Transport Security Settings (for Facebook domains)

### Step 5: Add Required Capabilities

1. Click on your project name at the top of the navigator
2. Select your app target
3. Click the "Signing & Capabilities" tab
4. Click "+ Capability"
5. Add "Push Notifications"
6. Add "Background Modes" and check "Remote notifications"

### Step 6: Test in Simulator

1. At the top of Xcode, select a simulator (e.g., "iPhone 15 Pro")
2. Click the "Play" button (▶️) or press Cmd + R
3. Wait for the simulator to launch
4. Your app should open in the simulator
5. Test all features:
   - Navigate to Facebook Marketplace (you'll need to log in)
   - Try the filters
   - Save a search
   - Test dark mode in Settings

### Step 7: Test on Your iPhone (Optional)

1. Connect your iPhone to your Mac with a USB cable
2. Unlock your iPhone and trust the computer
3. In Xcode, select your iPhone from the device menu at the top
4. Click Run (▶️)
5. On your iPhone: Go to Settings → General → VPN & Device Management
6. Trust your developer certificate
7. The app should now run on your iPhone

---

## Publishing to the App Store

### Step 1: Prepare Your App

1. **Create App Icons**:
   - You need icons in multiple sizes (20x20 to 1024x1024)
   - Use a tool like https://appicon.co to generate all sizes
   - In Xcode, click "Assets" → "AppIcon" → Drag icons into appropriate slots

2. **Create Screenshots**:
   - Take screenshots in the simulator for different iPhone sizes
   - Required sizes: 6.7", 6.5", 5.5" displays
   - You need at least 2 screenshots per size

3. **Prepare App Description**:
   - Write a compelling description (max 4000 characters)
   - List key features
   - Create promotional text

### Step 2: Enroll in Apple Developer Program

1. Go to https://developer.apple.com/programs/
2. Click "Enroll"
3. Pay $99/year fee
4. Wait for approval (usually 24-48 hours)

### Step 3: Create App Store Connect Record

1. Go to https://appstoreconnect.apple.com
2. Click "My Apps" → "+" → "New App"
3. Fill in:
   - **Platform**: iOS
   - **Name**: Facebook Marketplace Viewer
   - **Primary Language**: English
   - **Bundle ID**: Select your app's bundle ID
   - **SKU**: Unique identifier (e.g., marketplace-viewer-001)
4. Click "Create"

### Step 4: Fill in App Information

1. **App Information**:
   - Category: Shopping or Utilities
   - Privacy Policy URL (required - you'll need to create one)
   - Subtitle, Keywords

2. **Pricing and Availability**:
   - Free or Paid
   - Select countries

3. **App Privacy**:
   - Answer questions about data collection
   - This app likely collects: Usage Data, Identifiers

### Step 5: Archive and Upload Your App

1. In Xcode, select "Any iOS Device (arm64)" from the device menu
2. Go to Product → Archive
3. Wait for archiving to complete
4. In the Archives window that appears:
   - Select your archive
   - Click "Distribute App"
   - Choose "App Store Connect"
   - Select "Upload"
   - Follow prompts and click "Upload"

### Step 6: Submit for Review

1. Return to App Store Connect
2. Go to your app → "1.0 Prepare for Submission"
3. Upload screenshots for each required device size
4. Add app description, keywords, support URL
5. Set content rights
6. Add build (select the uploaded build)
7. Answer App Store Review questions
8. Click "Submit for Review"

### Step 7: Wait for Review

- Review typically takes 1-3 days
- You'll receive emails about status changes
- Common rejection reasons:
  - Metadata issues (screenshots, descriptions)
  - Missing privacy policy
  - Crashes or bugs
  - Trademark issues (using "Facebook" in name may be problematic)

---

## ⚠️ IMPORTANT LEGAL CONSIDERATIONS

### Facebook Trademark Issues

**WARNING**: Using "Facebook" in your app name, description, or branding may violate Facebook's trademark. Consider:

1. **Alternative Names**:
   - "Marketplace Browser"
   - "Local Deals Viewer"
   - "Classified Ads Browser"

2. **App Store Guidelines**:
   - Apple may reject apps that appear to be unofficial clients
   - You cannot claim affiliation with Facebook
   - Don't use Facebook's logo or branding

3. **Recommended Approach**:
   - Contact Facebook for permission
   - Or build this as a personal app (not for App Store distribution)
   - Or rebrand as a general web browser for classifieds

### Facebook Terms of Service

- Review Facebook's Platform Terms: https://developers.facebook.com/terms
- Facebook may block automated access or wrapper apps
- Consider this a learning project rather than a commercial venture

---

## Troubleshooting

### "Failed to install app"
- Clean build folder: Product → Clean Build Folder
- Restart Xcode
- Restart simulator

### "No provisioning profiles found"
- Make sure you're signed in with your Apple ID in Xcode
- Check Preferences → Accounts

### Facebook doesn't load
- Check Info.plist has App Transport Security settings
- Make sure you're logged into Facebook in Safari first
- Facebook may block WebView access

### Notifications don't work in simulator
- Notifications require a real device
- Test on your iPhone instead

---

## Next Steps for Enhancement

1. Add biometric authentication (Face ID/Touch ID)
2. Implement actual web scraping for notifications (requires backend)
3. Add favorites/wishlist feature
4. Implement share functionality
5. Add price tracking and alerts

---

## Cost Summary

| Item | Cost | Required For |
|------|------|--------------|
| MacBook Air | You have it | Development |
| Xcode | Free | Development |
| Apple Developer Account (Free) | Free | Testing on your device |
| Apple Developer Program | $99/year | App Store publishing |
| Domain for Privacy Policy | ~$12/year | App Store requirement |

**Minimum to publish**: $99/year + ~$12 for domain = ~$111/year

---

## File Structure

```
MarketplaceViewer/
├── MarketplaceViewerApp.swift          # Main app entry point
├── ContentView.swift                    # Main view with navigation
├── Views/
│   ├── MarketplaceWebView.swift        # WebKit integration
│   ├── CustomToolbar.swift             # Top navigation bar
│   ├── QuickFiltersBar.swift           # Bottom filter bar
│   ├── SavedSearchesView.swift         # Saved searches list
│   ├── FiltersView.swift               # Advanced filters
│   └── SettingsView.swift              # App settings
├── Managers/
│   ├── SavedSearchManager.swift        # Manages saved searches
│   └── NotificationManager.swift       # Handles push notifications
├── Info.plist                          # App configuration
└── Assets.xcassets/                    # Images and icons
    └── AppIcon.appiconset/             # App icons
```

---

## Support

If you encounter issues:
1. Check Apple Developer Documentation: https://developer.apple.com/documentation/
2. Visit Apple Developer Forums: https://developer.apple.com/forums/
3. Stack Overflow: Tag questions with [swift] and [swiftui]

Good luck with your app! 🚀
