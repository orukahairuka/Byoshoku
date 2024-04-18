//
//  ResearchController.swift
//  Byosyoku
//
//  Created by 櫻井絵理香 on 2024/04/18.
//

import Foundation
import Alamofire

func ResearchController(query: String){

    AF.request("https://shopping.yahooapis.jp/ShoppingWebService/V3/itemSearch?appid=dj00aiZpPTZhMmg2bUpCUWVIQyZzPWNvbnN1bWVyc2VjcmV0Jng9Mzc-&query=\(query)").response { response in
        do {
            let decoder = JSONDecoder()
            if let data = response.data {
                let welcome = try decoder.decode(Welcome.self, from: data)
                print("welocme: 🤩\(welcome)")
            }
        } catch {
            print(error.localizedDescription)
        }
    }

}
