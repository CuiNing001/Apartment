//
//  NetWorkManger.h
//  VTraval
//
//  Created by lanouhn on 16/6/1.
//  Copyright © 2016年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorkManger : NSObject

// 参数urlStr表示网络请求url,paramDic表示请求参数,finish回调指网络请求成功回调,enError表示失败回调

// GET请求
+ (void)requestGETWithURLStr:(NSString *)urlStr paramDic:(NSDictionary *)paramDic finish:(void (^)(id responserObject))finish enError:(void (^)(NSError *error))enError;

// POST请求
+ (void)requestPOSTWithURLStr:(NSString *)urlStr paramDic:(NSDictionary *)paramDic finish:(void(^)(id responserObject))finish enError:(void(^)(NSError *error))enError;

@end
