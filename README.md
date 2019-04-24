# NavReplaceViewDemo
这一个侵入试的类似导航栏的视图。用法如下：

## 初始化
```
-(NavReplaceView *)navView{
    if (!_navView) {
        _navView = [[NavReplaceView alloc]initWithFrame:CGRectZero];
        _navView.viewConroller = self; //必须传
        _navView.nav_color = [UIColor orangeColor];
    }
    return _navView;
}
```
## 跳转scrollView 会自己滚动一下让视图会改变一点alpha的情况
```
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //初始化侵入式 替换的导航栏视图
    self.navView.isFrist = YES;
    [self.navView onFristInitAlaph];
}
```
## 这个navView 会在 margin 距离类alpha 0~1变化
```
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat margin = 150;
    [self.navView setupAlphaAtScrollView:scrollView withMargin:margin];
}
```
