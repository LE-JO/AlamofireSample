//
//  AlamofireClient.swift
//  RefrigeratorStorage
//
//  Created by QMIT_iOS on 7/8/25.
//

import Foundation
import Alamofire

// MARK: 헤더 삽입
final class AuthorizationAdapter: RequestAdapter {
    
    /**
     * 통신 요청 전에 헤더 삽입
     */
    func adapt(_ urlRequest: URLRequest, for session: Alamofire.Session, completion: @escaping @Sendable (Result<URLRequest, any Error>) -> Void) {
        var request = urlRequest

        // 수정된 요청 반환
        completion(.success(request))
    }
}

// MARK: 네트워크 오류 시 재시도
final class NetworkErrorHandler: RequestRetrier, RequestInterceptor {
    
    // 최대 재시도 횟수
    private let maxRetryCount = 1
    
    // 재시도 로직
    func should(_ session: Session, retry request: Request, with error: Error, completion: @escaping (RetryResult) -> Void) {
        
        let response = request.task?.response as? HTTPURLResponse
        let statusCode = response?.statusCode
        
        if request.retryCount < maxRetryCount {
            switch (error as NSError).code {
            case NSURLErrorTimedOut:
                // 타임 아웃: 1초 후 재시도
                completion(.retryWithDelay(1.0))
            case NSURLErrorNotConnectedToInternet, NSURLErrorNetworkConnectionLost:
                // 네트워크 끊김: 즉시 재시도
                completion(.retry)
            default:
                // 기타 오류: 즉시 재시도
                completion(.retry)
            }
        } else {
            // 최대 재시도 횟수 초과: 재시도 안함
            completion(.doNotRetry)
        }
        
        // 추가로 특정 상태코드(401 등) 처리 가능
        if statusCode == 401 {
        }
    }
}

// MARK: Alamofire 네트워크 클라이언트
class AlamofireClient {
    
    static let shared = AlamofireClient()
    
    private let adapter: AuthorizationAdapter
    private let retrier: NetworkErrorHandler
    
    let session: Session
    
    private init() {
        adapter = AuthorizationAdapter()
        retrier = NetworkErrorHandler()
        
        let configuration = URLSessionConfiguration.default
        configuration.httpMaximumConnectionsPerHost = 20
        configuration.timeoutIntervalForRequest = NetworkManager.NETWORK_TIME_OUT
        configuration.timeoutIntervalForResource = NetworkManager.NETWORK_TIME_OUT
        configuration.requestCachePolicy = .reloadIgnoringCacheData // 캐시 사용 안함
        configuration.urlCache = nil // 캐시 완전 비활성화
        
        session = Session(configuration: configuration, interceptor: Interceptor(adapter: adapter, retrier: retrier))
    }
}
