# NavReplaceViewDemo
这一个根据scrollView渐变的侵入试的类似导航栏的视图，不影响上一级或者下一级控制器的系统的nav，本质就是一个隐藏系统的nav，自己自定义个navView。这个navView 要加载在ViewController 的最后，也就是最上面，替换系统的。
用法如下：

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
## 初始化时scrollView 会自己滚动一下让视图会改变一点alpha的情况
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
## 这个两个属性的用法和系统的处理一样
```
@property (nonatomic,strong)UINavigationBar * navBar;
@property (nonatomic,strong)UINavigationItem * navigationItem;
```
如：加左右按钮。
```
UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
self.navView.navigationItem.leftBarButtonItem = rightItem;
[backBtn addTarget:self action:@selector(backButtonTouch) forControlEvents:UIControlEventTouchUpInside];
```
如:标题
```
self.navView.navigationItem.title =@"";
```
## 效果图
![image](https://github.com/LikeOrchid/NavReplaceViewDemo/blob/master/NavReplaceViewDemo/NavReplaceViewDemo/Untitled.gif)
