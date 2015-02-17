//
//  DetailViewController.swift
//  Photos
//
//  Created by robert on 2/14/15.
//  Copyright (c) 2015 Genadi Betsuashvili. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var photoImageView:UIImageView!
    var photo : Photo!
    var photoImage:String!
    
    @IBOutlet weak var buttonImage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //self.photoImageView.image = UIImage(named: photoImage)
        //self.photoImageView.image = UIImage(named: photo.image)
        self.photoImageView.image = UIImage(data: photo.image)
        self.buttonImage.imageView?.image  = UIImage(data: photo.image)
        title = self.photo.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->
        UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
                as DetailTableViewCell
            // Configure the cell...
            switch indexPath.row {
            case 0:
                cell.fieldLabel.text = "Name"
                cell.valueLabel.text = photo.name
            case 1:
                cell.fieldLabel.text = "Time"
                cell.valueLabel.text = photo.time
            case 2:
                cell.fieldLabel.text = "Location"
                cell.valueLabel.text = photo.location
            default:
                cell.fieldLabel.text = ""
                cell.valueLabel.text = ""
            }
            return cell
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "showPhoto" {
                let destinationController = segue.destinationViewController as ImageViewController
                destinationController.image = photo.name 
           
        }
    }
    
    var imigeView : ImageViewController!
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
