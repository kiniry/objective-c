//
//  Application.h
//  FacebookFun
//
//  Created by Emil Klarskov Kristensen on 2/1/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@interface Application : Node

//Public
@property(nonatomic, strong) NSString* name;
@property(nonatomic, strong) NSString* appDescription; //Cant use description d'ooh
@property(nonatomic, strong) NSString* link;
@property(nonatomic, strong) NSString* category;
@property(nonatomic, strong) NSString* company;
@property(nonatomic, strong) NSString* iconURL;
@property(nonatomic, strong) NSString* logoURL;
@property(nonatomic, strong) NSString* dailyActiveUsers;
@property(nonatomic, strong) NSString* weeklyActiveUsers;
@property(nonatomic, strong) NSString* MonthlyActiveUsers;
@property(nonatomic, strong) NSString* subcategory;
@property(nonatomic, strong) NSString* appNamespace;

//Needs accesstoken
@property(nonatomic, strong) NSArray* migrations;
@property(nonatomic, strong) NSArray* appDomains;
@property(nonatomic, strong) NSString* authDialogDataHelpURL;
@property(nonatomic, strong) NSString* authDialogHeadline;
@property(nonatomic, strong) NSString* authDialogPermsExplanation;
@property(nonatomic, strong) NSArray* authReferralUserPerms;
@property(nonatomic, strong) NSArray* authReferralFriendPerms;
@property(nonatomic, strong) NSString* authReferralDefaultActivityPrivacy;
@property(nonatomic, strong) BOOL authReferralEnabled;
@property(nonatomic, strong) NSArray* authReferralExtendedPerms;
@property(nonatomic, strong) NSString* authReferralResponseType;
@property(nonatomic, strong) BOOL canvasFluidHeigh;
@property(nonatomic, strong) BOOL canvasFluidWidth;
@property(nonatomic, strong) NSString* canvasURL;
@property(nonatomic, strong) NSString* contactEmail;
@property(nonatomic, strong) NSInteger createdTime;
@property(nonatomic, strong) NSInteger creatorUID;
@property(nonatomic, strong) NSString* deauthCallbackURL;
@property(nonatomic, strong) NSString* iphoneAppStoreID;
@property(nonatomic, strong) NSString* hostingURL;
@property(nonatomic, strong) NSString* mobileWebURL;
@property(nonatomic, strong) NSString* pageTabDefaultName;
@property(nonatomic, strong) NSString* pageTabURL;
@property(nonatomic, strong) NSString* privacyPolicyURL;
@property(nonatomic, strong) NSString* secureCanvasURL;
@property(nonatomic, strong) NSString* securePageTabURL;
@property(nonatomic, strong) NSString* serverIpWhitelist;
@property(nonatomic, strong) BOOL socialDiscovery;
@property(nonatomic, strong) NSString* termsOfService;
@property(nonatomic, strong) NSString* userSupportEmail;
@property(nonatomic, strong) NSString* userSupportURL;
@property(nonatomic, strong) NSString* websiteURL;
@property(nonatomic, strong) NSString* authReferralResponseType;


@end
