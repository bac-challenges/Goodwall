//
//  Service.swift
//  GoodwallChallenge
//
//  Created by emile on 17/03/2022.
//

import Foundation
import RxCocoa
import RxSwift

final class Service {

    fileprivate lazy var requestObservable = RequestObservable()
    
    func get(_ endPoint: EndPoint) throws -> Observable<Data> {
        
        var request = URLRequest(url: endPoint.url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return requestObservable.get(request: request)
    }
}

final fileprivate class RequestObservable: URLSessionInjected {
    public func get(request: URLRequest) -> Observable<Data> {
        return Observable.create { observer in
            let task = self.urlSession.dataTask(with: request) { (data, response, error) in
                if let httpResponse = response as? HTTPURLResponse{
                    let statusCode = httpResponse.statusCode
                    let _data = data ?? Data()
                    if (200...399).contains(statusCode) {
                        observer.onNext(_data)
                    }
                    else {
                        observer.onError(error!)
                    }
                }
                
                observer.onCompleted()
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
