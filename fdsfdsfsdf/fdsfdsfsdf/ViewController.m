//
//  ViewController.m
//  fdsfdsfsdf
//
//  Created by Jose Pose Salgueiro on 26/1/16.
//  Copyright © 2016 Jose Pose Salgueiro. All rights reserved.
//

#import "ViewController.h"
#import "CustomizaTableViewCell.h"
#import "CustomClas.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *listOfElements;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadTableView];
    [self loadDataTableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) loadTableView{
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 80;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.tableView setNeedsLayout];
    [self.tableView layoutIfNeeded];
    
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0) ;// Status bar inset

}
-(void) loadDataTableView{

    CustomClas *eleme1 = [CustomClas new];
    eleme1.title = @" hola este título 1";
    eleme1.descriptionText = @"The important thing is to set up the cell so the vertical height is unambiguous. This way, the table view will be able to calculate the size of each cell.If all your cells have the same height, double check that you’re setting estimatedRowHeight to a non-zero amount and rowHeight  to UITableViewAutomaticDimension.If you’re still seeing wrongly sized rows, you probably have to call setNeedsLayout() and layoutIfNeeded() on the tableView object in the viewDidLoad() method.";

    CustomClas *elem2 = [CustomClas new];
    elem2.title = @"hola este título 2";
    elem2.descriptionText = @"If all your cells have the same height, double check that you’re setting estimatedRowHeight to a non-zero amount and rowHeight  to UITableViewAutomaticDimension.";

    _listOfElements = [[NSArray alloc] initWithObjects:eleme1 ,elem2, nil];
    [_tableView reloadData];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   return  _listOfElements.count;
}
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//cellIdentify
    static NSString *cellIdentify = @"cellIdentify";
    CustomizaTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (!cell)
    {
        [tableView registerNib:[UINib nibWithNibName:@"CustomizaTableViewCell" bundle:nil] forCellReuseIdentifier:cellIdentify];
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    }
    cell.labelBitText.text = [[_listOfElements objectAtIndex:indexPath.row] descriptionText];
    cell.labelSmallText.text = [[_listOfElements objectAtIndex:indexPath.row] title];

    return cell;
}
@end
