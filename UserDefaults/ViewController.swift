//
//  ViewController.swift
//  UserDefaults
//
//  Created by User on 19.06.2023.
//

import UIKit
import 

struct KeysDefaults {
    static let keyCity = "city"
    static let keyAdres = "adres"
    static let keyHouse = "house"
    static let keyCaseNumbar = "caseNumbar"
    static let keyApartmentNumber = "apartmentNumber"
    
}

class ViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    let cityTextField = UITextField()
    let adresTextFiel = UITextField()
    let houseNumberTextField = UITextField()
    let caseNumbarTextField = UITextField()
    let apartmentNumberTextField = UITextField()
    let nameLabel = UILabel()
    let saveButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpe()
        dispaySetupe()
        actionButton()
    }
    
    func setUpe() {
        view.addSubview(cityTextField)
        view.addSubview(adresTextFiel)
        view.addSubview(houseNumberTextField)
        view.addSubview(caseNumbarTextField)
        view.addSubview(apartmentNumberTextField)
        view.addSubview(nameLabel)
        view.addSubview(saveButton)
        
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
        }
        
        cityTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.top.equalTo(nameLabel.snp.bottom).offset(15)
        }
        
        adresTextFiel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.top.equalTo(cityTextField.snp.bottom).offset(15)
        }
        
        houseNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(adresTextFiel.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().inset(260)
        }
        
        caseNumbarTextField.snp.makeConstraints { make in
            make.left.equalTo(houseNumberTextField.snp.right).offset(15)
            make.right.equalToSuperview().inset(120)
            make.top.equalTo(adresTextFiel.snp.bottom).offset(15)
        }
        
        apartmentNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(adresTextFiel.snp.bottom).offset(15)
            make.left.equalTo(caseNumbarTextField.snp.right).offset(10)
            make.right.equalToSuperview().inset(10)
        }
        
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(apartmentNumberTextField.snp.bottom).offset(25)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().inset(40)
            make.height.equalTo(50)
        }
    }
        
        func dispaySetupe() {
            
            view.backgroundColor = .gray
            
            nameLabel.text = "Ведите ваши данные"
            nameLabel.textColor = .black
            
            cityTextField.placeholder = "Введите город"
            cityTextField.borderStyle = .roundedRect
            
            adresTextFiel.placeholder = "Введите улицу"
            adresTextFiel.borderStyle = .roundedRect
            
            houseNumberTextField.placeholder = "Дом"
            houseNumberTextField.borderStyle = .roundedRect
            
            caseNumbarTextField.placeholder = "Корпус"
            caseNumbarTextField.borderStyle = .roundedRect
            
            apartmentNumberTextField.placeholder = "Квартира"
            apartmentNumberTextField.borderStyle = .roundedRect
            
            saveButton.setTitle("СОХРАНИТЬ", for: .normal)
            saveButton.setTitleColor(.black, for: .normal)
            saveButton.backgroundColor = .white
            saveButton.layer.cornerRadius = 10
    }
    
    func actionButton() {
        saveButton.addTarget(self, action: #selector(actionSaveButton), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(openAdressVC), for: .touchUpInside)
    }
    
    
 
    @objc func actionSaveButton() {
        
        let city = cityTextField.text!
        let adres = adresTextFiel.text!
        let house = houseNumberTextField.text!
        let caseNumbar = caseNumbarTextField.text!
        let apartmentNumber = apartmentNumberTextField.text!
        
        if !city.isEmpty && !adres.isEmpty && !house.isEmpty && !apartmentNumber.isEmpty {
            
            Base.shared.saveAdres(city: city, adress: adres, house: house, caseNumbar: caseNumbar, apartmentNumber: apartmentNumber)
           
//            defaults.set(city, forKey: KeysDefaults.keyCity)
//            defaults.set(adres, forKey: KeysDefaults.keyAdres)
//            defaults.set(house, forKey: KeysDefaults.keyHouse)
//            defaults.set(caseNumbar, forKey: KeysDefaults.keyCaseNumbar)
//            defaults.set(apartmentNumber, forKey: KeysDefaults.keyApartmentNumber)
        
        }
    }
    @objc func openAdressVC() {
        let adressVC = AdressViewController()
        navigationController?.pushViewController(adressVC, animated: true)
    }
}
    

