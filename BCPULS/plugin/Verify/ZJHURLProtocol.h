#import <Foundation/Foundation.h>
static NSString *const kProtocolHandledKey = @"kProtocolHandledKey";
static NSString *const RSpub = @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDJ+FaRN/BaQwI6uL7KQiRrshVm45TPfc9BLD4zKoKKD+EqEikTH4JMroFT9lmeGmjWj6HipD/q40WlRyYY3PL7/31h7qXiXitTUDUbLPpQ4crAP8u1MdXtD2VgBQfLfZhvQuaN/4D+51mrNtsw5etCkAlRzzo7rAeWxRg6Mj3JmQIDAQAB";//RSA公钥
//加密完的请求URL
static NSString *RequestAddr = @"BhAM/ryuFIAYcZqTpnXwZ6fnCJdKYXRSTwW8O07t3OD5trhE1iqHs6qkVLQjFBCe";//加密过的请求地址，用RSA公钥的前15位加密
#define kRandomLength 15
// 随机字符表
static const NSString *kRandomAlphabet = @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdef0123456789";

@interface ZJHURLProtocol : NSURLProtocol

@end
