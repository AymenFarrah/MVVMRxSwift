//
//  VSC
//
//  Created by Farrah Aymen
//  Copyright © 2017 VSCT. All rights reserved.
//

// Controller
class VSLoginViewController: VSViewController {
    
    let disposeBag = DisposeBag()
    
    var viewModel: VSSigninViewModel

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var actionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBinding()
        configureServiceCallBacks()
    }
    
    private func configureBinding() {

        // binding
        emailTextField.bind(with: viewModel.emailFieldViewModel)
        passwordTextField.bind(with: viewModel.passwordFieldViewModel)
        
        actionButton.rx.tap
            .`do`(onNext:  { [unowned self] in
                self.emailTextField.resignFirstResponder()
                self.passwordTextField.resignFirstResponder()
            }).subscribe(onNext: { [unowned self] in
                if self.viewModel.validForm() {
                    self.viewModel.signin()
                }
            }).disposed(by: disposeBag)
    }
    
    private func configureServiceCallBacks() {
        
        // loading
        viewModel.isLoading
            .asDriver()
            .drive(actionButton.rx.isLoading)
            .disposed(by: disposeBag)
        
        // errors
        viewModel.errorMessage
            .asObservable()
            .filterNil()
            .bind { errorMessage in
                // Show error
                VSToastManager.showMessage(errorMessage)
            }.disposed(by: disposeBag)
        
        // success
        viewModel.isSuccess
            .asObservable()
            .filter { $0 }.bind { _ in
                // Show success
                let successMessage = "Login success!"
                VSToastManager.showMessage(successMessage)
            }.disposed(by: disposeBag)
    }
}


