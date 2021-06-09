//
//  AddLocationViewModel.swift
//  Assignment
//

import Foundation

class AddLocationViewModel  {
    
    private let addLocationViewModel: AddLocationViewModel
    
    init(addLocationViewModel: AddLocationViewModel) {
        self.addLocationViewModel = addLocationViewModel
    }
    
    func savelocation(location:Cordinates) {
        LocationSingleton.locations.append(location)
    }
    
    func getLocations(location:Cordinates) -> [Cordinates] {
        return LocationSingleton.locations
    }
}
