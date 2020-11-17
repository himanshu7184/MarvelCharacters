//
//  CharactersViewModel.swift
//  MCUCharacters
//
//  Created by Himanshu Sonker on 16/11/20.
//  Copyright © 2020 mcu. All rights reserved.
//

import Foundation

class CharactersListViewModel {
    var charactersViewModel = Array<MarvelCharacters>()

    init() {
        charactersViewModel = [MarvelCharacters]()
    }
}

extension CharactersListViewModel {
    
    func numberOfRowsInSection() -> Int {
        return charactersViewModel.count
    }
    
    func charactersViewModel(at index: Int) -> MarvelCharacters {
        return charactersViewModel[index]
    }
    
}
