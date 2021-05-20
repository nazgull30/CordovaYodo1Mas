#import <Cordova/CDV.h>


@interface CordovaYodo1Mas : CDVPlugin

- (void) init:(CDVInvokedUrlCommand*)command;
- (void) setGDPR:(CDVInvokedUrlCommand*)command;
- (void) setCCPA:(CDVInvokedUrlCommand*)command;
- (void) setCOPPA:(CDVInvokedUrlCommand*)command;

- (void) setBannerCallback:(CDVInvokedUrlCommand*)command;
- (void) isBannerAdLoaded:(CDVInvokedUrlCommand*)command;
- (void) showBannerAd:(CDVInvokedUrlCommand*)command;
- (void) showBannerAdWithAlign:(CDVInvokedUrlCommand*)command;
- (void) showBannerAdWithAlignAndOffset:(CDVInvokedUrlCommand*)command;
- (void) dismissBannerAd:(CDVInvokedUrlCommand*)command;

- (void) setInterstitialAdCallback:(CDVInvokedUrlCommand*)command;
- (void) isInterstitialAdLoaded:(CDVInvokedUrlCommand*)command;
- (void) showInterstitialAd:(CDVInvokedUrlCommand*)command;

- (void) setRewardedAdCallback:(CDVInvokedUrlCommand*)command;
- (void) isRewardedAdLoaded:(CDVInvokedUrlCommand*)command;
- (void) showRewardedAd:(CDVInvokedUrlCommand*)command;

@end
