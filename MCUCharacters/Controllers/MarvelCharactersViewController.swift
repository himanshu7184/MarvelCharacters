//
//  MarvelCharactersViewController.swift
//  MCUCharacters
//
//  Created by Himanshu Sonker on 16/11/20.
//  Copyright © 2020 mcu. All rights reserved.
//

import UIKit

class MarvelCharactersViewController: UIViewController {

    let MARVEL_CELL_IDENTIFIER = "MarvelCharacters"
    var characterListViewModel = CharactersListViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

       //
        setupUI()
        tableView.delegate = self
        tableView.dataSource = self
        
        showMarvelCharacters(fileName: "marvelCharacters")
    }
    
    private func setupUI() {
        
        self.title = "Marvel Characters"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        tableView.estimatedRowHeight = 130
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(rightButtonAction(sender:))
        )
    }
    
    @objc func rightButtonAction(sender: UIBarButtonItem) {
        print("clicked")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddMarvelCharacterViewController") as! AddMarvelCharacterViewController
        vc.delegate = self
        
        //self.present(vc, animated: true, completion: nil)
        navigationController?.pushViewController(vc,
                                                 animated: true)
    }

    private func showMarvelCharacters(fileName: String){
       let decoder = JSONDecoder()
       guard
            let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let characters = try? decoder.decode([MarvelCharacters].self, from: data)
       else {
            print("error in parsing json")
            return
       }
        characterListViewModel.charactersViewModel.append(contentsOf: characters)
        tableView.reloadData()
        
    }
}

extension MarvelCharactersViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MARVEL_CELL_IDENTIFIER) as! CharactersTableViewCell
        let character = characterListViewModel.charactersViewModel(at: indexPath.row)
        cell.setCharacters(character: character)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            characterListViewModel.charactersViewModel.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

extension MarvelCharactersViewController: AddMarvelCharacterDelegate {
    func addMarvelCharacterViewControllerDidSave(character: MarvelCharacters, controller: UIViewController) {
        //controller.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
        
        characterListViewModel.charactersViewModel.append(character)
        self.tableView.insertRows(at: [IndexPath.init(row: characterListViewModel.charactersViewModel.count - 1, section: 0)], with: .automatic)
    }
    
    
}
