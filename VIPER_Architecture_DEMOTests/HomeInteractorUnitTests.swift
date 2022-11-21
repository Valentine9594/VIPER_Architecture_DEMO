//
//  HomeInteractorUnitTests.swift
//  VIPER_Architecture_DEMOTests
//
//  Created by Apple on 17/11/22.
//

import XCTest
@testable import VIPER_Architecture_DEMO

final class HomeInteractorUnitTests: XCTestCase {
    
    var sut: HomeInteractor?
    var sutOutput: HomePresenter?
    
    override func setUp() {
        sut = HomeInteractor()
        sutOutput = HomePresenter()
        
        sut?.presenter = sutOutput
        
        
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        sutOutput = nil
        super.tearDown()
    }
    
    func testAPIResponse_Success() throws {
        //ARRANGE
        let resource = APIManager.sharedInstance
        
        //ACT
        resource.performRequest(serviceType: .userData) { response in
            switch response {
                //ASSERT
            case .success(value: let value):
                XCTAssertNotNil(value)
            case .failure(error: let error):
                XCTAssertNil(error)
            }
        }
    }
    
    func testAPIResponse_Fail_WithWrongAPI() throws {
        //ARRANGE
        let params = ["":""] as? AnyDict
        let resource = APIManager.sharedInstance
        
        //ACT
        resource.performRequest(serviceType: .getNews(parameters: params!)) { response in
            switch response {
                //ASSERT
            case .success(value: let value):
                XCTAssertNil(value)
            case .failure(error: let error):
                XCTAssertNotNil(error)
            }
        }
    }
    
    func testAPIResponse_Success_WithDecoding() throws {
        //ARRANGE
        let resource = APIManager.sharedInstance
        
        //ACT
        resource.performRequest(serviceType: .userData) { response in
            switch response {
                //ASSERT
            case .success(value: let value):
                do {
                    let responseData = try JSONDecoder().decode(UserData.self, from: value as! Data)
                    XCTAssertNotNil(responseData)
                } catch {
                    break
                }
            case .failure(error: _): break
            }
        }
    }
    
    func testPerformanceExample() throws {
        
        self.measure {
            
        }
    }
    
}
