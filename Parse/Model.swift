import Foundation

struct Lesson: Decodable {  //подписываем на протокол Decodable
    
    // ключи в json файле должны совпадать со свойствами структуры. Если не нужны некоторые даннные с json, то не создаем свойство в структуре. Если в json может неоказаться нужного поля, то свойство задать optional f.e.: "let smth: Int?"
    let id: Int
    let name: String
    let date: Date          //если указываем вместо String > Date, то необходимо указать формат даты
    let imageLesson: String
    let link: String
    let comments: [Comment]?    // содержит вложенные ключи
    
    enum CodingKeys: String, CodingKey {        //если необходимо в приложении использовать другие названия, а не такие как в json: image > imageLesson, то вносим изменения в протоколе Decodable
        case id
        case name
        case date
        case imageLesson = "image"  // "<nameInJSON>"
        case link
        case comments
    }
    
// MARK: - описываем вложенные ключи(поддомен) ключа "comments"(домен) из JSON
    struct Comment: Decodable {    //домен с поддоменами в json
        let id: Int
        let text: String
        let date: Date
        let user: User             //поддомен User содержит в себе еще поддомены(вложенные ключи), описанные в struct User
    }
    
    struct User: Decodable {        //создаем еще одну структуру User для вложенных ключей в поддомене "User" домена "comments" JSON
        let id: Int
        let name: String
        let gender: Gender
    }
    
    enum Gender: String, Decodable {
        case male
        case female
    }
    
}
