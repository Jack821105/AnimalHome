//
//  ConfigModel.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/12.
//

import Foundation
import FirebaseRemoteConfig

/// Config模組
public protocol ConfigModelDelegate: class {
    
    /// 拉取遠端的Config成功
    ///
    /// - Parameter newConfig: 新的AppConfig
//    func didGetConfigSuccess(newConfig: AppConfig)
    
    /// 拉取Config發生錯誤
    /// - Parameters:
    ///   - error: error
    ///   - defaultConfig: 預設Config
//    func didGetConfigError(error: ConfigModel.Error, defaultConfig: AppConfig)
}

/// Config模組
public class ConfigModel{
    
    // MARK: - 一般成員 & 初始化
    
    static let shared = ConfigModel()
    
    /// 代理
    private weak var delegate: ConfigModelDelegate?
    
    private init() {}
    
    // MARK: - 公開方法
    
    /// 拉取並啟用AppConfig
    /// (呼叫時機：LaunchViewController的viewDidAppear方法內)
    ///
    /// - Parameter appId: appId
    public func fetchAndActivate(){
        
        // 舊寫法-無法使用
        // 原因:非同步設定Settings(https://github.com/firebase/firebase-ios-sdk/issues/4740)
        // let settings = RemoteConfigSettings()
        // settings.minimumFetchInterval = 0 // 0秒
        // remoteConfig.configSettings = settings
        // remoteConfig.fetchAndActivate{ ... }

        // 新寫法
        // fetch(withExpirationDuration:completionHandler:) 的用法
        // ExpirationDuration: 0 --> Force a fetch to the backend.
        // https://firebase.google.com/docs/reference/swift/firebaseremoteconfig/api/reference/Classes/RemoteConfig#fetchwithexpirationduration:completionhandler:
        
        // 無法 Reset activated remote config values，所以firebase壞掉或網路問題會用預設值或是上次的值(有取得過的話)
        // https://stackoverflow.com/questions/57300678/how-to-reset-activated-remote-config-values
        
        // 拉取並啟用AppConfig
        let remoteConfig = RemoteConfig.remoteConfig()
        remoteConfig.setDefaults(fromPlist: "RemoteConfigDefaults")
        remoteConfig.fetch(withExpirationDuration: 0) { [weak self] status, error in
            guard let self = self else { return }
            switch status{
            case .noFetchYet, .failure, .throttled:
                Logger.log("[Fetch Config Fail][Error]")
            case .success:
                Logger.log("[Fetch Config Success]")
                self.activateConfig(remoteConfig: remoteConfig)
            }
        }
    }
    
    /// 發動Config
    private func activateConfig(remoteConfig: RemoteConfig){
        remoteConfig.activate { [weak self] (_, _) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                Logger.log("[Activate Config Success]")
            }
        }
    }
    

    
    

}

