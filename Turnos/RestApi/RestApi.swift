//
//  RestApi.swift
//  Turnos
//
//  Created by Vicente Andrés Cantú García on 9/16/18.
//  Copyright © 2018 equipo-rojo. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

fileprivate let BASE_URL = "http://satnp.herokuapp.com"

class RestApi {
    
    private static func get<T: Mappable>(showLogin: Bool = true,
                                         updateToken: Bool = true,
                                         endpoint: String,
                                         expectedStatus : [Int] = [200],
                                         onResponse: @escaping ([T])->Void,
                                         onError: @escaping ()->Void,
                                         onNoData: @escaping ()->Void){
        
        print("GET -> " + BASE_URL + endpoint)
        
        let headers: HTTPHeaders = [:]
        
        let URL = BASE_URL + endpoint
        Alamofire.request(URL.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!, method: .get, headers: headers).responseArray { (response: DataResponse<[T]>) in
            if response.result.isSuccess{
                if response.response?.statusCode == 401{
                    // 401
                }
                else if !expectedStatus.contains((response.response?.statusCode)!){
                    onNoData()
                }
                else{
                    let response = response.result.value
                    onResponse(response!)
                }
            }else{
                onError()
            }
        }
    }
    
    private static func get<T: Mappable>(showLogin: Bool = true,
                                         updateToken: Bool = true,
                                         requiresAuth: Bool = true,
                                         endpoint: String,
                                         expectedStatus : [Int] = [200],
                                         onResponse: @escaping (T)->Void,
                                         onError: @escaping ()->Void,
                                         onNoData: @escaping ()-> Void){
        
        print("GET -> " + BASE_URL + endpoint)
        
        var headers: HTTPHeaders = [:]
        if requiresAuth {
            
        }
        
        let URL = BASE_URL + endpoint
        Alamofire.request(URL.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!, method: .get, headers: nil).responseObject { (response: DataResponse<T>) in
            print(Utils.dataToString(response.data!))
            print(response.response?.statusCode)
            if response.result.isSuccess{
                if response.response?.statusCode == 401{
                    // 401
                }
                else if !expectedStatus.contains((response.response?.statusCode)!){
                    onNoData()
                }
                else{
                    let response = response.result.value
                    onResponse(response!)
                }
            }
            else{
                onError()
            }
        }
    }
    
    private static func get<T: Mappable>(showLogin: Bool = true,
                                         updateToken: Bool = true,
                                         requiresAuth: Bool = true,
                                         endpoint: String,
                                         expectedStatus : [Int] = [200],
                                         onResponse: @escaping (T)->Void,
                                         onError: @escaping ()->Void){
        
        print("GET -> " + BASE_URL + endpoint)
        
        var headers: HTTPHeaders = [:]
        if requiresAuth {
            
        }
        
        let URL = BASE_URL + endpoint
        Alamofire.request(URL.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!, method: .get, headers: headers).responseObject { (response: DataResponse<T>) in
            if response.result.isSuccess{
                if response.response?.statusCode == 401{
                    // 401
                }
                else if !expectedStatus.contains((response.response?.statusCode)!){
                    onError()
                }
                else{
                    let response = response.result.value
                    onResponse(response!)
                }
            }
            else{
                onError()
            }
        }
    }
    
    private static func post<REQUEST: Mappable, ERROR: Mappable>(
        showLogin: Bool = true,
        updateToken: Bool = true,
        requiresAuth: Bool = true,
        endpoint: String,
        body: REQUEST,
        expectedStatus : [Int] = [201],
        onResponse: @escaping ()->Void,
        onError: @escaping (ERROR)->Void,
        notConnection: @escaping ()->Void){
        
        print("POST -> " + BASE_URL + endpoint)
        
        var headers: HTTPHeaders = [:]
        if requiresAuth {
            
        }
        
        let URL = BASE_URL + endpoint
        Alamofire.request(URL.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!, method: .post, parameters: body.toJSON(), encoding: JSONEncoding.default, headers: headers).responseObject { (response: DataResponse<ERROR>) in
            if response.response?.statusCode == 204{
                onResponse()
                return
            }
            if response.result.isSuccess{
                if response.response?.statusCode == 401{
                    // 401
                    
                }
                else if !expectedStatus.contains((response.response?.statusCode)!){
                    onError(response.result.value!)
                }
                else{
                    onResponse()
                }
            }else{
                notConnection()
            }
        }
    }
    
