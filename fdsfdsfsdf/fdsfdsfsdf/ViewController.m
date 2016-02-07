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
#import "CustomClass2.h"
#import "Custom2TableViewCell.h"

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
    CustomClass2 *elem3 = [CustomClass2 new];
    elem3.titleClass = @" Hi this text have an imageView without problems with this height Hi this text have an imageView without problems with this height Hi this text have an imageView without problems with this height";
    elem3.imageV = [UIImage imageNamed:@"imageStack"];
    
    CustomClass2 *elem4 = [CustomClass2 new];
    elem4.titleClass = @"Hi this text have ";
    elem4.imageV = [UIImage imageNamed:@"imageStack"];
    
    CustomClas *elem5 = [CustomClas new];
    elem5.title = @"hola este título 2";
    elem5.descriptionText = @"If all your cells have the same height, double check that you’re setting estimatedRowHeight to a non-zero amount and rowHeight  to UITableViewAutomaticDimension.";

    
    _listOfElements = [[NSArray alloc] initWithObjects:eleme1 ,elem2,elem3,elem4,elem5, nil];
    [_tableView reloadData];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   return  _listOfElements.count;
}
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//cellIdentify
    static NSString *cellIdentify = @"cellIdentify";
    if([[_listOfElements objectAtIndex:indexPath.row] isKindOfClass:[CustomClas class]]){
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
    Custom2TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentify2"];
        if (!cell)
        {
            [tableView registerNib:[UINib nibWithNibName:@"Custom2TableViewCell" bundle:nil] forCellReuseIdentifier:@"cellIdentify2"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentify2"];
        }
        cell.labelText.text = [[_listOfElements objectAtIndex:indexPath.row] titleClass];
        cell.imageViewImage.image = [[_listOfElements objectAtIndex:indexPath.row] imageV];
    
    
    

    return cell;
}
@end
