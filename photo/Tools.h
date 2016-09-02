//
//  Tools.h
//  CarModelHeadlines
//
//  Created by wy on 15/3/20.
//  Copyright (c) 2015年 北京智阅网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <ifaddrs.h>
#import <arpa/inet.h>
typedef enum catcheType
{
    catcheUserType,//用户信息缓存
    catcheNoRemoveType,//不可移除缓存
    catcheTempType,//临时缓存
    
    
}catcheType;

@interface Tools : NSObject
//+ (NSString *)sha1:(NSString *)str;
+ (NSString *)md5Hash:(NSString *)str;

+(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;

//  1.NSString 为空(nil)的验证
+ (BOOL)isEmptyOrNull:(NSString *)string;
//  2.邮箱验证
+ (BOOL)isValidateEmail:(NSString *)email;
//  3.电话号验证
+ (BOOL)isMobileNumber:(NSString *)mobileNum;
//  4.身份证验证
+ (BOOL)isIdCard:(NSString *)sPaperId;
//是否6-18位数字或者字母组合
+ (BOOL)isPassWord:(NSString *)strPassword;
//md5值
//+(NSString *)md5ToHash:(NSString *)str;

//  5.浮点数验证(未实现)
//+ (BOOL)isFloatingNumber:(NSString *)fnumber;
/**
 生成当前时间字符串
 @returns 当前时间字符串
 */
+ (NSString*)getCurrentTimeString;

/**
 获取缓存路径
 @returns 缓存路径
 */
+ (NSString*)getCacheDirectory;
/**
 * @author wywinstonwy
 *
 * @brief 获取ip地址
 *
 * @return
 */
+ (NSString *)getIPAddress;
/**
 判断文件是否存在
 @param _path 文件路径
 @returns 存在返回yes
 */
+ (BOOL)fileExistsAtPath:(NSString*)_path;

/**
 删除文件
 @param _path 文件路径
 @returns 成功返回yes
 */
+ (BOOL)deleteFileAtPath:(NSString*)_path;
//返回day天后的日期(若day为负数,则为|day|天前的日期)
+ (NSString *)dateAfterDay:(int)day;
+ (NSString *)dateAfterDay2:(int)day;
#pragma mark -

/**
 生成文件路径
 @param pathName 文件名
 @param pathType 文件类型
 @returns 文件路径
 */
+(NSString *)getPathString:(NSString *)pathName type:(NSString *)pathType;

/**
 获取当前系统日期
 @returns 月日
 */
+(NSString *)getSystemDate;
+(NSString *)getSystemDateyyyy;
/**
 NSDate 转 NSString
 @param date 要转的日期
 @returns 转后的日期字符
 */
+(NSString *)dateToString:(NSDate *)date;
/**
 @param strdate 日期字符
 @returns 转换后的日期
 */
+(NSDate *)stringToDate:(NSString *)strdate;
+(BOOL)isNetWorkStatus;
/**
 *  .时间返回与刷新时间比较：两分钟内刚刚，2-60分内，1-23小时，一天，昨天，几天前，几个月前
 *
 *  @param str1 时间字符串
 *
 *  @return 显示时间
 */
+(NSString *) stringTimeWithString:(NSString *)str1;

/**
 *  分享功能 ，新浪，微信分享
 *
 *  @param content        分享内容
 *  @param defaultcontent 默认内容
 *  @param image          分享的图片
 *  @param title          分享的标题
 *  @param urlString      分享的地址 url
 *  @param description    分享描述
 */
+(void)shareWithContent:(NSString *)content
         defaultcontent:(NSString *)defaultcontent
                  image:(NSString *)urlImage
                  title:(NSString *)title
              urlString:(NSString *)urlString
            description:(NSString *)description;
/**
 *正则表达式，解决xss漏洞
 */
//+ (NSString *)MyRegularExpressions:(NSString *)url;
+ (BOOL)isValidateDate:(NSString *)beginDateStr andDate:(NSString *)endDateStr;
/**
 *  获取屏幕截图
 *
 *  @param theView <#theView description#>
 *
 *  @return <#return value description#>
 */
+ (UIImage *)imageFromView: (UIView *) theView;

//全屏截取
+(UIImage *)fullScreenshots;

//图片角标，0 普通，1热门，2原创，3，推广，4专题，5推荐，6头条
+(UIImage *)returnImagearticleTypeLogo:(NSInteger)type;


//返回对应url
+(NSString *)returnURLWithStr:(NSString *)str;

+(NSString *)stringWithObj:(NSObject *)obj;

+(CGFloat)getTextWidth:(NSString *)text height:(CGFloat)height font:(UIFont *)font;

+(CGFloat)getTextHeight:(NSString *)text width:(CGFloat)width font:(UIFont *)font;

/**
 *  统一保存综述，口碑，竞争力，资讯，参数对比所有网页
 *
 *  @param uls <#uls description#>
 */
+ (void)saveCarDetailURLs:(NSArray *)uls;
+ (NSArray *)getAllCarDetailWebURLs;

/**
 *  @author wywinstonwy, 16-03-29 20:03:15
 *
 *  获取保存的数据
 *
 *  @param key
 *
 *  @return
 */
+ (id)loadLocalWithKey:(NSString *)key
                catcheType:(catcheType)type;
/**
 *  @author wywinstonwy, 16-03-29 20:03:43
 *
 *  归档本地化管理
 *
 *  @param key 保存对应key路径
 *  @param obj 要保存的对象
 */
+ (void)saveLoacalWithKey:(NSString *)key
                   object:(id)obj
                   catheType:(catcheType)type;


#pragma mark 文字高度计算
/**
 * @author wywinstonwy
 *
 * @brief 获取文字的高度
 *
 * @param string   文字
 * @param fontSize 文字大小
 * @param width    宽度
 *
 * @return
 */
+(float)bundleHeightWithString:(NSString *)string
                      fontSize:(float)fontSize
                          with:(float)width;

/**
 * @author 宋元明
 *
 * @brief 判断手动选择城市是否为空
 *
 * @return yes 为空
 */
+(BOOL)currentCityIsNullOrNil;



+ (void)addJavaScriptWithWebView:(UIWebView *)webView;

@end
