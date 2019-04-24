//
//  NavReplaceViewController.m
//  XZUtilsKitDemo
//
//  Created by yanyu on 2019/4/24.
//  Copyright © 2019 yanyu. All rights reserved.
//

#import "NavReplaceViewController.h"
#import "NavReplaceView.h"

#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight 44.0
#define kTopHeight (kStatusBarHeight + kNavBarHeight)

@interface NavReplaceViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)NavReplaceView *navView;
@end

@implementation NavReplaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.table];
    [self.view addSubview:self.navView];
    [self setBarButton];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //初始化侵入式 替换的导航栏视图
    self.navView.isFrist = YES;
    [self.navView onFristInitAlaph];
}
#pragma mark -view
-(UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc]initWithFrame:CGRectMake(0, kTopHeight, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _table.delegate =self;
        _table.dataSource = self;
        [_table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ListCell"];
    }
    return _table;
}
-(NavReplaceView *)navView{
    if (!_navView) {
        _navView = [[NavReplaceView alloc]initWithFrame:CGRectZero];
        _navView.viewConroller = self; //必须传
        _navView.nav_color = [UIColor orangeColor];
    }
    return _navView;
}
#pragma mark-method
-(void)setBarButton {
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(0, 0, 30, 30);
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    self.navView.navigationItem.leftBarButtonItem = rightItem;
    [backBtn addTarget:self action:@selector(backButtonTouch) forControlEvents:UIControlEventTouchUpInside];
}
-(void)backButtonTouch {
    NSLog(@"-----");
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark-UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * label_text = [NSString stringWithFormat:@"test & %ld",indexPath.row];
    cell.textLabel.text = label_text;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat margin = 150;
    [self.navView setupAlphaAtScrollView:scrollView withMargin:margin];
}
@end
