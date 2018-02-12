# PercentView
A view that shows percentage.

# Usage
~~~
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.percentView = [[PercentView alloc] init];
    self.percentView.bounds = CGRectMake(0, 0, 300, 300);
    self.percentView.center = self.view.center;
    self.percentView.totalValue = 1000;
    self.percentView.differentValue = 100;
    [self.view addSubview:self.percentView];
    
}

- (IBAction)subClick:(id)sender
{
    self.percentView.differentValue = -100;
}

- (IBAction)addClick:(id)sender
{
    self.percentView.differentValue = +100;
}
~~~

# Demonstrate
![Alt text](https://github.com/ProgrammerLZ/GitHub/blob/master/Image/PercentView.png)
