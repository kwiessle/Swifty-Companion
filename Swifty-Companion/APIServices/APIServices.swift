//
//  File.swift
//  Swifty-Companion
//
//  Created by Kiefer Wiessler on 02/05/2018.
//  Copyright © 2018 Kiefer Wiessler. All rights reserved.
//

import Foundation



struct Token : Decodable {
    var key : String?
    var type : String?
    
    private enum CodingKeys : String, CodingKey {
        case key = "access_token"
        case type = "token_type"
    }
}



final class APIServices {
    
    let host = "https://api.intra.42.fr"
    let uid = "751629062c2979c38979d17b7be7b70706fbc76d26649072369d428ee9123886"
    let secret = "d11ddef83892d33cb3b1ed9eba5a73b8236a708f0bd22317176072792f442208"
    var token : Token?
    static var shared = APIServices()
    
 
    func createRequest(for route: String) -> URLRequest? {
        guard let url = URL(string: "\(host)\(route)") else { return nil }
        guard let token = token?.key else { return nil }
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        return request
    }
    
    func getToken(completion: @escaping(Bool) -> Void) {
        guard let url = URL(string: "\(host)/oauth/token") else {  completion(false); return }
        
        let body = "grant_type=client_credentials&client_id=\(uid)&client_secret=\(secret)"
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body.data(using: .utf8)
        
        RequestService.shared.get(req: request, for: Token.self) { data in
            self.token = data
//            self.getCatalog()
            completion(true)
        }
    }
    

 
    
}
