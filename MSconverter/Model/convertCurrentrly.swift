//
//  convertCurrentrly.swift
//  MSconverter
//
//  Created by Alexander Nazarov on 31.03.2021.
//

import Foundation

class convertCurrentrly: ViewController {
    
    var rubCurrency: [String] = []
    var rubCurrencyValue: [Double] = []
    var rub: Double?
    
   
    
    func convertCarrently() {
        guard let url = URL(string: "https://open.exchangerate-api.com/v6/latest") else { return }
        
        // Создаем сессию
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data,
                  let response = response
            else { return }
            do {
                let json = try JSONDecoder().decode(Rates.self, from: data)
                self.rubCurrency.append(contentsOf: json.rates.keys)
                self.rubCurrencyValue.append(contentsOf: json.rates.values)
                self.rub = json.rates["RUB"]
                
            } catch {
                print(error)
                print(response)
            }
        }.resume()
    }
}

