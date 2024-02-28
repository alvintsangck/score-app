//
//  DataStorage.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-31.
//

import Foundation

func saveFavorite(_ isFavorite: Bool, id: Int) -> Void {
    let data = UserDefaults.standard.data(forKey: "preference")!
    var preferences = try? JSONDecoder().decode([SportPreference].self, from: data)
    if let index = preferences?.firstIndex(where: { $0.id == id }) {
        preferences?[index].isFavorite = isFavorite
    } else {
        preferences?.append(SportPreference(id: id, isFavorite: isFavorite, backgroundColor: ["#000000", "#000000"]))
    }
    let saveData = try? JSONEncoder().encode(preferences)
    UserDefaults.standard.set(saveData, forKey: "preference")
}

func saveBackgroundColor(_ hexColors: [String?], id: Int) -> Void {
    let data = UserDefaults.standard.data(forKey: "preference")!
    var preferences = try? JSONDecoder().decode([SportPreference].self, from: data)
    if let index = preferences?.firstIndex(where: { $0.id == id }) {
        preferences?[index].backgroundColor = hexColors.compactMap{ $0 }
    } else {
        preferences?.append(SportPreference(id: id, isFavorite: false, backgroundColor: hexColors.compactMap{ $0 }))
    }
    let saveData = try? JSONEncoder().encode(preferences)
    UserDefaults.standard.set(saveData, forKey: "preference")
}

func load(_ filename: String, key: String) -> [Sport] {
    var sports: [Sport] = loadFromFile(filename)
    guard let data = UserDefaults.standard.data(forKey: "preference") else { return sports }
    let preferences = try? JSONDecoder().decode([SportPreference].self, from: data)
    for i in 0..<sports.count {
        if let preference = preferences?.first(where: { $0.id == sports[i].id }) {
            sports[i].isFavorite = preference.isFavorite
            sports[i].backgroundColor = preference.backgroundColor
        }
    }
    
    return sports
}

func save<T: Encodable>(_ object: T, to: String) {
    do {
        let data = try JSONEncoder().encode(object)
        let url = getDocumentDirectory().appendingPathComponent(to)
        
        try data.write(to: url)
    } catch {
        print("Failed to save data.")
    }
}

func load<T: Decodable>(_ filename: String, from: String) -> T {
    // load from local storage
    do {
        let url = getDocumentDirectory().appendingPathComponent(from)
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
