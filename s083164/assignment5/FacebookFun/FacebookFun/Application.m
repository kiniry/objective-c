//
//  Application.m
//  FacebookFun
//
//  Created by Emil Klarskov Kristensen on 2/1/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import "Application.h"

//Public fields
static NSString *const EKKAccessAppName = @"name";
static NSString *const EKKAccessAppDescription = @"description";
static NSString *const EKKAccessAppLink = @"link";
static NSString *const EKKAccessAppIconURL = @"icon_url";
static NSString *const EKKAccessAppLogoURL = @"logo_url";
static NSString *const EKKAccessAppDailyActiveUsers = @"daily_active_users";
static NSString *const EKKAccessAppWeeklyActiveUsers = @"weekly_active_users";
static NSString *const EKKAccessAppMonthlyActiveUsers = @"monthly_active_users";
static NSString *const EKKAccessAppCategory = @"category";
static NSString *const EKKAccessAppCompany = @"company";
static NSString *const EKKAccessAppSubcategory = @"subcategory";
static NSString *const EKKAccessAppNamespace = @"namespace";

//Private fields - needs accesstoken. String returned otherwise indicated
static NSString *const EKKAccessAppMigrations = @"migrations"; //ARRAY
static NSString *const EKKAccessAppRestrictions = @"restrictions"; //OBJECT
static NSString *const EKKAccessAppAppDomains = @"app_domains"; //ARRAY
static NSString *const EKKAccessAppAuthDialogDataHelpURL = @"auth_dialog_data_help_url";
static NSString *const EKKAccessAppAuthDialogHeadline = @"auth_dialog_headline";
static NSString *const EKKAccessAppAuthDialogPermsExplanation = @"auth_dialog_perms_explanation";
static NSString *const EKKAccessAppAuthReferralUserPerms = @"auth_referral_user_perms"; //ARRAY
static NSString *const EKKAccessAppAuthReferralFriendPerms = @"auth_referral_friend_perms"; //ARRAY
static NSString *const EKKAccessAppAuthReferralDefaultActivityPrivacy = @"auth_referral_default_activity_privacy";
static NSString *const EKKAccessAppAuthReferralEnabled = @"auth_referral_enabled"; //BOOL
static NSString *const EKKAccessAppAuthReferralExtendedPerms = @"auth_referral_extended_perms"; //ARRAY
static NSString *const EKKAccessAppAuthReferralResponseType = @"auth_referral_response_type";
static NSString *const EKKAccessAppCanvasFluidHeight = @"canvas_fluid_height"; //BOOL
static NSString *const EKKAccessAppCanvasFluidWidth = @"canvas_fluid_width"; //BOOL
static NSString *const EKKAccessAppCanvasURL = @"canvas_url";
static NSString *const EKKAccessAppContactEmail = @"contact_email";
static NSString *const EKKAccessAppCreatedTime = @"created_time"; //INT
static NSString *const EKKAccessAppCreatorUID = @"creator_uid"; //INT
static NSString *const EKKAccessAppDeauthCallbackURL = @"deauth_callback_url";
static NSString *const EKKAccessAppIphoneAppStoreID = @"iphone_app_store_id";
static NSString *const EKKAccessAppHostingURL = @"hosting_url";
static NSString *const EKKAccessAppMobileWebURL = @"mobile_web_url";
static NSString *const EKKAccessAppPageTabDefaultName = @"page_tab_default_name";
static NSString *const EKKAccessAppPageTabURL = @"page_tab_url";
static NSString *const EKKAccessAppPrivacyPolicyURL = @"privacy_policy_url";
static NSString *const EKKAccessAppSecureCanvasURL = @"secure_canvas_url";
static NSString *const EKKAccessAppSecurePageTabURL = @"secure_page_tab_url";
static NSString *const EKKAccessAppServerIpWhitelist = @"server_ip_whitelist";
static NSString *const EKKAccessAppSocialDiscovery = @"social_discovery"; //BOOL
static NSString *const EKKAccessAppTermsOfServiceURL = @"terms_of_service_url";
static NSString *const EKKAccessAppUserSupportEmail = @"user_support_email";
static NSString *const EKKAccessAppUserSupportURL = @"user_support_url";
static NSString *const EKKAccessAppWebsiteURL = @"website_url";

@implementation Application

