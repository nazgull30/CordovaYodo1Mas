#import <Yodo1MasCore/Yodo1MasAdEvent.h>
#import <Yodo1MasCore/Yodo1Mas.h>
#include "CordovaYodo1Mas.h"

NSString *ON_INIT_SUCCESS = @"on_init_success";
NSString *ON_INIT_FAILED = @"on_init_failed";

NSString *ON_BANNER_AD_NOT_LOADED = @"on_banner_ad_not_loaded";
NSString *ON_BANNER_AD_OPENED = @"on_banner_ad_opened";
NSString *ON_BANNER_AD_ERROR = @"on_banner_ad_error";
NSString *ON_BANNER_AD_CLOSED = @"on_banner_ad_closed";

NSString *ON_INTERSTITIAL_AD_NOT_LOADED = @"on_interstitial_ad_not_loaded";
NSString *ON_INTERSTITIAL_AD_OPENED = @"on_interstitial_ad_opened";
NSString *ON_INTERSTITIAL_AD_ERROR = @"on_interstitial_ad_error";
NSString *ON_INTERSTITIAL_AD_CLOSED = @"on_interstitial_ad_closed";

NSString *ON_REWARDED_AD_NOT_LOADED = @"on_rewarded_ad_not_loaded";
NSString *ON_REWARDED_AD_OPENED = @"on_rewarded_ad_opened";
NSString *ON_REWARDED_AD_EARNED = @"on_rewarded_ad_earned";
NSString *ON_REWARDED_AD_ERROR = @"on_rewarded_ad_error";
NSString *ON_REWARDED_AD_CLOSED = @"on_rewarded_ad_closed";

// BEGIN CALLBACKS
@interface CordovaYodo1MasBannerAd: NSObject<Yodo1MasBannerAdDelegate>

@property (nonatomic, copy) NSString* bannerCallbackID;
@property (nonatomic, weak) id <CDVCommandDelegate> commandDelegate;

@end


@implementation CordovaYodo1MasBannerAd

- (void)setBannerAdDelegate {
    [Yodo1Mas sharedInstance].bannerAdDelegate = self;
}

- (void)onAdOpened:(Yodo1MasAdEvent *)event {
    NSLog(@"CordovaYodo1MasBannerAd -> onAdOpened");
    NSDictionary *vals = @{@"event": ON_BANNER_AD_OPENED};
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:vals];
	[pluginResult setKeepCallback:[NSNumber numberWithBool:YES]];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:self.bannerCallbackID];
}

- (void)onAdClosed:(Yodo1MasAdEvent *)event {
    NSLog(@"CordovaYodo1MasBannerAd -> onAdClosed");
	NSDictionary *vals = @{@"event": ON_BANNER_AD_CLOSED};
	CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:vals];
	[pluginResult setKeepCallback:[NSNumber numberWithBool:YES]];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:self.bannerCallbackID];
}

- (void)onAdError:(Yodo1MasAdEvent *)event error:(Yodo1MasError *)error {
    if (error.code != Yodo1MasErrorCodeAdLoadFail) {
        NSLog(@"CordovaYodo1MasBannerAd -> onAdError, %d", (int)error.code);
		NSDictionary *vals = @{@"event": ON_BANNER_AD_ERROR, @"error": error};
		CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:vals];
		[pluginResult setKeepCallback:[NSNumber numberWithBool:YES]];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:self.bannerCallbackID];
    }
}

@end


@interface CordovaYodo1MasInterstitialAd: NSObject<Yodo1MasInterstitialAdDelegate>

@property (nonatomic, copy) NSString* interstitialCallbackID;
@property (nonatomic, weak) id <CDVCommandDelegate> commandDelegate;

@end


@implementation CordovaYodo1MasInterstitialAd

- (void)setInterstitialAdDelegate {
    [Yodo1Mas sharedInstance].interstitialAdDelegate = self;
}

