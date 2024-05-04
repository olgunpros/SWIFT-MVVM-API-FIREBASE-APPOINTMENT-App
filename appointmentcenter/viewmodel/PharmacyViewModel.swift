
import Foundation
import RxSwift
import RxCocoa

class PharmacyViewModel {
    
    let pharmacy : PublishSubject<[Pharmacy]> =  PublishSubject()
    let error : PublishSubject<String> = PublishSubject()
    let loading : PublishSubject<Bool> = PublishSubject()
    
    func  requestData() {
        self.loading.onNext(true)
        let url = URL(string: "https://raw.githubusercontent.com/olgunpros/SWIFT-API-Oil-Prices-App/main/adad.json")!
        WebService().downloadCurrencies(url: url) { result in
            self.loading.onNext(false)
                switch result {
            case .success(let pharmacy):
                self.pharmacy.onNext(pharmacy)
                case .failure(let error):
                self.error.onNext("Error!")
                
            }
            
        }
    }
    
    
}
