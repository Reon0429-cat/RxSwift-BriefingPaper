//
//  ViewController.swift
//  RxSwift-BriefingPaper-Sample
//
//  Created by 大西玲音 on 2021/12/05.
//

import UIKit
import RxSwift
import RxCocoa

// 二つのテキストフィールドに値が入力されていれば、
// ログインボタンをタップできるようにする

enum APIError: Error {
    case invalidURL
}

final class ViewController: UIViewController {
        
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
        
    }
    
    private func setupBindings() {
        
        let observable = Observable<String>.create { observer in
            observer.onNext(element)
            observer.onCompleted()
            return Disposables.create()
        }
        
        let observable = Observable<String>.of("re")
        
        
        observable
            .subscribe(onNext: { text in
                print("DEBUG_PRINT: ", text)
            }, onError: { error in
                print("DEBUG_PRINT: ", error)
                // alert
            }, onCompleted: {
                print("DEBUG_PRINT: ", "完了")
            })
            .disposed(by: disposeBag)
        
        
        Observable
            .combineLatest(
                emailTextField.rx.text.orEmpty, // ストリーム1
                passwordTextField.rx.text.orEmpty // ストリーム2
            )
            .map { [$0, $1].allSatisfy { !$0.isEmpty } }
            .subscribe(onNext: changeLoginButtonState(isEnabled:))
            .disposed(by: disposeBag)
        
        loginButton.rx.tap
            .subscribe(onNext: {
                print("DEBUG_PRINT: ", "ボタンが押されました")
            })
            .disposed(by: disposeBag)
    }
    
    private func changeLoginButtonState(isEnabled: Bool) {
        loginButton.isEnabled = isEnabled
        loginButton.backgroundColor = isEnabled ? .red : .gray
    }

}
