//
//  movieTable.m
//  TabBarWithNav
//
//  Created by Sanzio on 20/09/15.
//  Copyright (c) 2015 Sanzio. All rights reserved.
//

#import "movieTable.h"
#import "TabBarWithNav-Swift.h"

@interface movieController ()

@end

@implementation movieController {
    NSArray *movieCell;
    NSArray *anteprimamovieCell;
    NSArray *selectMovie;
}

@synthesize segmentControl;
//@synthesize videoLIS;


//@synthesize tableView;
UITableView *tableView;

// 18 elementi = Diciasette Filmati

- (void)viewDidLoad {
    
    movieCell = [NSArray arrayWithObjects:@"prima_a", @"seconda_a", @"terza_a", @"quarta_a", nil];
    
    anteprimamovieCell = [NSArray arrayWithObjects:@"prima_a.jpg", @"seconda_a.jpg", @"terza_a.jpg", @"quarta_a.jpg", nil];
    
    selectMovie = [NSArray arrayWithObjects:@"prima_a", @"seconda_a", @"terza_a", @"quarta_a", nil];
    
    [super viewDidLoad];
    
    //immagine sul background
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"sfondo1334x750.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

/* - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
} */

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [movieCell count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *simpleTableIdentifier = @"vocemovieCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text=[movieCell objectAtIndex:indexPath.row];
    cell.imageView.image =[UIImage imageNamed:[anteprimamovieCell objectAtIndex:indexPath.row]];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"STANZE MUSEO";
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Metodo che segnala il nr riga toccata
    NSInteger _lastClickedRow;
    NSString *selectedFilm;
    
    
    NSInteger row = indexPath.row;

    
    _lastClickedRow = indexPath.row;
    
    //nr di cella toccata --> vado a selezionare il filmato.
    NSLog(@"%ld" , (long)_lastClickedRow);
    
    NSLog(@"%ld" , (long)row);
    
    selectedFilm=[selectMovie objectAtIndex:indexPath.row];
    NSLog(@"%@ in didSelectRowAtIndexPath" , selectedFilm);
    
    
    //Verifico STato della proprio UISegmentedControl
    if (self.segmentControl.selectedSegmentIndex==0)
    {
        [self performSegueWithIdentifier:@"segueVideo" sender:selectedFilm];
    }
    else
    {
        [self performSegueWithIdentifier:@"segueTesto" sender:selectedFilm];
    }

    
 //   [self performSegueWithIdentifier:@"segueVideo" sender:selectedFilm];

//    Mi restituisce la RIGA
//    [self performSegueWithIdentifier:@"segueVideo" sender:indexPath];

    
    //[myMovie moviePlayer:selectedMovie];
    
    //[myMovie playVideo:_lastClickedRow];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 */

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"%@" , @"effettuato Segue");
    NSString *selectedFilm;
    
    selectedFilm=sender;
    
    if ([segue.identifier isEqualToString:@"segueVideo"]) {
        
        // 1-NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        playMovieSwift *destViewController = segue.destinationViewController;

        // Mi ha dato l'indice
        // 1-NSInteger cellRow = [(NSIndexPath *)sender row];
        // 1-NSLog(@"Selected: %d",cellRow);

        // 1-NSInteger selectedIndex = [[self.tableView indexPathForSelectedRow] row];
        // 1-NSLog(@"Selected Index: %d",selectedIndex);

        // 1-selectedFilm = [selectMovie objectAtIndex:indexPath.row];
        NSLog(@"%@ in Segue" , selectedFilm);
        [destViewController playVideo:selectedFilm];
        
    }
    if ([segue.identifier isEqualToString:@"segueTesto"]) {
        
        NSLog(@"%@ in segueTesto" , selectedFilm);
        TextControllerSwift *destViewController = segue.destinationViewController;
        //        TextController *destViewController = segue.destinationViewController;
        [destViewController playText:selectedFilm];
        //        [destViewController viewDidLoad];
        
    }
}

-(IBAction) segmentedControlChanged{
    
    switch (segmentControl.selectedSegmentIndex) {
        case 0:
            NSLog(@"VIDEO Selected");
            
            break;
        case 1:
            
            NSLog(@"TESTO Selected");
            
            break;
        default:
            break;
            //proviamo la strada delle Notifiche
    }
}



@end
