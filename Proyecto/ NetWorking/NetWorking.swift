
import Foundation
import Alamofire

final class Cards: Codable {
    var name        : String?
    var attack      : Int?
    var id          : String?
    var cost        : Int?
    var health      : Int?
    var cardClass   : String?
    var type        : String?
    var text        : String?
    
enum CodingKeys: String, CodingKey {
    case name        = "name"
    case attack      = "attack"
    case id          = "id"
    case cost        = "cost"
    case health      = "health"
    case cardClass   = "cardClass"
    case type        = "type"
    case text        = "text"
    }
}

enum NetworkingManager {
    enum NetworkingError : Error {
        case parsingError
    }
    
    static func getCards(completion: @escaping (Result<[Cards], Error>) -> Void) {
        let request = AF.request (
            "https://api.hearthstonejson.com/v1/25770/enUS/cards.collectible.json",
            method: HTTPMethod.get
            )
        
        request.responseData { (response: AFDataResponse<Data>) in
            guard let data = response.data else {
                completion (.failure(NetworkingError.parsingError))
                return
            }
            
            let decoder = JSONDecoder()
            let cards = try? decoder.decode([Cards].self, from: data)
            
            completion(.success(cards ?? []))
        }
    }
}
