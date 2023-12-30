//
//  SportData.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-27.
//

import Foundation

@Observable
class SportData {
    var sports: [Sport] = load("sportData.json")
}

func save<T: Encodable>(_ object: T) {
    do {
        let data = try JSONEncoder().encode(object)
        let url = getDocumentDirectory().appendingPathComponent("sportData.json")
        
        try data.write(to: url)
    } catch {
        print("Failed to save data.")
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    // load from local storage
    do {
        let url = getDocumentDirectory().appendingPathComponent("sportData.json")
        let data =  try Data(contentsOf: url)
        
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        print("Failed to load data from local storage")
        // load from json file
        return loadFromFile(filename)
    }
}

func loadFromFile<T: Decodable>(_ filename: String) -> T {
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    let data: Data
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

func getDocumentDirectory() -> URL {
    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return path[0]
}