-(void) handleData:(NSDictionary*)data
{
    
//    Public facebook properties
    if ([data objectForKey:EKKAccessAppName]) self.name = [data objectForKey:EKKAccessAppName];
    if ([data objectForKey:EKKAccessAppDescription]) self.appDescription = [data objectForKey:EKKAccessAppDescription];
    if ([data objectForKey:EKKAccessAppLink]) self.link = [data objectForKey:EKKAccessAppLink];
    if ([data objectForKey:EKKAccessAppIconURL]) self.iconURL = [data objectForKey:EKKAccessAppIconURL];
    if ([data objectForKey:EKKAccessAppLogoURL]) self.logoURL = [data objectForKey:EKKAccessAppLogoURL];
    if ([data objectForKey:EKKAccessAppDailyActiveUsers]) self.dailyActiveUsers = [data objectForKey:EKKAccessAppDailyActiveUsers];
    if ([data objectForKey:EKKAccessAppCategory]) self.category = [data objectForKey:EKKAccessAppCategory];
    if ([data objectForKey:EKKAccessAppWeeklyActiveUsers]) self.weeklyActiveUsers = [data objectForKey:EKKAccessAppWeeklyActiveUsers];
    if ([data objectForKey:EKKAccessAppMonthlyActiveUsers]) self.monthlyActiveUsers = [data objectForKey:EKKAccessAppMonthlyActiveUsers];
    if ([data objectForKey:EKKAccessAppCompany]) self.company = [data objectForKey:EKKAccessAppCompany];
    if ([data objectForKey:EKKAccessAppSubcategory]) self.subcategory = [data objectForKey:EKKAccessAppSubcategory];
    if ([data objectForKey:EKKAccessAppNamespace]) self.appNamespace = [data objectForKey:EKKAccessAppNamespace];
    
//    Private
    if ([data objectForKey:EKKAccessAppMigrations]) self.migrations = [data objectForKey:EKKAccessAppMigrations];
    if ([data objectForKey:EKKAccessAppRestrictions]) self.restrictions = [data objectForKey:EKKAccessAppRestrictions];
    if ([data objectForKey:EKKAccessAppAppDomains]) self.appDomains = [data objectForKey:EKKAccessAppAppDomains];
    if ([data objectForKey:EKKAccessAppAuthDialogDataHelpURL]) self.authDialogDataHelpURL = [data objectForKey:EKKAccessAppAuthDialogDataHelpURL];
    if ([data objectForKey:EKKAccessAppAuthDialogHeadline]) self.authDialogHeadline = [data objectForKey:EKKAccessAppAuthDialogHeadline];
    if ([data objectForKey:EKKAccessAppAuthDialogPermsExplanation]) self.authDialogPermsExplanation = [data objectForKey:EKKAccessAppAuthDialogPermsExplanation];
    if ([data objectForKey:EKKAccessAppAuthReferralUserPerms]) self.authReferralUserPerms = [data objectForKey:EKKAccessAppAuthReferralUserPerms];
    if ([data objectForKey:EKKAccessAppAuthReferralFriendPerms]) self.authReferralFriendPerms = [data objectForKey:EKKAccessAppAuthReferralFriendPerms];
    if ([data objectForKey:EKKAccessAppAuthReferralDefaultActivityPrivacy]) self.authReferralDefaultActivityPrivacy = [data objectForKey:EKKAccessAppAuthReferralDefaultActivityPrivacy];
    if ([data objectForKey:EKKAccessAppAuthReferralEnabled]) self.authReferralEnabled = [[data objectForKey:EKKAccessAppAuthReferralEnabled] boolValue];
    if ([data objectForKey:EKKAccessAppAuthReferralExtendedPerms]) self.authReferralExtendedPerms = [data objectForKey:EKKAccessAppAuthReferralExtendedPerms];
    if ([data objectForKey:EKKAccessAppAuthReferralResponseType]) self.authReferralResponseType = [data objectForKey:EKKAccessAppAuthReferralResponseType];
    if ([data objectForKey:EKKAccessAppCanvasFluidHeight]) self.canvasFluidHeight = [[data objectForKey:EKKAccessAppCanvasFluidHeight] boolValue];
    if ([data objectForKey:EKKAccessAppCanvasFluidWidth]) self.canvasFluidWidth = [[data objectForKey:EKKAccessAppCanvasFluidWidth] boolValue];
    if ([data objectForKey:EKKAccessAppCanvasURL]) self.canvasURL = [data objectForKey:EKKAccessAppCanvasURL];
    if ([data objectForKey:EKKAccessAppContactEmail]) self.contactEmail = [data objectForKey:EKKAccessAppContactEmail];
    if ([data objectForKey:EKKAccessAppCreatedTime]) self.createdTime = [[data objectForKey:EKKAccessAppCreatedTime] integerValue];
    if ([data objectForKey:EKKAccessAppCreatorUID]) self.creatorUID = [[data objectForKey:EKKAccessAppCreatorUID] integerValue];
    if ([data objectForKey:EKKAccessAppDeauthCallbackURL]) self.deauthCallbackURL = [data objectForKey:EKKAccessAppDeauthCallbackURL];
    if ([data objectForKey:EKKAccessAppIphoneAppStoreID]) self.iphoneAppStoreID = [data objectForKey:EKKAccessAppIphoneAppStoreID];
    if ([data objectForKey:EKKAccessAppHostingURL]) self.hostingURL = [data objectForKey:EKKAccessAppHostingURL];
    if ([data objectForKey:EKKAccessAppMobileWebURL]) self.mobileWebURL = [data objectForKey:EKKAccessAppMobileWebURL];
    if ([data objectForKey:EKKAccessAppPageTabDefaultName]) self.pageTabDefaultName = [data objectForKey:EKKAccessAppPageTabDefaultName];
    if ([data objectForKey:EKKAccessAppPageTabURL]) self.pageTabURL = [data objectForKey:EKKAccessAppPageTabURL];
    if ([data objectForKey:EKKAccessAppPrivacyPolicyURL]) self.privacyPolicyURL = [data objectForKey:EKKAccessAppPrivacyPolicyURL];
    if ([data objectForKey:EKKAccessAppSecureCanvasURL]) self.secureCanvasURL = [data objectForKey:EKKAccessAppSecureCanvasURL];
    if ([data objectForKey:EKKAccessAppSecurePageTabURL]) self.securePageTabURL = [data objectForKey:EKKAccessAppSecurePageTabURL];
    if ([data objectForKey:EKKAccessAppServerIpWhitelist]) self.serverIpWhitelist = [data objectForKey:EKKAccessAppServerIpWhitelist];
    if ([data objectForKey:EKKAccessAppSocialDiscovery]) self.socialDiscovery = [[data objectForKey:EKKAccessAppSocialDiscovery] boolValue];
    if ([data objectForKey:EKKAccessAppTermsOfServiceURL]) self.termsOfServiceURL = [data objectForKey:EKKAccessAppTermsOfServiceURL];
    if ([data objectForKey:EKKAccessAppUserSupportEmail]) self.userSupportEmail = [data objectForKey:EKKAccessAppUserSupportEmail];
    if ([data objectForKey:EKKAccessAppUserSupportURL]) self.userSupportURL = [data objectForKey:EKKAccessAppUserSupportURL];
    if ([data objectForKey:EKKAccessAppWebsiteURL]) self.websiteURL = [data objectForKey:EKKAccessAppWebsiteURL];
    
}

