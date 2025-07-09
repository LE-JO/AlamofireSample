# Combine + Alamofire 통신

##Combine 프레임워크와 Alamofire를 활용하여 비동기 네트워크 통신을 구조적으로 처리.

# 폴더 구조

##Clean Architecture + MVVM 기반으로 기본 설계

<pre lang="no-highlight"><code> ```
RefrigeratorStorage/
├── Data/                       # 데이터 계층 (API, DTO, 저장소 구현 등)
│   ├── DTOs/                  # 서버 응답 모델 (Decodable 등)
│   └── Repositories/          # Repository 구현체 (도메인 인터페이스 구현)
│
├── Domain/                    # 도메인 계층 (비즈니스 로직)
│   └── UseCases/              # 유스케이스 - 핵심 비즈니스 규칙을 수행
│
├── Network/                   # 네트워크 계층
│   ├── API/                  # API 요청 정의 (Endpoint, Parameters 등)
│   └── Client/               # Alamofire 설정, Interceptor, Session 관리
│
├── Presentation/              # UI 계층 (View, ViewModel 등)
│   ├── Scenes/               # 화면 단위 구성 (ViewController 또는 SwiftUI View)
│   └── ViewModels/           # MVVM의 ViewModel - 상태 및 UI 로직 처리
│
├── Utilities/                 # 공통 유틸리티 계층
│   └── Extensions/           # 타입 확장 (String, Date 등 공통 확장)
│
└── Resources/                 # 앱 리소스
    └── Assets.xcassets/      # 이미지, 컬러 등 정적 리소스
``` </code></pre>


<pre lang="no-highlight"><code> ``` RefrigeratorStorage/ ├── Data/ # 데이터 계층 (API, DTO, 저장소 구현 등) │ ├── DTOs/ # 서버 응답 모델 (Decodable 등) │ └── Repositories/ # Repository 구현체 (도메인 인터페이스 구현) │ ├── Domain/ # 도메인 계층 (비즈니스 로직) │ └── UseCases/ # 유스케이스 - 핵심 비즈니스 규칙을 수행 │ ├── Network/ # 네트워크 계층 │ ├── API/ # API 요청 정의 (Endpoint, Parameters 등) │ └── Client/ # Alamofire 설정, Interceptor, Session 관리 │ ├── Presentation/ # UI 계층 (View, ViewModel 등) │ ├── Scenes/ # 화면 단위 구성 (ViewController 또는 SwiftUI View) │ └── ViewModels/ # MVVM의 ViewModel - 상태 및 UI 로직 처리 │ ├── Utilities/ # 공통 유틸리티 계층 │ └── Extensions/ # 타입 확장 (String, Date 등 공통 확장) │ └── Resources/ # 앱 리소스 └── Assets.xcassets/ # 이미지, 컬러 등 정적 리소스 ``` </code></pre>
