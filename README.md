# AnimalHome

### 建置環境

Xcode 13以上
CocoaPods
Swift 5

-----

### 專案架構: MVC(大部分)

M: 大部分是資料處理中心
V: View 呈現資料 或是部分單獨的元件
C: 負責M與V的溝通 通常大多寫在這

-----

### UI元件: ViewController> Storyboard, View> xib

大部分自製元間使用UIView搭配同名xib的做法
ViewController通常會搭配一個同名的Storyboard使用

-----

### CodeStyle

(X)  lblStockName: UILabel!
(O) stockNameLabel: UILabel!

(X)  btnSecretBrokerName: UIButton!
(O) secretBrokerNameBtn: UIButton!

-----

### 第三方管理工具套件: CocoaPods

-----

### 已使用的三方套件

```
 # 分析
  pod 'Firebase/Analytics'
  
  # 雲消息
  pod 'Firebase/Messaging'

  # 崩潰報告
  pod 'Firebase/Crashlytics'

  # 動態鏈接
  pod 'Firebase/DynamicLinks'

  # 應用內消息
  pod 'Firebase/InAppMessaging'

  # 性能監控
  pod 'Firebase/Performance'

  # 網路協定
  pod 'Alamofire', '~> 5.5'

  # 下載圖片
  pod 'SDWebImage', '~> 5.0'

  # 靜態檢查codestyle
  pod 'SwiftLint'

  # make Auto Layout easy
  pod 'SnapKit', '~> 5.0.0'

```
-----  
