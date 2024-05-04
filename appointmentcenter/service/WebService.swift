

import Foundation

enum PharmacyError : Error {
    case serverError
    case parsingError
}

class WebService {
    func downloadCurrencies(url: URL,completion: @escaping(Result<[Pharmacy],PharmacyError>) ->()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.serverError))
            }
            else if let data = data{
                if let cryptoList = try? JSONDecoder().decode([Pharmacy].self, from: data) {
                    completion(.success(cryptoList))
                }
                else {
                    completion(.failure(.parsingError))
                }
                
            }else {
                completion(.failure(.serverError))
            }
        }.resume()
    }
}

