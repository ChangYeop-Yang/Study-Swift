
## ★ iOS Application Life Cycle

<p align="center">
  <img src="https://docs-assets.developer.apple.com/published/f5ae1a0785/00b28327-17dc-4f0c-866f-29f854edfce3.png" width="350" height="350" />
</p>

* UIKit apps are always in one of five states, which are shown in Figure 1. Apps start off not running. When the user explicitly launches the app, the app moves briefly to the inactive state before entering the active state. (An active app appears onscreen and is known as a foreground app.) Quitting an active app moves it offscreen and into the background state, where it stays until the system suspends it a short time later. At its discretion, the system may quietly terminate a suspended app, returning it to the not running state.

* Your app’s current state defines what system resources are available to it. Because active apps are visible onscreen and must respond to user interactions, they have priority when it comes to using system resources. Background apps are not visible onscreen, and therefore have more limited access to system resources and receive limited execution time.

<p align="center">
  <img src="https://cdn-images-1.medium.com/max/1600/1*Iwe53lfhwwPO3_K1K1Glig.gif" width="350" height="350" />
</p>

* Not Running - Either the application has not started yet or was running and has been terminated by the system.

* Inactive - An application is running in the Foreground but is not receiving any events. This could happen in case a Call or Message is received. An application could also stay in this state while in transition to a different state. In this State, we can not interact with app’s UI.

* Active - An application is running in the Foreground and receiving the events. This is the normal mode for the Foreground apps. The only way to go to or from the Active state is through the Inactive state. User normally interacts with UI, and can see the response/result for user actions.

* Background - An application is running in the background and executing the code. Freshly launching apps directly enter into In-Active state and then to Active state. Apps that are suspended, will come back to this background state, and then transition to In-Active → Active states. In addition, an application being launched directly into the background enters this state instead of the inactive state.

* Suspended - An application is in the background but is not executing the code. The system moves the application to this state automatically and does not notify. In case of low memory, the system may purge suspended application without notice to make free space for the foreground application. Usually after 5 secs spent in the background, apps will transition to Suspend state, but we can extend the time if app needs.

## ★ ViewController Life Cycle

## ★ REFERENCE
* [The iOS Application Lifecycle](https://developer.apple.com/documentation/uikit/core_app/managing_your_app_s_life_cycle)
* [Managing Your App's Life Cycle - Apple](https://developer.apple.com/documentation/uikit/core_app/managing_your_app_s_life_cycle)
