//
//  FetchDataViewModel.swift
//  Nasa
//
//  Created by user on 2024/5/9.
//

import Foundation
import Combine

class FetchDataViewModel {
    public let dataSubject = CurrentValueSubject<NasaData?, Never>(nil)
    
    public func fetchData() {
        guard let url = URL(string: "https://raw.githubusercontent.com/cmmobile/NasaDataSet/main/apod.json")
        else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let nasaData = try JSONDecoder().decode(NasaData.self, from: data)
//                print("title: \(nasaData[0].title)")
                self.dataSubject.send(nasaData)
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        
        task.resume()
    }
}