- (void)onAdOpened:(Yodo1MasAdEvent *)event {
    NSLog(@"CordovaYodo1MasInterstitialAd -> onAdOpened");
	NSDictionary *vals = @{@"event": ON_INTERSTITIAL_AD_OPENED};
	CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:vals];
	[pluginResult setKeepCallback:[NSNumber numberWithBool:YES]];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:self.interstitialCallbackID];
}

- (void)onAdClosed:(Yodo1MasAdEvent *)event {
    NSLog(@"CordovaYodo1MasInterstitialAd -> onAdClosed");
	NSDictionary *vals = @{@"event": ON_INTERSTITIAL_AD_CLOSED};
	CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:vals];
	[pluginResult setKeepCallback:[NSNumber numberWithBool:YES]];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:self.interstitialCallbackID];
}

- (void)onAdError:(Yodo1MasAdEvent *)event error:(Yodo1MasError *)error {
    if (error.code != Yodo1MasErrorCodeAdLoadFail) {
        NSLog(@"CordovaYodo1MasInterstitialAd -> onAdError, %d", (int)error.code);
		NSDictionary *vals = @{@"event": ON_INTERSTITIAL_AD_ERROR, @"error": error};
		CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:vals];
		[pluginResult setKeepCallback:[NSNumber numberWithBool:YES]];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:self.interstitialCallbackID];
    }
}

@end


@interface CordovaYodo1MasRewardedAd: NSObject<Yodo1MasRewardAdDelegate>

@property (nonatomic, copy) NSString* rewardAdCallbackID;
@property (nonatomic, weak) id <CDVCommandDelegate> commandDelegate;

@end


@implementation CordovaYodo1MasRewardedAd

- (void)setRewardAdDelegate {
    [Yodo1Mas sharedInstance].rewardAdDelegate = self;
}

- (void)onAdOpened:(Yodo1MasAdEvent *)event {
    NSLog(@"CordovaYodo1MasRewardedAd -> onAdOpened");
	NSDictionary *vals = @{@"event": ON_REWARDED_AD_OPENED};
	CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:vals];
	[pluginResult setKeepCallback:[NSNumber numberWithBool:YES]];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:self.rewardAdCallbackID];
}

- (void)onAdClosed:(Yodo1MasAdEvent *)event {
    NSLog(@"CordovaYodo1MasRewardedAd -> onAdClosed");
	NSDictionary *vals = @{@"event": ON_REWARDED_AD_CLOSED};
	CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:vals];
	[pluginResult setKeepCallback:[NSNumber numberWithBool:YES]];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:self.rewardAdCallbackID];
}

- (void)onAdRewardEarned:(Yodo1MasAdEvent *)event {
    NSLog(@"CordovaYodo1MasRewardedAd -> onAdRewardEarned");
	NSDictionary *vals = @{@"event": ON_REWARDED_AD_EARNED};
	CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:vals];
	[pluginResult setKeepCallback:[NSNumber numberWithBool:YES]];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:self.rewardAdCallbackID];
}

- (void)onAdError:(Yodo1MasAdEvent *)event error:(Yodo1MasError *)error {
    if (error.code != Yodo1MasErrorCodeAdLoadFail) {
        NSLog(@"CordovaYodo1MasRewardedAd -> onAdError, %d", (int)error.code);
		NSDictionary *vals = @{@"event": ON_REWARDED_AD_ERROR, @"error": error};
		CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:vals];
		[pluginResult setKeepCallback:[NSNumber numberWithBool:YES]];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:self.rewardAdCallbackID];
    }
}

@end

// END CALLBACKS

@implementation CordovaYodo1Mas

bool initialized;

- (void) setBannerCallback:(CDVInvokedUrlCommand *)command {
//	CordovaYodo1MasBannerAd *bannerAd = [[CordovaYodo1MasBannerAd alloc] init];
    static CordovaYodo1MasBannerAd *bannerAd;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bannerAd = [[CordovaYodo1MasBannerAd alloc] init];
    });
	bannerAd.bannerCallbackID = command.callbackId;
	bannerAd.commandDelegate = self.commandDelegate;
