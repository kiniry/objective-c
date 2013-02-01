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
static NSString *const EKKAccessAppSubCategory = @"subcategory";
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
static NSString *const EKKAccessAppTermsOfService = @"terms_of_service_url";
static NSString *const EKKAccessAppUserSupportEmail = @"user_support_email";
static NSString *const EKKAccessAppUserSupportURL = @"user_support_url";
static NSString *const EKKAccessAppWebsiteURL = @"website_url";

@implementation Application

-(void) handleData:(NSDictionary*)data
{
    NSLog(@"%@", data);
    
    //Very ugly.
    if ([data objectForKey:EKKAccessAppName]) self.name = [data objectForKey:EKKAccessAppName];
    if ([data objectForKey:EKKAccessAppDescription]) self.appDescription = [data objectForKey:EKKAccessAppDescription];
    if ([data objectForKey:EKKAccessAppLink]) self.link = [data objectForKey:EKKAccessAppLink];
    if ([data objectForKey:EKKAccessAppIconURL]) self.iconURL = [data objectForKey:EKKAccessAppIconURL];
    if ([data objectForKey:EKKAccessAppLogoURL]) self.logoURL = [data objectForKey:EKKAccessAppLogoURL];
    if ([data objectForKey:EKKAccessAppDailyActiveUsers]) self.dailyActiveUsers = [data objectForKey:EKKAccessAppLogoURL];
    if ([data objectForKey:EKKAccessAppCategory]) self.category = [data objectForKey:EKKAccessAppCategory];

}

@end
