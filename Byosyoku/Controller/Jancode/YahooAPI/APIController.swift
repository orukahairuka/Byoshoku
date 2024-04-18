//
//  APIController.swift
//  Byosyoku
//
//  Created by 櫻井絵理香 on 2024/04/17.
//

import Foundation
import Alamofire

func APIController(janCode: String,  completion: @escaping (Result<Welcome, Error>) -> Void){
    guard !janCode.isEmpty else {
            completion(.failure(NSError(domain: "APIController", code: 0, userInfo: [NSLocalizedDescriptionKey: "JAN code is empty"])))
            return
        }
    AF.request("https://shopping.yahooapis.jp/ShoppingWebService/V3/itemSearch?appid=dj00aiZpPTZhMmg2bUpCUWVIQyZzPWNvbnN1bWVyc2VjcmV0Jng9Mzc-&jan_code=\(janCode)&results=1").response { response in
        do {
            guard let data = response.data else {
                        completion(.failure(NSError(domain: "APIController", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data returned"])))
                        return
                    }
            let decoder = JSONDecoder()
            if let data = response.data {
                let welcome = try decoder.decode(Welcome.self, from: data)
                print("welocme: 🤩\(welcome)")
                completion(.success(welcome))
            }
        } catch {
            print(error.localizedDescription)
            completion(.failure(error))
        }
    }

}
