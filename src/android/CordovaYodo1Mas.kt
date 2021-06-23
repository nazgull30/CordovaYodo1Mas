package com.yodo1.cordova

import android.util.Log
import com.yodo1.mas.Yodo1Mas
import com.yodo1.mas.Yodo1Mas.RewardListener
import com.yodo1.mas.error.Yodo1MasError
import com.yodo1.mas.event.Yodo1MasAdEvent
import org.apache.cordova.CallbackContext
import org.apache.cordova.CordovaPlugin
import org.apache.cordova.PluginResult
import org.json.JSONArray
import org.json.JSONException


class CordovaYodo1Mas : CordovaPlugin() {

    private var interstitialCallback: CallbackContext? = null
    private var bannerCallback: CallbackContext? = null
    private var rewardedCallback: CallbackContext? = null

    @Throws(JSONException::class)
    override fun execute(action: String, args: JSONArray, callback: CallbackContext): Boolean {
        Log.w("cordova", "CordovaYodo1Mas -> execute $action")

        when(action) {
            PluginMethod.INIT.value ->  init(args.optString(0), callback)
            PluginMethod.SET_GDPR.value -> setGDPR(args.optBoolean(0))
            PluginMethod.SET_CCPA.value ->  setCCPA(args.optBoolean(0))
            PluginMethod.SET_COPPA.value -> setCOPPA(args.optBoolean(0))
            PluginMethod.SET_BANNER_CALLBACK.value -> bannerCallback = callback
            PluginMethod.IS_BANNER_AD_LOADED.value -> isBannerAdLoaded(callback)
            PluginMethod.SHOW_BANNER_AD.value -> showBannerAd()
            PluginMethod.SHOW_BANNER_AD_WITH_ALIGN.value -> showBannerAdWithAlign(args.optInt(0))
            PluginMethod.SHOW_BANNER_AD_WITH_ALIGN_AND_OFFSET.value -> showBannerAdWithAlignAndOffset(args.optInt(0), args.optInt(1), args.optInt(2))
            PluginMethod.DISMISS_BANNER_AD.value -> dismissBannerAd()
            PluginMethod.SET_INTERSTITIAL_CALLBACK.value -> interstitialCallback = callback
            PluginMethod.IS_INTERSTITIAL_AD_LOADED.value -> isInterstitialAdLoaded(callback)
            PluginMethod.SHOW_INTERSTITIAL_AD.value -> showInterstitialAd()
            PluginMethod.SET_REWARDED_AD_CALLBACK.value -> rewardedCallback = callback
            PluginMethod.IS_REWARDED_AD_LOADED.value -> isRewardedAdLoaded(callback)
            PluginMethod.SHOW_REWARDED_AD.value -> showRewardedAd()
        }
        return true
    }

    /* Init
     * ********************************************************************** */
    private fun setGDPR(gdpr: Boolean) =  Yodo1Mas.getInstance().setGDPR(gdpr)

    private fun setCCPA(ccpa: Boolean) = Yodo1Mas.getInstance().setCCPA(ccpa)

    private fun setCOPPA(coppa: Boolean) = Yodo1Mas.getInstance().setCOPPA(coppa)

    private fun init(appId: String, callback: CallbackContext) {
        Log.w("cordova", "CordovaYodo1Mas -> initialize started")

        initBannerAd()
        initInterstitialAd()
        initRewardedAd()

        Yodo1Mas.getInstance().init(cordova.activity, appId, object : Yodo1Mas.InitListener {
            override fun onMasInitSuccessful() {
                Log.w("cordova", "CordovaYodo1Mas -> initialize successful")
                callback.fireEvent(Event.ON_INIT_SUCCESS)
            }

            override fun onMasInitFailed(error: Yodo1MasError) {
                Log.w("cordova", "CordovaYodo1Mas -> initialize error: $error")
                callback.fireEvent(Event.ON_INIT_FAILED, error)
            }
        })
    }

