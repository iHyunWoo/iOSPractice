//
//  ViewController.swift
//  KakaoMapPractice
//
//  Created by 정현우 on 2022/12/11.
//

import UIKit
import CoreLocation
import Alamofire

class ViewController: UIViewController, MTMapViewDelegate {
	
	@IBOutlet var subView: UIView!
	var mapView: MTMapView?
	
	var latitude: Double = 37.576568
	var longitude: Double = 127.029148
	
	var allCircle = [MTMapCircle]()
	
	var locationManager: CLLocationManager!
	
	var myLatitude: Double!
	var myLongitude: Double!

	override func viewDidLoad() {
		super.viewDidLoad()
		
		mapView = MTMapView(frame: subView.frame)
		
		
		locationManager = CLLocationManager()
		locationManager.delegate = self
		locationManager.allowsBackgroundLocationUpdates = true
		locationManager.requestAlwaysAuthorization()
		locationManager.startUpdatingLocation()
		
		myLatitude = locationManager.location?.coordinate.latitude
		myLongitude = locationManager.location?.coordinate.longitude
		
//		let poiitem1 = MTMapPOIItem()
//		poiitem1.itemName = "집"
//		poiitem1.mapPoint = MTMapPoint(geoCoord: MTMapPointGeo(latitude: 37.37026665136998, longitude: 127.12800832830814))
//		poiitem1.markerType = .redPin
//
//		mapView?.addPOIItems([poiitem1])
		
		
		
		if let mapView = mapView {
			mapView.delegate = self
			// 지도 타입 설정 - hybrid: 하이브리드, satellite: 위성지도, standard: 스탠다드
			mapView.baseMapType = .standard
			
			// 현재 위치 트래킹 -> 위치 정보 동의를 받았을때만
			DispatchQueue.global().async {
				if CLLocationManager.locationServicesEnabled() {
					mapView.currentLocationTrackingMode = .onWithoutHeading
					mapView.showCurrentLocationMarker = true
				}
			}
			
			// 지도의 센터를 설정(x와 y좌표, 줌 레벨 등을 설정)
			mapView.setMapCenter(MTMapPoint(geoCoord: MTMapPointGeo(latitude: myLatitude, longitude: myLongitude)), zoomLevel: 5, animated: true)
			self.view.addSubview(mapView)
			
		}
	}
	

}

extension ViewController: CLLocationManagerDelegate {
	func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
		switch manager.authorizationStatus {
		case .authorizedAlways, .authorizedWhenInUse:
			print("GPS권한 설정됨")
		case .restricted, .notDetermined:
			print("GPS권한 설정되지 않음")
			self.locationManager.requestWhenInUseAuthorization()
		case .denied:
			print("GPS 권한 요청 거부됨")
			self.locationManager.requestWhenInUseAuthorization()
		default:
			print("default")
		}
	}
	

}


