//
//  ViewController.m
//  XZUtilsKitDemo
//
//  Created by yanyu on 2019/4/12.
//  Copyright © 2019 yanyu. All rights reserved.
//

#import "ViewController.h"
#import "NavReplaceViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)NSArray *titles;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.table];
}
#pragma mark -view
-(UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _table.delegate =self;
        _table.dataSource = self;
        [_table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ListCell"];
    }
    return _table;
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
    NSString * label_text = [NSString stringWithFormat:@"testDemo & %ld",indexPath.row];
    cell.textLabel.text = label_text;
    
    if (indexPath.row ==0) {
        cell.textLabel.text = self.titles[indexPath.row];
    }
}

#pragma mark-UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        NavReplaceViewController * nav_view = [[NavReplaceViewController alloc]init];
        [self.navigationController pushViewController:nav_view animated:YES];
    }
}
#pragma mark -data
-(NSArray *)titles{
    if (!_titles) {
        _titles = @[@"NavReplaceView"];
    }
    return _titles;
}
@end

