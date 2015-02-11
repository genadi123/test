//
//  ViewController.swift
//  ImagePicker 1
//
//  Created by robert on 2/11/15.
//  Copyright (c) 2015 Genadi Betsuashvili. All rights reserved.
//

import UIKit
import AssetsLibrary
import CoreLocation
import AddressBookUI

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var myImageView: UIImageView!
    
    let picker = UIImagePickerController()
    
    @IBAction func photofromLibrary(sender: AnyObject) {
        picker.allowsEditing = false
        picker.sourceType = .PhotoLibrary
        presentViewController(picker, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        picker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        var chosenImage = info[UIImagePickerControllerOriginalImage] as UIImage
        myImageView.contentMode = .ScaleAspectFit
        myImageView.image = chosenImage
        //chosenImage.description
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    //   Get the city and region where the photo was taken.    
    
    /*
    
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: NSDictionary!){
        let library = ALAssetsLibrary()
        let URL: AnyObject? = info["UIImagePickerControllerReferenceURL"]
        var error: NSError?
        library.assetForURL(URL as NSURL, resultBlock: { (asset) -> Void in
            let location = asset.valueForProperty(ALAssetPropertyLocation) as? CLLocation
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(location!) { (data, error) -> Void in
                let address = data[0].addressDictionary!
                let city = address[kABPersonAddressCityKey] as  NSString!
                let state = address[kABPersonAddressStateKey] as  NSString!
                println(city, state)
            }
            }) { (error) -> Void in
                println(error)
        }
    }

    */
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}

