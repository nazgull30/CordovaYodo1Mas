package com.yodo1.cordova


enum class Event(val value: String) {
    ON_INIT_SUCCESS("on_init_success"),
    ON_INIT_FAILED("on_init_failed"),

    ON_BANNER_AD_NOT_LOADED ("on_banner_ad_not_loaded"),
    ON_BANNER_AD_OPENED ("on_banner_ad_opened"),
    ON_BANNER_AD_ERROR ("on_banner_ad_error"),
    ON_BANNER_AD_CLOSED ("on_banner_ad_closed"),

    ON_INTERSTITIAL_AD_NOT_LOADED ("on_interstitial_ad_not_loaded"),
    ON_INTERSTITIAL_AD_OPENED ("on_interstitial_ad_opened"),
    ON_INTERSTITIAL_AD_ERROR ("on_interstitial_ad_error"),
    ON_INTERSTITIAL_AD_CLOSED ("on_interstitial_ad_closed"),

    ON_REWARDED_AD_NOT_LOADED ("on_rewarded_ad_not_loaded"),
    ON_REWARDED_AD_OPENED ("on_rewarded_ad_opened"),
    ON_REWARDED_AD_EARNED ("on_rewarded_ad_earned"),
    ON_REWARDED_AD_ERROR ("on_rewarded_ad_error"),
    ON_REWARDED_AD_CLOSED ("on_rewarded_ad_closed"),
}