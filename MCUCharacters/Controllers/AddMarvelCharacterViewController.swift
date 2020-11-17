//
//  AddMarvelCharacterViewController.swift
//  MCUCharacters
//
//  Created by Himanshu Sonker on 16/11/20.
//  Copyright © 2020 mcu. All rights reserved.
//

import UIKit

protocol AddMarvelCharacterDelegate {
    func addMarvelCharacterViewControllerDidSave(character: MarvelCharacters, controller: UIViewController)
}

class AddMarvelCharacterViewController: UIViewController {

    var delegate: AddMarvelCharacterDelegate?
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldImageUrl: UITextField!
    @IBOutlet weak var textViewDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

    }
    
    private func setupUI() {
        self.title = "Add a Character"
        textViewDescription.layer.borderWidth = 1
        textViewDescription.layer.borderColor = UIColor.gray.cgColor
    
        
    }
    
    @IBAction func saveOption(_ sender: UIButton) {
        guard let name = textFieldName.text, !name.isEmpty else {
            alert(message: "Please add name")
            return
        }
        guard let imageUrl = textFieldImageUrl.text, !imageUrl.isEmpty else {
            alert(message: "Please add imageUrl")
            return
        }
        guard let description = textViewDescription.text, !description.isEmpty else {
            alert(message: "Please add description")
            return
        }
        
        let characterJson = "{\"name\": \"\(name)\", \"description\": \"\(description)\"}"
        let decoder = JSONDecoder()
        guard
            let data = characterJson.data(using: .utf8),
             let character = try? decoder.decode(MarvelCharacters.self, from: data)
        else {
             print("error in parsing json")
             return
        }
        
        if (delegate != nil) {
            delegate?.addMarvelCharacterViewControllerDidSave(character: character, controller: self)
        }
        
    }
    
}


