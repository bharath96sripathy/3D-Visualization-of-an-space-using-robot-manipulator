Skip to content
 
Search or jump to…

Pull requests
Issues
Marketplace
Explore
 @oscarg933 Sign out
Your account has been flagged.
Because of that, your profile is hidden from the public. If you believe this is a mistake, contact support to have your account status reviewed.
Your repository details have been saved.
0
0 110 oscarg933/Pulsator
forked from shu223/Pulsator
 Code  Pull requests 0  Projects 0  Wiki  Insights  Settings
Pulse animation for iOS https://facebook.com/oscarforthewin
 64 commits
 2 branches
 11 releases
 8 contributors
 MIT
 Swift 89.6%	 Objective-C 6.9%	 Ruby 3.5%
 Pull request   Compare This branch is 1 commit ahead of shu223:master.
@oscarg933
oscarg933 Create verbose-octo-chainsaw
Latest commit 086febd  29 seconds ago
Type	Name	Latest commit message	Commit time
Example	Swift 4.2 migration and pod spec updates	5 months ago
Pulsator-macOS	Fixed a Carthage build error	10 months ago
Pulsator.playground	Fixed Playgrounds with Swift 3 / Xcode 8	3 years ago
Pulsator.xcodeproj	Cleaned development team for macOS target	9 days ago
Pulsator.xcworkspace/xcshareddata	add workspace	11 months ago
Pulsator	Swift 4.2 migration and pod spec updates	5 months ago
PulsatorMac	Fixed a Carthage build error	10 months ago
PulsatorTests	Support Swift 3 / Xcode 8	3 years ago
https:/github.com/oscarg933	Create verbose-octo-chainsaw	29 seconds ago
.gitignore	First commit	3 years ago
LICENSE	Initial commit	3 years ago
Pulsator.podspec	Swift 4.2 migration and pod spec updates	5 months ago
README.md	Update README	6 months ago
demo.gif	First commit	3 years ago
 README.md
Pulsator
Badge w/ Version Carthage compatible License Twitter

Pulse animation for iOS written with Swift.



Great For:

Pulses of Bluetooth, BTLE, beacons (iBeacon), etc.
Map Annotations
Installation
CocoaPods
Add into your Podfile.

pod "Pulsator"
Then $ pod install

Carthage
Add into your Cartfile.

github "shu223/Pulsator"
Then $ carthage update

How to use
Just 3 lines!

Initiate and add to your view's layer, then call start!

let pulsator = Pulsator()
view.layer.addSublayer(pulsator)
pulsator.start()
Customizations
Number of Pulses
Use numPulse property.

pulsator.numPulse = 3
Radius
Use radius property.

pulsator.radius = 240.0
Color
Just set the backgroundColor property.

pulsator.backgroundColor = UIColor(red: 1, green: 1, blue: 0, alpha: 1).cgColor
Animation Duration
Use following properties

animationDuration : duration for each pulse
pulseInterval : interval between pulses
Easing
You can set the timingFunction property.

Repeat
Use repeatCount property.

Demo
You can try to change the radius, backgroundColor or other properties with the demo app.

Example/PulsatorDemo.xcodeproj
<iframe src="https://appetize.io/embed/45kwjngp1xud45eeqhxqy8qqew?device=iphone6s&scale=75&autoplay=false&orientation=portrait&deviceColor=black" width="312px" height="653px" frameborder="0" scrolling="no"></iframe>
macOS support
Add into your Podfile, then run pod install.

platform :osx, '10.9'

target 'Pulsator' do
  use_frameworks!
  pod "Pulsator"
end
The usage is same as iOS.

let pulsator = Pulsator()
view.layer?.addSublayer(pulsator)
pulsator.start()
Objective-C version
There is an ObjC version, but it's not maintained now.

https://github.com/shu223/PulsingHalo
You can use Pulsator also with Objective-C.

#import "Pulsator-Swift.h"
Author
Shuichi Tsutsumi

iOS freelancer in Japan. Welcome works from abroad!

 Support via PayPal
PAST WORKS: My Profile Summary
PROFILES: LinkedIn
BLOG: English / Japanese
CONTACTS:
Twitter
Facebook
© 2019 GitHub, Inc.
Terms
Privacy
Security
Status
Help
Contact GitHub
Pricing
API
Training
Blog
About
