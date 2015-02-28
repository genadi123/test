//
//  DetailViewController.swift
//  Food
//
//  Created by robert on 2/27/15.
//  Copyright (c) 2015 Genadi Betsuashvili. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
//    var foodImage : String!
//    var foodName : String!
    var food : FoodEntity!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain,
            target: nil, action: nil)
        //title = self.foodName
        title = self.food.name
        
        // Do any additional setup after loading the view.
        
        self.foodImageView.image = UIImage(data: food.image)
        self.nameLabel.text = food.name
        //        self.foodImageView.image = UIImage(named: foodImage)
        //        self.nameLabel.text = foodName  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