    private fun initBannerAd() {
        Yodo1Mas.getInstance().setBannerListener(object : Yodo1Mas.BannerListener() {
            override fun onAdOpened(event: Yodo1MasAdEvent) {
                Log.w("cordova", "CordovaYodo1Mas -> CordovaYodo1MasBannerAd onAdOpened")
                bannerCallback?.fireEvent(Event.ON_BANNER_AD_OPENED)
            }

            override fun onAdError(event: Yodo1MasAdEvent, error: Yodo1MasError) {
                Log.w("cordova", "CordovaYodo1Mas -> CordovaYodo1MasBannerAd onAdError: ${error.code}")
                bannerCallback?.fireEvent(Event.ON_BANNER_AD_ERROR, error)
            }

            override fun onAdClosed(event: Yodo1MasAdEvent) {
                Log.w("cordova", "CordovaYodo1Mas -> CordovaYodo1MasBannerAd onAdClosed")
                bannerCallback?.fireEvent(Event.ON_BANNER_AD_CLOSED)
            }
        })
    }

    private fun initInterstitialAd() {
        Yodo1Mas.getInstance().setInterstitialListener(object : Yodo1Mas.InterstitialListener() {
            override fun onAdOpened(event: Yodo1MasAdEvent) {
                Log.w("cordova", "CordovaYodo1Mas -> CordovaYodo1MasInterstitialAd onAdOpened")
                interstitialCallback?.fireEvent(Event.ON_INTERSTITIAL_AD_OPENED)
            }

            override fun onAdError(event: Yodo1MasAdEvent, error: Yodo1MasError) {
                Log.w("cordova", "CordovaYodo1Mas -> CordovaYodo1MasInterstitialAd onAdError: $error")
                interstitialCallback?.fireEvent(Event.ON_INTERSTITIAL_AD_ERROR, error)
            }

            override fun onAdClosed(event: Yodo1MasAdEvent) {
                Log.w("cordova", "CordovaYodo1Mas -> CordovaYodo1MasInterstitialAd onAdClosed")
                interstitialCallback?.fireEvent(Event.ON_INTERSTITIAL_AD_CLOSED)
            }
        })
    }

    private fun initRewardedAd() {
        Yodo1Mas.getInstance().setRewardListener(object : RewardListener() {
            override fun onAdOpened(event: Yodo1MasAdEvent) {
                Log.w("cordova", "CordovaYodo1Mas -> CordovaYodo1MasRewardedAd onAdOpened")
                rewardedCallback?.fireEvent(Event.ON_REWARDED_AD_OPENED)
            }

            override fun onAdvertRewardEarned(event: Yodo1MasAdEvent) {
                Log.w("cordova", "CordovaYodo1Mas -> CordovaYodo1MasRewardedAd onAdRewardEarned")
                rewardedCallback?.fireEvent(Event.ON_REWARDED_AD_EARNED)
            }

            override fun onAdError(event: Yodo1MasAdEvent, error: Yodo1MasError) {
                Log.w("cordova", "CordovaYodo1Mas -> CordovaYodo1MasRewardedAd onAdError: $error")
                rewardedCallback?.fireEvent(Event.ON_REWARDED_AD_ERROR, error)
            }

            override fun onAdClosed(event: Yodo1MasAdEvent) {
                Log.w("cordova", "CordovaYodo1Mas -> CordovaYodo1MasRewardedAd onAdClosed")
                rewardedCallback?.fireEvent(Event.ON_REWARDED_AD_CLOSED)
            }
        })
    }

    /* Banner
     * ********************************************************************** */

    private fun isBannerAdLoaded(callback: CallbackContext) {
        val isBannerAdLoaded = isBannerAdLoaded;
        Log.w("cordova", "CordovaYodo1Mas -> isBannerAdLoaded: $isBannerAdLoaded")
        callback.sendPluginResult(PluginResult(PluginResult.Status.OK, isBannerAdLoaded))
    }

    private val isBannerAdLoaded = Yodo1Mas.getInstance().isBannerAdLoaded

