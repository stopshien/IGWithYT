//
//  ViewController.swift
//  IGWithYT
//
//  Created by 沈庭鋒 on 2022/9/21.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        handelNotAuthenticated()

    }

    private func handelNotAuthenticated(){
        
        //本來是要連結Firebase去做連動信箱之類的做登入的設定，但我沒用，先跳過單純先做頁面排版的設計
        //原本要先設定if 沒有登入的話，顯示Login的VC，但是我們沒有連結登入系統，所以看有連結到後就可以先Comment掉不使用
        let loginVC = LoginViewController()
        
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: false)
        
        
    }
}

