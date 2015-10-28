//
//  ViewController.swift
//  DD Character Sheet
//
//  Created by gustavo.freitas2 on 8/31/15.
//  Copyright (c) 2015 himynameisgustavo. All rights reserved.
//

import UIKit

class DDCharacterSheetViewController: UIViewController {
    
    var character: Character?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var classTextField: UITextField!
    @IBOutlet weak var raceTextField: UITextField!
    @IBOutlet weak var trendTextField: UITextField!
    @IBOutlet weak var divinityTextField: UITextField!
    @IBOutlet weak var levelTextField: UITextField!
    @IBOutlet weak var sizeTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var sexTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    let archivePath: String = {
        let documentsDirectories = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        
        let documentDirectory = documentsDirectories.first
        
        return (documentDirectory as! NSString).stringByAppendingPathComponent("character.archive")


    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let characterArchived = NSKeyedUnarchiver.unarchiveObjectWithFile(archivePath) as? Character {
            character = characterArchived
            
            nameTextField.text = character!.name
            classTextField.text = character!.classType
            raceTextField.text = character!.race
            trendTextField.text = character!.trend
            divinityTextField.text = character!.divinity
            levelTextField.text = character!.level != nil ? "\(character!.level)" : " "
            sizeTextField.text = character!.size != nil ? "\(character!.size)" : " "
            ageTextField.text = character!.age != nil ? "\(character!.age)" : " "
            sexTextField.text = character!.sex
            heightTextField.text = character!.height != nil ? "\(character?.height)" : " "
            weightTextField.text = character!.weight != nil ? "\(character?.weight)" : " "
            
        } else {
            character = Character()
        }
        
        let nc = NSNotificationCenter.defaultCenter()
        nc.addObserver(self, selector: "appDidEnterBackground:",
            name: UIApplicationDidEnterBackgroundNotification, object: nil)
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        saveChanges()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func appDidEnterBackground(note: NSNotification) {
        let sucess = saveChanges()
    
        if sucess {
            print("Character save")
        } else {
            print("Error")
        }
    }
    
    func saveChanges() -> Bool {
        character?.name = nameTextField.text
        character?.classType = classTextField.text
        character?.race = raceTextField.text
        character?.trend = trendTextField.text
        character?.divinity = divinityTextField.text
        let myInt: Int? = Int(levelTextField.text!)
        print(levelTextField.text! + " .. \(myInt)")
        character?.level = Int(levelTextField.text!)
        character?.size = Float(sizeTextField.text!)
        character?.age = Int(ageTextField.text!)
        character?.sex = sexTextField.text
        character?.height = Float(heightTextField.text!)
        character?.weight = Float(weightTextField.text!)
        
        if let char = character {
            return NSKeyedArchiver.archiveRootObject(char, toFile: archivePath)
        } else {
            return false
        }
        
    }

}