//	[Yodo1Mas sharedInstance].bannerAdDelegate = bannerAd;
    [bannerAd setBannerAdDelegate];
}

- (void) setInterstitialAdCallback:(CDVInvokedUrlCommand *)command {
//	CordovaYodo1MasInterstitialAd *interstitialAd = [[CordovaYodo1MasInterstitialAd alloc] init];
    static CordovaYodo1MasInterstitialAd *interstitialAd;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        interstitialAd = [[CordovaYodo1MasInterstitialAd alloc] init];
    });
	interstitialAd.interstitialCallbackID = command.callbackId;
	interstitialAd.commandDelegate = self.commandDelegate;
//	[Yodo1Mas sharedInstance].interstitialAdDelegate = interstitialAd;
    [interstitialAd setInterstitialAdDelegate];
}

- (void) setRewardedAdCallback:(CDVInvokedUrlCommand *)command {
//	CordovaYodo1MasRewardedAd *rewardedAd = [[CordovaYodo1MasRewardedAd alloc] init];
    static CordovaYodo1MasRewardedAd *rewardedAd;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        rewardedAd = [[CordovaYodo1MasRewardedAd alloc] init];
    });
	rewardedAd.rewardAdCallbackID = command.callbackId;
	rewardedAd.commandDelegate = self.commandDelegate;
//	[Yodo1Mas sharedInstance].rewardAdDelegate = rewardedAd.self;
    [rewardedAd setRewardAdDelegate];
}


- (void) init:(CDVInvokedUrlCommand*)command {
    NSLog(@"CordovaYodo1Mas init");

	NSString *appIdPr = [command arguments][0];

    [[Yodo1Mas sharedInstance] initWithAppKey:appIdPr successful:^{
		NSLog(@"CordovaYodo1Mas -> initialize successful");
		initialized = true;
		NSDictionary *vals = @{@"event": ON_INIT_SUCCESS};
		CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:vals];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

    } fail:^(NSError * _Nonnull error) {
		NSLog(@"CordovaYodo1Mas -> initialize error: %@", error);
		NSDictionary *vals = @{@"event": ON_INIT_FAILED, @"error": error};
		CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:vals];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void)setGDPR:(CDVInvokedUrlCommand *)command {
	[Yodo1Mas sharedInstance].isGDPRUserConsent = [[command arguments][0] boolValue];
}

- (void)setCCPA:(CDVInvokedUrlCommand *)command {
	[Yodo1Mas sharedInstance].isCCPADoNotSell = [[command arguments][0] boolValue];
}

- (void)setCOPPA:(CDVInvokedUrlCommand *)command {
	[Yodo1Mas sharedInstance].isCOPPAAgeRestricted = [[command arguments][0] boolValue];
}

- (void)isBannerAdLoaded:(CDVInvokedUrlCommand *)command {
	bool loaded = [[Yodo1Mas sharedInstance] isBannerAdLoaded];
	NSLog(@"CordovaYodo1Mas -> isBannerAdLoaded: %d", loaded);
	CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:loaded];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)showBannerAd:(CDVInvokedUrlCommand *)command {
	if (!initialized) {
		NSLog(@"CordovaYodo1Mas not initialized");
		return;
	}

	bool isBannerAdLoaded = [[Yodo1Mas sharedInstance] isBannerAdLoaded];
	NSLog(@"CordovaYodo1Mas isBannerAdLoaded %d", isBannerAdLoaded);
	if(!isBannerAdLoaded) {
		NSDictionary *vals = @{@"event": ON_BANNER_AD_NOT_LOADED };
		CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:vals];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
		return;
	}

	[[Yodo1Mas sharedInstance] showBannerAd];
}

