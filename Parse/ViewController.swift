import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://icodeschool.ru/json1.php"
        guard let url = URL(string: urlString) else { return }      //получваем url с json
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                print(error)
            }
            
            guard let data = data else { return }
            
//            let jsonString = String(data: data, encoding: .utf8) //выводим полученный json
//            print(jsonString)
        
// MARK: -  читаем полученные данные json и приводим к понятному виду (распарсить)
            do {
                let decoder = JSONDecoder()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"     //указываем нужный формат для 2020-10-25 12:34:00 (если в Model задаем Date вместо String
                
                decoder.dateDecodingStrategy = .formatted(dateFormatter)        //парсим правильный формат
                
                let lessons = try decoder.decode([Lesson].self, from: data)       // в type: задаем шаблон того что мы парсим, чтобы swift понимал, что лежит в этом json и правильно распарсил. Шаблон для парсинга задаем в файле Model
                print(lessons.first?.date)      //обращаемся к необходимым данным и выводим их
            } catch {
                print(error)
            }
        } .resume()     //запуск запроса
        
    }
    
    
}

