//
//  Base.swift
//  UserDefaults
//
//  Created by User on 25.06.2023.
//

import Foundation

class Base {
    static let shared = Base()
    
    let defaults = UserDefaults.standard
    
    struct UserAdress: Codable {
        var city: String
        var adress: String
        var house: String
        var caseNumbar: String?
        var apartmentNumber: String
        
        var name:String {
            return "\(city), \(adress), \(house) \(caseNumbar ?? "") \(apartmentNumber)"
        }
    }
    private(set) var addres: [UserAdress] {
        
        get {
            if let data = defaults.value(forKey: "addres" ) as? Data {
                return try! PropertyListDecoder().decode([UserAdress].self, from: data)
            }else {
                return [UserAdress]()
            }
            
        }
        
        set {
            if let data =  try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: "addres") // Сохранение адресов
            }
        }
    }
    func saveAdres(city: String, adress: String, house: String, caseNumbar: String?, apartmentNumber: String ) {
        let adres = UserAdress(city: city, adress: adress, house: house, caseNumbar: caseNumbar, apartmentNumber: apartmentNumber )
        addres.insert(adres, at: 0 )
        
    }
}