    private static func post<REQUEST: Mappable, RESPONSE: Mappable>(
        showLogin: Bool = true,
        updateToken: Bool = true,
        requiresAuth: Bool = true,
        endpoint: String,
        body: REQUEST,
        expectedStatus : [Int] = [201],
        onResponse: @escaping (RESPONSE)->Void,
        onError: @escaping ()->Void,
        notConnection: @escaping ()->Void){
        
        print("POST -> " + BASE_URL + endpoint)
        
        var headers: HTTPHeaders = [:]
        if requiresAuth {
            
        }
        
        let URL = BASE_URL + endpoint
        Alamofire.request(URL.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!, method: .post, parameters: body.toJSON(), encoding: JSONEncoding.default, headers: headers).responseObject { (response: DataResponse<RESPONSE>) in
            if response.result.isSuccess{
                if response.response?.statusCode == 401{
                    // 401
                }
                else if !expectedStatus.contains((response.response?.statusCode)!){
                    onError()
                }
                else{
                    onResponse(response.result.value!)
                }
            }else{
                notConnection()
            }
        }
    }
    
    private static func post<REQUEST: Mappable>(showLogin: Bool = true,
                                                updateToken: Bool = true,
                                                requiresAuth: Bool = true,
                                                endpoint: String,
                                                body: REQUEST,
                                                expectedStatus : [Int] = [201],
                                                onResponse: @escaping ()->Void,
                                                onError: @escaping ()->Void,
                                                notConnection: @escaping ()->Void){
        
        print("POST -> " + BASE_URL + endpoint)
        
        var headers: HTTPHeaders = [:]
        if requiresAuth {
        }
        
        let URL = BASE_URL + endpoint
        Alamofire.request(URL.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!, method: .post, parameters: body.toJSON(), encoding: JSONEncoding.default, headers: headers).response { (response) in
            if NetworkReachabilityManager()!.isReachable{
                if response.response?.statusCode == 401{
                    // 401
                }
                else if !expectedStatus.contains(response.response!.statusCode){
                    onError()
                }
                else{
                    onResponse()
                }
            }else{
                notConnection()
            }
        }
    }
    
    private static func delete(
        updateToken: Bool = true,
        requiresAuth: Bool = true,
        endpoint: String,
        expectedStatus : [Int] = [204],
        onResponse: @escaping ()->Void,
        onError: @escaping ()->Void,
        notConnection: @escaping ()->Void){
        
        print("DELETE -> " + BASE_URL + endpoint)
        
        var headers: HTTPHeaders = [:]
        if requiresAuth {
            
        }
        
        let URL = BASE_URL + endpoint
        Alamofire.request(URL.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!, method: .delete, headers: headers).response { (response) in
            if NetworkReachabilityManager()!.isReachable{
                if response.response?.statusCode == 401{
                    // 401
                }
                else if !expectedStatus.contains((response.response?.statusCode)!){
                    onError()
                }
                else{
                    onResponse()
                }
            }else{
                notConnection()
            }
        }
    }
    
    private static func patch<REQUEST: Mappable>(
        updateToken: Bool = true,
        requiresAuth: Bool = true,
        endpoint: String,
        body: REQUEST,
        expectedStatus : [Int] = [200],
        onResponse: @escaping ()->Void,
        onError: @escaping ()->Void,
        notConnection: @escaping ()->Void){
        
        print("PATCH -> " + BASE_URL + endpoint)
        
        var headers: HTTPHeaders = [:]
        if requiresAuth {
            
        }
        
        let URL = BASE_URL + endpoint
        Alamofire.request(URL.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!, method: .patch, parameters: body.toJSON(), encoding: JSONEncoding.default, headers: headers).response { (response) in
            if NetworkReachabilityManager()!.isReachable{
                if response.response?.statusCode == 401{
                    // 401
                }
                else if !expectedStatus.contains((response.response?.statusCode)!){
                    onError()
                }
                else{
                    onResponse()
                }
            }else{
                notConnection()
            }
        }
    }
    
    private static func patch<REQUEST: Mappable, RESPONSE: Mappable>(
        updateToken: Bool = true,
        requiresAuth: Bool = true,
        endpoint: String,
        body: REQUEST,
        expectedStatus : [Int] = [200],
        onResponse: @escaping (RESPONSE)->Void,
        onError: @escaping ()->Void,
        notConnection: @escaping ()->Void){
        
        print("PATCH -> " + BASE_URL + endpoint)
        
        var headers: HTTPHeaders = [:]
        if requiresAuth {
            
        }
        
        let URL = BASE_URL + endpoint
        Alamofire.request(URL.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!, method: .patch, parameters: body.toJSON(), encoding: JSONEncoding.default, headers: headers).responseObject { (response: DataResponse<RESPONSE>) in
            if response.result.isSuccess{
                if response.response?.statusCode == 401{
                    // 401
                }
                else if !expectedStatus.contains((response.response?.statusCode)!){
                    onError()
                }
                else{
                    onResponse(response.result.value!)
                }
            }else{
                notConnection()
            }
        }
    }
    
    static func newTurn(email: String, onResponse: @escaping (Turno)->Void, onError: @escaping ()->Void, onNoData: @escaping ()->Void) {
        get(endpoint: "/api/turno/nuevo/?correo=vicente@example.com", onResponse: onResponse, onError: onError, onNoData: onNoData)
    }
    
}
