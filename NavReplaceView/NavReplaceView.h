//  Created by zong_xing on 2018/4/4.
//  Copyright © 2018年 zong_xing. All rights reserved.
//

//初始化
//-(NavReplaceView *)navView{
//    if (!_navView) {
//        _navView = [[NavReplaceView alloc]initWithFrame:CGRectZero];
//        _navView.viewConroller = self; //必须传
//        _navView.nav_color = [UIColor orangeColor];
//    }
//    return _navView;
//}
// ====UINavigationItem * navigationItem;   UINavigationBar * navBar;与系统的用法一致===
//self.navView.navigationItem.leftBarButtonItem = rightItem;
//[backBtn addTarget:self action:@selector(backButtonTouch) forControlEvents:UIControlEventTouchUpInside];


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NavReplaceView : UIView<UINavigationControllerDelegate>
@property (nonatomic,strong)UIView * statusView;
@property (nonatomic,strong)UIView * backView;

@property (nonatomic,strong)UINavigationBar * navBar;
@property (nonatomic,strong)UINavigationItem * navigationItem;
@property (nonatomic,strong)id viewConroller; //渐变的 控制器，必须传

@property (nonatomic,assign)CGFloat setupalpha; //当前透明度
@property (nonatomic,assign)CGFloat noteAlpha; //跳转页面的时候使用
@property (nonatomic,strong)UIColor *nav_color; //导航栏颜色

@property (nonatomic,assign)BOOL isFrist; //是否是初始化时 ，同 onFristInitAlaph调用

/**
 根据距离改变透明图
 用法：
 -(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat margin = 150;
    [self.navView setupAlphaAtScrollView:scrollView withMargin:margin];
 }
 @param scrollView 滚动视图
 @param margin 变化的范围
 */
-(void)setupAlphaAtScrollView:(UIScrollView *)scrollView withMargin:(CGFloat)margin;


/**
 初始化透明度
 用法：
 //-(void)viewWillAppear:(BOOL)animated{
 //    [super viewWillAppear:animated];
 //    //初始化侵入式 替换的导航栏视图
 //    self.navView.isFrist = YES;
 //    [self.navView onFristInitAlaph];
 //}
 */
-(void)onFristInitAlaph;

@end
