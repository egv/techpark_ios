//
//  TPViewModel.h
//  TPViewDemo
//
//  Created by d.taraev on 20.10.16.
//  Copyright © 2016 mail.ru. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TPViewModel : NSObject

@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *password;
@property (nonatomic) BOOL isEmpty;

- (instancetype)initWithUsername:(NSString *)username password:(NSString *)password;

@end
