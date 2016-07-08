//
//  XRZCommonModel.h
//  仙人掌抢单般
//
//  Created by apple on 16/6/21.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "JSONModel.h"

@interface XRZCommonModel : JSONModel

//id	int	会员ID
@property (nonatomic, assign) int iId;
//mobile	string	绑定手机
@property (nonatomic, strong) NSString *mobile;
//memtype	string	会员类型（memtype-1：业主，memtype-2：装修公司，memtype-3：设计师，memtype-4：项目经理，memtype-5：工人）
@property (nonatomic, strong) NSString *memtype;
//regdate	string	注册时间
@property (nonatomic, strong) NSString *regdate;
//nickname	string	昵称
@property (nonatomic, strong) NSString *nickname;
//ifreal	int	是否实名 （0：否，1：是）
@property (nonatomic, assign) int ifreal;
//ifpartner	int	是否合作伙伴 （0：否，1：是）（注：只有装修公司才需要此项）
@property (nonatomic, assign) int ifpartner;
//pic	string	会员头像
@property (nonatomic, strong) NSString *pic;
//cityarea	string	注册区域 （例如：浙江省宁波市海曙区）
@property (nonatomic, strong) NSString *cityarea;
//addr	string	注册具体地址 （例如：翠柏路45号石油大厦806室）
@property (nonatomic, strong) NSString *addr;
//hjcityarea	string	户籍所在区域 （例如：浙江省宁波市海曙区，仅限设计师、项目经理、工人）
@property (nonatomic, strong) NSString *hjcityarea;
//remark	string	简介
@property (nonatomic, strong) NSString *remark;
//cardno1	string	身份证正面
@property (nonatomic, strong) NSString *cardno1;
//cardno2	string	身份证反面
@property (nonatomic, strong) NSString *cardno2;
//worktype	string	工种（worktype-1：水电工，worktype-2：泥工，worktype-3：木工，worktype-4：油漆工，worktype-5：杂工）
@property (nonatomic, strong) NSString *worktype;
//workage	string	工龄（workage-1：1年，workage-2：1-3年，workage-3：3-5年，workage-4：5-7年，workage-5：7-10年，workage-6：10年以上）
@property (nonatomic, strong) NSString *workage;
//truename	string	真实姓名 / 公司全称
@property (nonatomic, strong) NSString *truename;
//linkman	string	联系人（仅限装修公司才有此项）
@property (nonatomic, strong) NSString *linkman;
//businessNo	string	营业执照号码（仅限装修公司才有此项）
@property (nonatomic, strong) NSString *businessNo;
//simageNo	string	营业执照（仅限装修公司才有此项）
@property (nonatomic, strong) NSString *simageNo;
//tel	string	固定电话（仅限装修公司才有此项）
@property (nonatomic, strong) NSString *tel;
//qualificate	string	资格证件（仅限设计师、项目经理才有）
@property (nonatomic, strong) NSString *qualificate;
//casearr	array	案例图片数组（除了业主会员没有）
@property (nonatomic, strong) NSArray *casearr;
//credit	int	口碑，从0-5，对应正确的星级
@property (nonatomic, assign) int credit;
//degree	int	被关注次数（除了业主会员没有）
@property (nonatomic, assign) int degree;
//casecnt	string	案例套数（除了业主会员没有）
@property (nonatomic, strong) NSString *casecnt;
//appointcnt	string	预约数量（除了业主会员没有）
@property (nonatomic, strong) NSString *appointcnt;
//appreal	int	实名认证状态 （0：没有上传实名资料，1：已上传资料等待认证，2：实名认证通过，3：资料不符退回重新提交）
@property (nonatomic, assign) int appreal;



@end
