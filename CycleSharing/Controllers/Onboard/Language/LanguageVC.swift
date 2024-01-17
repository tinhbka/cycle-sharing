//
//  LanguageVC.swift
//  GPSTracker
//
//  Created by Tinh Vu on 3/29/23.
//  Copyright © 2023 Tinh Vu. All rights reserved.
//

import UIKit
import RswiftResources

enum LanguageType: String {
    case eng = "en"
    case china = "zh-Hans"
    case hindi = "hi"
    case france = "fr"
    case germany = "de"
    case indo = "id"
    case portuga = "pt-PT"
    case spain = "es"
    
    var flagIcon: RswiftResources.ImageResource {
        switch self {
        case .china:
            return R.image.ic_china
        case .eng:
            return R.image.ic_eng
        case .hindi:
            return R.image.ic_hindi
        case .france:
            return R.image.ic_fra
        case .germany:
            return R.image.ic_ger
        case .portuga:
            return R.image.ic_port
        case .indo:
            return R.image.ic_indo
        case .spain:
            return R.image.ic_spain
        
        }
    }
    
    var name: String {
        switch self {
        case .china:
            return "China"
        case .eng:
            return "English"
        case .hindi:
            return "Hindi"
        case .france:
            return "French"
        case .germany:
            return "German"
        case .portuga:
            return "Portuguese"
        case .indo:
            return "Indonesia"
        case .spain:
            return "Spanish"
        
        }
    }
}

class LanguageManager {
    static let shared = LanguageManager()
    
    func getLanguage() -> LanguageType {
        guard let lang = UserDefaults.standard.string(forKey: Constant.CurrentLocalization) else {
            UserDefaults.standard.set(LanguageType.eng.rawValue, forKey: Constant.CurrentLocalization)
            UserDefaults.standard.synchronize()
            return .eng
        }
        return LanguageType(rawValue: lang) ?? .eng
    }
    
    func setLanguage(_ language: LanguageType){
        UserDefaults.standard.set(language.rawValue, forKey: Constant.CurrentLocalization)
        UserDefaults.standard.synchronize()
    }
}

class LanguageVC: BaseVC {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewAdsNative: UIView!
    @IBOutlet weak var viewAds: UIView!

    private let items: [LanguageType] = [.eng, .china, .spain, .france, .portuga, .hindi, .germany, .indo]
    private var selected: LanguageType = .eng
    
    private let onStart: Bool
    
    init(_ onStart: Bool = false) {
        self.onStart = onStart
        super.init(nibName: LanguageVC.className, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selected = LanguageManager.shared.getLanguage()

        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.registerNib(LanguageCell.self)
        
        navigationItem.title = Text.shared.language.tableName
        
        if onStart {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_done"), style: .plain, target: self, action: #selector(onNext))
            
        }

//        initAds()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

//    private func initAds() {
//        if  ConfigRemoteManager.shared.isShowAds(.native_language) {
//            viewAds.isHidden = false
//            AdMobManager.shared.addAdNative(unitId: AdUnitManager.shared.unit?.native_language ?? "", rootVC: self, view: viewAdsNative, type: .unified)
//            AdMobManager.shared.blockNativeFaild = { [weak self] id in
//                if id == AdUnitManager.shared.unit?.native_language ?? "" {
//                    self?.viewAds.isHidden = true
//                }
//            }
//        } else {
//            viewAds.isHidden = true
//        }
//    }

    @objc private func onNext() {
        UserDefaults.standard.set(true, forKey: Constant.firstimeLanguage)
//        AppDelegate.shared.showIntro()
    }

    private func changeLanguage(_ language: LanguageType) {
        if language == selected {
            return
        }
        
        selected = language
        LanguageManager.shared.setLanguage(language)
        
        if onStart {
            tableView.reloadData()
        } else {
//            AppDelegate.shared.showHome()
        }
    }
}

extension LanguageVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cell: LanguageCell.self, at: indexPath)
        cell.fill(items[indexPath.row], selected: items[indexPath.row] == selected)
        
        cell.selectHandler = { [weak self] language in
            guard let language = language else {
                return
            }
            self?.changeLanguage(language)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    
}
