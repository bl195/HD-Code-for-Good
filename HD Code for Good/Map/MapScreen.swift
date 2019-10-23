

import UIKit
import MapKit
import CoreLocation

final class Annotation: NSObject, MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?){
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        
        super.init()
    }
    
}

class MapScreen: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
//        let chapelCoordinate = CLLocationCoordinate2D(latitude: 36.000481, longitude: -78.937332)//
//        let bcCoordinate = CLLocationCoordinate2D(latitude: 36.003171, longitude: -78.941788)
//        let bcAnnotation = Annotation(coordinate: bcCoordinate, title: "Bryan Center", subtitle: "")
//        mapView.addAnnotation(chapelAnnotation)
//        mapView.addAnnotation(bcAnnotation)
//
//        mapView.setRegion(bcAnnotation.region, animated: true)
//        mapView.setCenter(chapelCoordinate, animated: true)
////        checkLocationServices()
        createAnnotations(locations: annotationLocations)
        
    }
    
    let annotationLocations = [
        ["title": "Chapel Drive", "latitude": 36.000481, "longitude": -78.937332],
        ["title": "Reynolds Theatre", "latitude": 36.003171, "longitude": -78.941788],
        ["title": "Schiciano Atrium", "latitude": 36.003448, "longitude": -78.939482],
        ["title": "Hudson Hall", "latitude": 36.004169, "longitude": -78.940937],
        ["title": "Perkins Library", "latitude": 36.002266, "longitude": -78.938631],
        ["title": "Harrington Quad", "latitude": 36.004548, "longitude": -78.940220],
        ["title": "Innovation Co-Lab", "latitude": 36.003910, "longitude": -78.938278]
    ]
    
    func createAnnotations(locations: [[String: Any]]) {
//        for location in locations{
//            let annotations = MKPointAnnotation()
//            annotations.title = location["title"] as? String
//            annotations.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! CLLocationDegrees, longitude: location["longitude"] as! CLLocationDegrees)
//            mapView.addAnnotation(annotations)
//    }
        var region: MKCoordinateRegion{
            let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
            let chapelCoordinate = CLLocationCoordinate2D(latitude: 36.003448, longitude: -78.940482)
            return MKCoordinateRegion(center: chapelCoordinate, span: span)
        }
        mapView.setRegion(region, animated: true)
        
}

   
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
}
let datas: [Message] =
    [Message(for: "Schiciano Atrium", "Check-In Begins", "8:00 AM"),
     Message(for: "Reynolds Theatre", "Opening Ceremonies", "10:00 AM"),
     Message(for: "Schiciano Atrium", "Lunch", "11:00 AM"),
     Message(for: "Schiciano Atrium", "Team Formation Mixer", "11:00 AM"),
     Message(for: "Harrington Quad", "Frisbee, Football, Volleyball", "12:00 PM"),
     Message(for:"Hudson Hall","Intro to Hardware", "1:00 PM"),
     Message(for:"Hudson Hall","VR Workshop", "2:00 PM"),
     Message(for:"Hudson Hall","Health Track Kickoff", "3:00 PM"),
     Message(for:"Hudson Hall","Javascript Workshop", "4:00 PM"),
     Message(for:"Harrington Quad","Puppies!!!!!", "4:00 PM"),
     Message(for:"Hudson Hall","API Workshop", "5:00 AM"),
     Message(for:"Hudson Hall","Mobile Workshop", "5:00 PM"),
     Message(for:"Schiciano Atrium","Dinner", "6:00 PM"),
     Message(for:"Schiciano Atrium","MLH werewolf", "8:00 PM"),
     Message(for:"Innovation Co-Lab","Mixer for Female-Identifying", "9:00 PM"),
     Message(for:"Schiciano Atrium","Nerf War", "10:00 PM"),
     Message(for:"Schiciano Atrium","Spicy Noodle Challenge", "11:00 PM"),
     Message(for:"Twinnie's","Midnight Snacks", "12:00 AM"),
     Message(for:"Hudson Hall","Nap Time", "12:00 AM"),
     Message(for:"Schiciano Atrium","Breakfast", "9:00 AM"),
     Message(for:"Hudson Hall","Workshop 4", "11:00 AM"),
     Message(for:"Schiciano Atrium","Lunch", "12:00 PM"),
     Message(for:"All Participants","Hacking Ends", "1:30 PM"),
     Message(for:"CIEMAS Lobby","First-Round Judging", "2:00 PM"),
     Message(for:"CIEMAS Lobby","Final Demos and Judging", "2:45 PM"),
     Message(for:"Reynolds Theatre","Closing Ceremony", "4:30 PM"),
     Message(for:"Science Drive","VTech Bus Leaves", "6:00 PM")]

    extension MapScreen: UITableViewDataSource, UITableViewDelegate{

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MapCell") as! MapCell
        
        cell.eventLabel.text = datas[indexPath.row].summary
        cell.locationLabel.text = datas[indexPath.row].location
        cell.timeLabel.text = datas[indexPath.row].time
        
        return cell
        
        }
  
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // Clear annotations to prevent multiple annotations from displaying?
            let allAnnotations = self.mapView.annotations
            self.mapView.removeAnnotations(allAnnotations)

            let text = datas[indexPath.row].location as String
            for location in annotationLocations{
                if (text == location["title"] as? String){
                    let annotations = MKPointAnnotation()
                    annotations.title = location["title"] as? String
                    annotations.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! CLLocationDegrees, longitude: location["longitude"] as! CLLocationDegrees)
                    mapView.addAnnotation(annotations)
                }
            }
        }


}








//    extension ViewController: MKMapViewDelegate{
//        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
//            if let chapelAnnotateView = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as? MKMarkerAnnotationView {
//                chapelAnnotateView.animatesWhenAdded = true
//                chapelAnnotateView.titleVisibility = .adaptive
//                chapelAnnotateView.titleVisibility = .adaptive
//
//                return chapelAnnotateView
//        }
//        return nil
//    }

//func setupLocationManager() {
//    locationManager.delegate = self
//    locationManager.desiredAccuracy = kCLLocationAccuracyBest
//}
////
////
//func centerViewOnUserLocation() {
//    if let location = locationManager.location?.coordinate {
//        let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
//        mapView.setRegion(region, animated: true)
//    }
//}
////
////
//func checkLocationServices() {
//    if CLLocationManager.locationServicesEnabled() {
//        setupLocationManager()
//        checkLocationAuthorization()
//    } else {
//        // Show alert letting the user know they have to turn this on.
//    }
//}
////
////
//func checkLocationAuthorization() {
//    switch CLLocationManager.authorizationStatus() {
//    case .authorizedWhenInUse:
//        mapView.showsUserLocation = true
//        centerViewOnUserLocation()
//        locationManager.startUpdatingLocation()
//        break
//    case .denied:
//        // Show alert instructing them how to turn on permissions
//        break
//    case .notDetermined:
//        locationManager.requestWhenInUseAuthorization()
//    case .restricted:
//        // Show an alert letting them know what's up
//        break
//    case .authorizedAlways:
//        break
//    }
//}
////
////}
////
//extension MapScreen: CLLocationManagerDelegate {
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let location = locations.last else { return }
//        let region = MKCoordinateRegion.init(center: location.coordinate, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
//        mapView.setRegion(region, animated: true)
//    }
//
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        checkLocationAuthorization()
//    }