-(void) initAttributes
{
    self.attributes = @[EKKAccessAppName,EKKAccessAppDescription,EKKAccessAppLink,EKKAccessAppIconURL,EKKAccessAppLogoURL,EKKAccessAppDailyActiveUsers,EKKAccessAppWeeklyActiveUsers,EKKAccessAppMonthlyActiveUsers,EKKAccessAppCategory,EKKAccessAppCompany,EKKAccessAppSubcategory,EKKAccessAppNamespace,EKKAccessAppMigrations,EKKAccessAppRestrictions,EKKAccessAppAppDomains,EKKAccessAppAuthDialogDataHelpURL,EKKAccessAppAuthDialogHeadline,EKKAccessAppAuthDialogPermsExplanation,EKKAccessAppAuthReferralUserPerms,EKKAccessAppAuthReferralFriendPerms,EKKAccessAppAuthReferralDefaultActivityPrivacy,EKKAccessAppAuthReferralEnabled,EKKAccessAppAuthReferralExtendedPerms,EKKAccessAppAuthReferralResponseType,EKKAccessAppCanvasFluidHeight,EKKAccessAppCanvasFluidWidth,EKKAccessAppCanvasURL,EKKAccessAppContactEmail,EKKAccessAppCreatedTime,EKKAccessAppCreatorUID,EKKAccessAppDeauthCallbackURL,EKKAccessAppIphoneAppStoreID,EKKAccessAppHostingURL,EKKAccessAppMobileWebURL,EKKAccessAppPageTabDefaultName,EKKAccessAppPageTabURL,EKKAccessAppPrivacyPolicyURL,EKKAccessAppSecureCanvasURL,EKKAccessAppSecurePageTabURL,EKKAccessAppServerIpWhitelist,EKKAccessAppSocialDiscovery,EKKAccessAppTermsOfServiceURL,EKKAccessAppUserSupportEmail,EKKAccessAppUserSupportURL,EKKAccessAppWebsiteURL];
}



@end
