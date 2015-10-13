//
//  ViewController.swift
//  Times Table
//
//  Created by Nicolas Emery on 8/4/15.
//  Copyright © 2015 Nicolas Emery. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    
    @IBOutlet var table: UITableView!
    
    @IBAction func sliderMoved(sender: AnyObject)
    {
        // reload data makes the tableview funcs rerun and keeps the table value at 20 but gets the slider value and returns the new values into each cell
        table.reloadData()
        //print("\(sliderValue) \n");
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 20;
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    @available(iOS 2.0, *)
    // this function will run 20 times (b/c of above return value from tableview func. It then will add the times table of the slider at the time to each of the 20 cells
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell");
        // get the value of the slider and * 20 to get max value of table
        // table will go from (.005*20 = 1-20) to (1*20 = 20-400)
        let timesTable = Int(sliderValue.value * 20);
        // convert to a string (also do +1 to remove 0 from begining rows
        cell.textLabel?.text = String(timesTable * (indexPath.row + 1))
        return cell;
    }
    
    @IBOutlet var sliderValue: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

