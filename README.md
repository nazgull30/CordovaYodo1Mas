*<p style="font-size: small;" align="right"><a style="color:#232323" color="#232323" href="http://appfeel.com">Made in Barcelona with <span color="#FCB">Love</span> and <span color="#BBCCFF">Code</span></a></p>*

Cordova Yodo1 MAS plugin<br>
=====
This is an iOs Yodo1Mas plugin for Cordova.

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

To start showing ads, place the following code in your `onDeviceReady` callback. Replace corresponding id's with yours:

```javascript

document.addEventListener('deviceready', onDeviceReady, false);

function onDeviceReady() {
  // Cordova is now initialized. Have fun!

  console.log('Running cordova-' + cordova.platformId + '@' + cordova.version);
  document.getElementById('deviceready').classList.add('ready');

  const rivendell = window.rivendell
  console.log('banner align: ' + rivendell.BANNER_ALIGN.BANNER_HORIZONTAL_CENTER)

  rivendell.setBannerCallback(
          function(container) {
            console.log("setBannerCallback: container event: " + container.event)
          }
  )

  rivendell.setInterstitialAdCallback(
          function(container) {
            console.log("setInterstitialAdCallback: container event: " + container.event)
          }
  )

  rivendell.setRewardedAdCallback(
          function(container) {
            console.log("setRewardedAdCallback: container event: " + container.event)
          }
  )

  let appKey;
  if(device.platform === "Android") {
    #appKey = <Android App ID here>;
  }

  if(device.platform === "iOS") {
    #appKey = <iOs App id here>;
  }
      
  if(appKey == null)
    return

  rivendell.init(appKey, callback => {
    console.log("rivendell init: " + JSON.stringify(callback))
    switch (callback) {
      case rivendell.Event.ON_INIT_SUCCESS:

        // document.getElementById('showBannerBtn').removeAttribute("style")
        console.log("SUCCESS")
        break
      case rivendell.Event.ON_INIT_FAILED:
        console.log("FAIL")
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
  window.rivendell.showBannerAd(callback => {
    console.log("rivendell showBannerAd: " + JSON.stringify(callback))
  })
}

function isInterstitialAdLoaded() {
  window.rivendell.isInterstitialAdLoaded(callback => {
    alert("Interstitial loaded: " + JSON.stringify(callback))
  })
}

function showInterstitialAd() {
  window.rivendell.showInterstitialAd(callback => {
    console.log("rivendell showInterstitialAd: " + JSON.stringify(callback))
  })
}

function isRewardedAdLoaded() {
  window.rivendell.isRewardedAdLoaded(callback => {
    alert("RewardedAd loaded: " + JSON.stringify(callback))
  })
}

function showRewardedAd() {
  window.rivendell.showRewardedAd(callback => {
    console.log("rivendell showRewardedAd: " + JSON.stringify(callback))
  })
}
```
