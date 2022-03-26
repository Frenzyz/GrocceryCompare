//
//  UnitAPI.swift
//  GrocceryCompare
//
//  Created by Aadit Chetan on 3/25/22.
//
import Foundation
import PromiseKit
import Alamofire

let headers = [
    "content-type": "application/x-www-form-urlencoded",
    "X-RapidAPI-Host": "community-neutrino-currency-conversion.p.rapidapi.com",
    "X-RapidAPI-Key": "a3261b211emshc9459f192ab334ep1400f8jsn0d308a64c9c6"
]

let postData = NSMutableData(data: "to-type=oz".data(using: String.Encoding.utf8)!)
postData.append("&from-type=lb".data(using: String.Encoding.utf8)!)
postData.append("&from-value=30".data(using: String.Encoding.utf8)!)

let request = NSMutableURLRequest(url: NSURL(string: "https://community-neutrino-currency-conversion.p.rapidapi.com/convert")! as URL,
                                        cachePolicy: .useProtocolCachePolicy,
                                    timeoutInterval: 10.0)
request.httpMethod = "POST"
request.allHTTPHeaderFields = headers
request.httpBody = postData as Data

let session = URLSession.shared
let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
    if (error != nil) {
        print(error)
    } else {
        let httpResponse = response as? HTTPURLResponse
        print(httpResponse)
    }
})

dataTask.resume()
