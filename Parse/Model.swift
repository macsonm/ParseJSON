//
//  Model.swift
//  Parse
//
//  Created by Maxim M on 30.01.2022.
//

import Foundation

struct Lesson: Decodable {  //подписываем на протокол Decodable
    
    // ключи в json файле должны совпадать со свойствами структуры. Если не нужны некоторые даннные с json, то не создаем свойство в структуре. Если в json может неоказаться нужного поля, то свойство задать optional f.e.: "let smth: Int?"
    let id: Int
    let name: String
    let date: Date          //если указываем вместо String > Date, то необходимо указать формат даты
    let imageLesson: String
    let link: String
    
    //если необходимо в приложении использовать другие названия, а не такие как в json: image > imageLesson
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case date
        case imageLesson = "image"  // "<nameInJSON>"
        case link
    
    }
    
}
