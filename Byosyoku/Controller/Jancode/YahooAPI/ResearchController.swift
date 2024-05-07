//
//  ResearchController.swift
//  Byosyoku
//
//  Created by 櫻井絵理香 on 2024/04/18.
//

import Foundation
import Alamofire

func ResearchController(query: String, completion: @escaping (Result<Welcome, Error>) -> Void) {
    let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    let urlString = "https://shopping.yahooapis.jp/ShoppingWebService/V3/itemSearch?appid=dj00aiZpPTZhMmg2bUpCUWVIQyZzPWNvbnN1bWVyc2VjcmV0Jng9Mzc-&query=\(encodedQuery)&results=10"

    AF.request(urlString).responseDecodable(of: Welcome.self) { response in
        switch response.result {
        case .success(let welcome):
            completion(.success(welcome))
        case .failure(let error):
            print("Error: \(error)")
            print("Response data: \(String(data: response.data ?? Data(), encoding: .utf8) ?? "")")
            completion(.failure(error))
        }
    }
}
