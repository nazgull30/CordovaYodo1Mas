package com.yodo1.cordova

enum class PluginMethod(val value: String) {
    INIT("init"),
    SET_GDPR("setGDPR"),
    SET_CCPA("setCCPA"),
    SET_COPPA("setCOPPA"),
    SET_BANNER_CALLBACK("setBannerCallback"),
    IS_BANNER_AD_LOADED( "isBannerAdLoaded"),
    SHOW_BANNER_AD("showBannerAd"),
    SHOW_BANNER_AD_WITH_ALIGN("showBannerAdWithAlign"),
    SHOW_BANNER_AD_WITH_ALIGN_AND_OFFSET("showBannerAdWithAlignAndOffset"),
    DISMISS_BANNER_AD("dismissBannerAd"),
    SET_INTERSTITIAL_CALLBACK("setInterstitialAdCallback"),
    IS_INTERSTITIAL_AD_LOADED("isInterstitialAdLoaded"),
    SHOW_INTERSTITIAL_AD("showInterstitialAd"),
    SET_REWARDED_AD_CALLBACK("setRewardedAdCallback"),
    IS_REWARDED_AD_LOADED("isRewardedAdLoaded"),
    SHOW_REWARDED_AD("showRewardedAd"),
}