    private fun showBannerAd() {
        val isBannerAdLoaded = isBannerAdLoaded
        Log.w("cordova", "CordovaYodo1Mas -> showBannerAd, isBannerAdLoaded: $isBannerAdLoaded")
        if (!isBannerAdLoaded) {
            bannerCallback?.fireEvent(Event.ON_BANNER_AD_NOT_LOADED)
            return
        }
        Yodo1Mas.getInstance().showBannerAd(cordova.activity)
    }

    private fun showBannerAdWithAlign(align: Int) {
            val isBannerAdLoaded = isBannerAdLoaded
            Log.w("cordova", "CordovaYodo1Mas -> showBannerAdWithAlign, isBannerAdLoaded: $isBannerAdLoaded")
            if (!isBannerAdLoaded) {
                bannerCallback?.fireEvent(Event.ON_BANNER_AD_NOT_LOADED)
                return
            }
            Yodo1Mas.getInstance().showBannerAd(cordova.activity, align)
    }

    private fun showBannerAdWithAlignAndOffset(align: Int, offsetX: Int, offsetY: Int) {
            val isBannerAdLoaded = isBannerAdLoaded
            Log.w("cordova", "CordovaYodo1Mas -> showBannerAdWithAlignAndOffset, isBannerAdLoaded: $isBannerAdLoaded")
            if (!isBannerAdLoaded) {
                bannerCallback?.fireEvent(Event.ON_BANNER_AD_NOT_LOADED)
                return
            }
            Yodo1Mas.getInstance().showBannerAd(cordova.activity, align, offsetX, offsetY)
    }

    private fun dismissBannerAd() {
        Log.w("cordova", "CordovaYodo1Mas -> dismissBannerAd")
        Yodo1Mas.getInstance().dismissBannerAd()
    }

    /* Interstitial
     * ********************************************************************** */

    private fun isInterstitialAdLoaded(callback: CallbackContext) {
        val isInterstitialAdLoaded = isInterstitialAdLoaded;
        Log.w("cordova", "CordovaYodo1Mas -> isInterstitialAdLoaded: $isInterstitialAdLoaded")
        callback.sendPluginResult(PluginResult(PluginResult.Status.OK, isInterstitialAdLoaded))
    }

    private val isInterstitialAdLoaded: Boolean
        get() = Yodo1Mas.getInstance().isInterstitialAdLoaded

    private fun showInterstitialAd() {
            val isInterstitialAdLoaded = isInterstitialAdLoaded
            Log.w("cordova", "CordovaYodo1Mas isInterstitialAdLoaded: $isInterstitialAdLoaded")
            if (!isInterstitialAdLoaded) {
                interstitialCallback?.fireEvent(Event.ON_INTERSTITIAL_AD_NOT_LOADED)
                return
            }
            Yodo1Mas.getInstance().showInterstitialAd(cordova.activity)
    }

    /* Rewarded Video
     * ********************************************************************** */

    private fun isRewardedAdLoaded(callback: CallbackContext) {
        val isRewardedAdLoaded = isRewardedAdLoaded;
        Log.w("cordova", "CordovaYodo1Mas -> isRewardedAdLoaded: $isRewardedAdLoaded")
        callback.sendPluginResult(PluginResult(PluginResult.Status.OK, isRewardedAdLoaded))
    }

    private val isRewardedAdLoaded: Boolean
        get() = Yodo1Mas.getInstance().isRewardedAdLoaded

    private fun showRewardedAd() {
            val isRewardedAdLoaded = isRewardedAdLoaded
            Log.w("cordova", "CordovaYodo1Mas isRewardedAdLoaded: $isRewardedAdLoaded")
            if (!isRewardedAdLoaded) {
                rewardedCallback?.fireEvent(Event.ON_REWARDED_AD_NOT_LOADED)
                return
            }
            Yodo1Mas.getInstance().showRewardedAd(cordova.activity)
    }
}