//
//  ListViewModel.swift
//  GoodwallChallenge
//
//  Created by emile on 17/03/2022.
//

import Foundation
import RxCocoa
import RxSwift

final class ListViewModel: ServiceInjected, JSONDecoderInjected {
    
    let disposeBag = DisposeBag()
    
    func getItems() -> Observable<[Post]> {
        return Observable.create { observer in
            do {
                return try self.service.get(.items)
                    .decode(type: Result.self, decoder: self.jsonDecoder)
                    .subscribe(onNext: { result in
                        observer.onNext(result.response.payload.entries.map { $0.item })
                    })
            } catch {
                observer.onError(error)
            }
            
            observer.onCompleted()

            return Disposables.create()
        }
    }
}
