const rivendell = window.rivendell || {};

rivendell.BANNER_ALIGN = {
    BANNER_LEFT: 1,
    BANNER_HORIZONTAL_CENTER: 2,
    BANNER_RIGHT:  4,
    BANNER_TOP: 8,
    BANNER_VERTICAL_CENTER: 16,
    BANNER_BOTTOM: 32
};

rivendell.Event = {
    ON_INIT_SUCCESS: 'on_init_success',
    ON_INIT_FAILED: 'on_init_failed',

    ON_BANNER_AD_NOT_LOADED: 'on_banner_ad_not_loaded',
    ON_BANNER_AD_OPENED: 'on_banner_ad_opened',
    ON_BANNER_AD_ERROR: 'on_banner_ad_error',
    ON_BANNER_AD_CLOSED: 'on_banner_ad_closed',

    ON_INTERSTITIAL_AD_NOT_LOADED: 'on_interstitial_ad_not_loaded',
    ON_INTERSTITIAL_AD_OPENED: 'on_interstitial_ad_opened',
    ON_INTERSTITIAL_AD_ERROR: 'on_interstitial_ad_error',
    ON_INTERSTITIAL_AD_CLOSED: 'on_interstitial_ad_closed',

    ON_REWARDED_AD_NOT_LOADED: 'on_rewarded_ad_not_loaded',
    ON_REWARDED_AD_OPENED: 'on_rewarded_ad_opened',
    ON_REWARDED_AD_EARNED: 'on_rewarded_ad_earned',
    ON_REWARDED_AD_ERROR: 'on_rewarded_ad_error',
    ON_REWARDED_AD_CLOSED: 'on_rewarded_ad_closed'
}

rivendell.init = function (appKey, callback) {
    cordova.exec(callback, null, "CordovaYodo1Mas", "init", [appKey]);
};

rivendell.setGDPR = function(gdpr) {
    cordova.exec(null, null, "CordovaYodo1Mas", "setGDPR", [gdpr]);
}

rivendell.setCCPA = function(ccpa) {
    cordova.exec(null, null, "CordovaYodo1Mas", "setCCPA", [ccpa]);
}

rivendell.setCOPPA = function(coppa) {
    cordova.exec(null, null, "CordovaYodo1Mas", "setCOPPA", [coppa]);
}

rivendell.setBannerCallback = function(callbacks) {
    cordova.exec(callbacks, null, "CordovaYodo1Mas", "setBannerCallback", []);
};

rivendell.isBannerAdLoaded = function(callback) {
    cordova.exec(callback, null, "CordovaYodo1Mas", "isBannerAdLoaded");
}

rivendell.showBannerAd = function(){
    cordova.exec(null, null, "CordovaYodo1Mas", "showBannerAd");
}

rivendell.showBannerAdWithAlign = function(align) {
    cordova.exec(null, null, "CordovaYodo1Mas", "showBannerAdWithAlign", [align]);
}

rivendell.showBannerAdWithAlignAndOffset = function(align, offsetX, offsetY) {
    cordova.exec(null, null, "CordovaYodo1Mas", "showBannerAdWithAlignAndOffset", [align, offsetX, offsetY]);
}

rivendell.dismissBannerAd = function () {
    cordova.exec(null, null, "CordovaYodo1Mas", "dismissBannerAd");
}

rivendell.setInterstitialAdCallback = function(callbacks) {
    cordova.exec(callbacks, null, "CordovaYodo1Mas", "setInterstitialAdCallback", []);
};

rivendell.isInterstitialAdLoaded = function (callback) {
    cordova.exec(callback, null, "CordovaYodo1Mas", "isInterstitialAdLoaded");
}

rivendell.showInterstitialAd = function () {
    cordova.exec(null, null, "CordovaYodo1Mas", "showInterstitialAd");
}

rivendell.setRewardedAdCallback = function(callbacks) {
    cordova.exec(callbacks, null, "CordovaYodo1Mas", "setRewardedAdCallback", []);
}

rivendell.isRewardedAdLoaded = function (callback) {
    cordova.exec(callback, null, "CordovaYodo1Mas", "isRewardedAdLoaded");
}

rivendell.showRewardedAd = function () {
    cordova.exec(null, null, "CordovaYodo1Mas", "showRewardedAd");
}

if (typeof module !== 'undefined') {
    module.exports = rivendell;
}

window.rivendell = rivendell;
