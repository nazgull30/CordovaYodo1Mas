Cordova Yodo1 MAS plugin<br>
=====
This is Yodo1 MAS plugin for Cordova.

When you integrate the SDK, you import the SDK library file into your project so you can use that file’s functions. Integrating the MAS SDK into your mobile app project gives you access to MAS's fully managed monetization solution. This solution taps into multiple add mediation platforms, selecting the one best suited for your game and monetizing through high quality ad networks that serve in-app ads.

Before you can start monetizing your app, you’ll need to integrate the MAS SDK.

Integrating the SDK
----------
First of all, you need download this repository.



## Platform SDK supported ##

* latest iOS
* latest Android

## Quick start ##

To install this plugin, follow the [Command-line Interface Guide](http://cordova.apache.org/docs/en/edge/guide_cli_index.md.html#The%20Command-line%20Interface). You can use one of the following command lines:

* `cordova platform add ios
* `cordova platform add android`
* `cordova plugin add cordova-plugin-device`

Add this plugin to your cordova project.
* `cordova plugin add <Path to plugin folder>`

example: `cordova plugin add ../mas-cordova-plugin-release/`


In the plugin folder you need to put your admob id for both ios and android platforms.

Android:
```
    <config-file target="AndroidManifest.xml" parent="/manifest/application" >
      <meta-data
              android:name="com.google.android.gms.ads.APPLICATION_ID"
              android:value="PUT ADMOB ID HERE"/>
    </config-file>
```

iOs:
```
    <config-file target="*-Info.plist" parent="GADApplicationIdentifier">
      <string>PUT ADMOB ID HERE</string>
    </config-file>
```

## Code example ##

To start showing ads, place the following code in your `onDeviceReady` callback. Replace corresponding id's with yours.
!!!IMPORTANT!!! Do not forget to put your android and ios app ids!!

```javascript
// Wait for the deviceready event before using any of Cordova's device APIs.
// See https://cordova.apache.org/docs/en/latest/cordova/events/events.html#deviceready
// import {Yodo1Mas} from "../../plugins/mas-cordova/www/Yodo1Mas";

document.addEventListener('deviceready', onDeviceReady, false);

function onDeviceReady() {
    // Cordova is now initialized. Have fun!

    console.log('Running cordova-' + cordova.platformId + '@' + cordova.version);
    document.getElementById('deviceready').classList.add('ready');

    const rivendell = window.rivendell
    console.log('banner align: ' + rivendell.BANNER_ALIGN.BANNER_HORIZONTAL_CENTER)

    rivendell.setBannerCallback(callback => {
        console.log("setBannerCallback event: " + JSON.stringify(callback.event))
        console.log("setBannerCallback error: " + JSON.stringify(callback.error))
    })

    rivendell.setInterstitialAdCallback(callback => {
        console.log("setInterstitialAdCallback event: " + JSON.stringify(callback.event))
        console.log("setInterstitialAdCallback error: " + JSON.stringify(callback.error))
    })

    rivendell.setRewardedAdCallback(callback => {
        console.log("setRewardedAdCallback event: " + JSON.stringify(callback.event))
        console.log("setRewardedAdCallback error: " + JSON.stringify(callback.error))
    })

    let appKey;
    if(device.platform === "Android") {
        #appKey = "PUT ANDROID APP ID HERE";
    }

    if(device.platform === "iOS") {
        appKey = "PUT IOS APP ID HERE";
    }

    console.log("appKey: " + appKey)
    if(appKey == null)
        return

    rivendell.init(appKey, callback => {
        console.log("rivendell init: " + JSON.stringify(callback))
        switch (callback.event) {
            case rivendell.Event.ON_INIT_SUCCESS:
                console.log("init SUCCESS")
                break
            case rivendell.Event.ON_INIT_FAILED:
                console.log("init FAIL")
                break
        }
    })
}

function isBannerLoaded() {
    window.rivendell.isBannerAdLoaded(callback => {
        alert("Banner loaded: " + JSON.stringify(callback))
    })
}

function showBanner() {
    window.rivendell.showBannerAd()
}

function isInterstitialAdLoaded() {
    window.rivendell.isInterstitialAdLoaded(callback => {
        alert("Interstitial loaded: " + JSON.stringify(callback))
    })
}

function showInterstitialAd() {
    window.rivendell.showInterstitialAd()
}

function isRewardedAdLoaded() {
    window.rivendell.isRewardedAdLoaded(callback => {
        alert("RewardedAd loaded: " + JSON.stringify(callback))
    })
}

function showRewardedAd() {
    window.rivendell.showRewardedAd()
}

```
