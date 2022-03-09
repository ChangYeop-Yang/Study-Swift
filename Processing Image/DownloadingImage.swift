/*
 * Copyright (c) 2022 양창엽. All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit
import Alamofire
import Foundation

/**
    - Date: `2022.01.23. 12:51`
    - Version: `[Lasted] 1.0.0.0`
 
    - NOTE: `DownloadingImage`
    - Authors: `ChangYeop-Yang`
    - Copyright: `Copyright (c) 2021 양창엽. All rights reserved.`
*/
class DownloadingImage: NSObject {
    
    // MARK: - Object Properties
    internal static let shared = DownloadingImage()
    
    // MARK: - Initalize
    private override init() { super.init() }
}

// MARK: - Internal Extension DownloadImage
internal extension DownloadingImage {
    
    /**
        - NOTE: Required Using `DispatchQueue.global`
     */
    final func load(convertibleURL: String,
                    method: HTTPMethod,
                    headers: HTTPHeaders?,
                    completion: @escaping DICompletion) {
        
        // 입력받은 주소가 유효한 주소인지 확인합니다.
        guard let url = NSURL(string: convertibleURL) else {
            completion(nil, .invalidURL(url: convertibleURL))
            return
        }
        
        // 이전의 Cache 작업이 이루어져 존재하는 경우에는 해당 이미지를 전달합니다.
        if let image = CachingImage.shared.getCacheImage(url: url) {
            DispatchQueue.main.async { completion(image, nil) }
            return
        }

        AF.request(convertibleURL, method: method, headers: headers).responseData { response in
            
            switch response.result {
            case .success(let result):
                // 서버로 부터 전달받은 Data 값이 빈 값 여부를 확인합니다.
                if result.isEmpty {
                    completion(nil, .responseSerializationFailed(reason: .inputDataNilOrZeroLength))
                    return
                }
         
                // 전달받은 Data 값이 Image 형태의 Data 인지를 확인합니다.
                guard let image = UIImage(data: result) else {
                    completion(nil, .responseSerializationFailed(reason: .inputFileNil))
                    return
                }
                
                // Image에 대하여 Cache 작업을 수행합니다.
                DispatchQueue.global(qos: .background).async {
                    CachingImage.shared.cachingImage(url: url, image: image)
                }
                
                DispatchQueue.main.async {
                    let result = ImageModel(image: image, url: url)
                    completion(result, nil)
                }
            case .failure(let error):
                NSLog("%@", error.localizedDescription)
                completion(nil, error)
            }
        }
    }
}