- (void)showBannerAdWithAlign:(CDVInvokedUrlCommand *)command {
	if (!initialized) {
		NSLog(@"CordovaYodo1Mas not initialized");
		return;
	}

	bool isBannerAdLoaded = [[Yodo1Mas sharedInstance] isBannerAdLoaded];
	NSLog(@"CordovaYodo1Mas isBannerAdLoaded %d", isBannerAdLoaded);
	if(!isBannerAdLoaded) {
		NSDictionary *vals = @{@"event": ON_BANNER_AD_NOT_LOADED };
		CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:vals];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
		return;
	}

	Yodo1MasAdBannerAlign align = (Yodo1MasAdBannerAlign) [[command arguments][0] intValue];
	[[Yodo1Mas sharedInstance] showBannerAdWithAlign:(Yodo1MasAdBannerAlign)align];
}

- (void)showBannerAdWithAlignAndOffset:(CDVInvokedUrlCommand *)command {
	if (!initialized) {
		NSLog(@"CordovaYodo1Mas not initialized");
		return;
	}

	bool isBannerAdLoaded = [[Yodo1Mas sharedInstance] isBannerAdLoaded];
	NSLog(@"CordovaYodo1Mas isBannerAdLoaded %d", isBannerAdLoaded);
	if(!isBannerAdLoaded) {
		NSDictionary *vals = @{@"event": ON_BANNER_AD_NOT_LOADED };
		CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:vals];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
		return;
	}

	Yodo1MasAdBannerAlign align = (Yodo1MasAdBannerAlign) [[command arguments][0] intValue];
    CGFloat offsetX = [[command arguments][1] floatValue];
    CGFloat offsetY = [[command arguments][2] floatValue];

	CGPoint offset = CGPointMake(offsetX, offsetY);
	[[Yodo1Mas sharedInstance] showBannerAdWithAlign:(Yodo1MasAdBannerAlign)align offset:offset];
}

- (void)dismissBannerAd:(CDVInvokedUrlCommand *)command {
	if (!initialized) {
		NSLog(@"CordovaYodo1Mas not initialized");
		return;
	}

	[[Yodo1Mas sharedInstance] dismissBannerAd];
}

- (void)isInterstitialAdLoaded:(CDVInvokedUrlCommand *)command {
	bool loaded = [[Yodo1Mas sharedInstance] isInterstitialAdLoaded];
	NSLog(@"CordovaYodo1Mas -> isInterstitialAdLoaded: %d", loaded);
	CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:loaded];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)showInterstitialAd:(CDVInvokedUrlCommand *)command {
	if (!initialized) {
		NSLog(@"CordovaYodo1Mas not initialized");
		return;
	}

	bool isInterstitialAdLoaded = [[Yodo1Mas sharedInstance] isInterstitialAdLoaded];
	NSLog(@"CordovaYodo1Mas isInterstitialAdLoaded %d", isInterstitialAdLoaded);
	if(!isInterstitialAdLoaded) {
		NSDictionary *vals = @{@"event": ON_INTERSTITIAL_AD_NOT_LOADED };
		CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:vals];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
		return;
	}

    [[Yodo1Mas sharedInstance] showInterstitialAd];
}

- (void)isRewardedAdLoaded:(CDVInvokedUrlCommand *)command {
	bool loaded = [[Yodo1Mas sharedInstance] isRewardAdLoaded];
	NSLog(@"CordovaYodo1Mas -> isRewardedAdLoaded: %d", loaded);
	CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:loaded];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)showRewardedAd:(CDVInvokedUrlCommand *)command {
	if (!initialized) {
		NSLog(@"CordovaYodo1Mas not initialized");
		return;
	}

	bool isRewardedAdLoaded = [[Yodo1Mas sharedInstance] isRewardAdLoaded];
	NSLog(@"CordovaYodo1Mas isRewardedAdLoaded %d", isRewardedAdLoaded);
	if(!isRewardedAdLoaded) {
		NSDictionary *vals = @{@"event": ON_REWARDED_AD_NOT_LOADED };
		CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:vals];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
		return;
	}

    [[Yodo1Mas sharedInstance] showRewardAd];
}


@end
