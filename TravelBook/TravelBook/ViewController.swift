//
//  ViewController.swift
//  TravelBook
//
//  Created by Sandeep Solanki on 6/4/23.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var commentText: UITextField!
    
    @IBOutlet weak var mapView: MKMapView!    
    var locationManager = CLLocationManager()
    
    var chosenLatitude = Double()
    var chosenLongitude = Double()
    
    var selectedTitle = ""
    var selectedTitleId : UUID?
    
    var annotationTitle = ""
    var annotationSubtitle = ""
    var annotationLatitude = Double()
    var annotationLongitude = Double()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // creating delegate to control map object
        mapView.delegate = self
        locationManager.delegate = self
        // set location accuracy, Note: Best (kCLLocationAccuracyBest) uses more battery
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        let gestureRecognizer = UILongPressGestureRecognizer(target: self,
                                                             action: #selector(choseLocation(gestureRecognizer:)))
        // set mininum time for pinning
        gestureRecognizer.minimumPressDuration = 3
        mapView.addGestureRecognizer(gestureRecognizer)
        
        // check if selected title is not empty
        if selectedTitle != "" {
            // Go to CoreData and get resutls
            //let stringUUID = selectedTitleId!.uuidString
            //print(stringUUID)
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            // create fetch request
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
            let idString = selectedTitleId!.uuidString
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString)
            fetchRequest.returnsObjectsAsFaults = false
            
            // get results
            do {
                
                let results = try context.fetch(fetchRequest)
                if results.count > 0 {
                    
                    for result in results as! [NSManagedObject] {
                        
                        // below we use nested-if's as it display's the result only if prior condition works...
                        // providing additional safety and also good execution
                        if let title = result.value(forKey: "title") as? String {
                            // Do something
                            annotationTitle = title
                            
                            if let subtitle = result.value(forKey: "subtitle") as? String {
                                // do something
                                annotationSubtitle = subtitle
                                
                                if let latitude = result.value(forKey: "latitude") as? Double {
                                    // do something
                                    annotationLatitude = latitude
                                    print(annotationLatitude)
                                                                        
                                    if let longitude = result.value(forKey: "longitude") as? Double {
                                        // do something
                                        annotationLongitude = longitude
                                        print(annotationLongitude)
                                        
                                        // add annotations to the map
                                        let annotation = MKPointAnnotation()
                                        annotation.title = annotationTitle
                                        annotation.subtitle = annotationSubtitle
                                        let coordinate = CLLocationCoordinate2D(latitude: annotationLatitude,
                                                                                longitude: annotationLongitude)
                                        // print(coordinate)   // CLLocationCoordinate2D(latitude: 2.2954272122195505, longitude: 48.85711028124044)
                                        annotation.coordinate = coordinate
                                        
                                        mapView.addAnnotation(annotation)
                                        nameText.text = annotationTitle
                                        commentText.text = annotationSubtitle
                                        
                                        // stop updating location
                                        locationManager.stopUpdatingLocation()
                                        
                                        // create span to show region
                                        let span = MKCoordinateSpan(latitudeDelta: 0.05,
                                                                    longitudeDelta: 0.05)
                                        let region = MKCoordinateRegion(center: coordinate,
                                                                        span: span)
                                        mapView.setRegion(region, animated: true)
                                    }
                                }
                            }
                        }
                    }
                }
                                
            } catch {
                print("Error getting data {VC_VDL}.")
            }
        } else {
            // Add a new record
            
        }
        
    }
    
    @objc func choseLocation(gestureRecognizer:UILongPressGestureRecognizer) {
        
        if gestureRecognizer.state == .began {
            
            // capture user touchpoint
            let touchedPoint = gestureRecognizer.location(in: self.mapView)
            // capture user touchpoint and get coordintes from touchpoint
            let touchedCoordinates = self.mapView.convert(touchedPoint,
                                                          toCoordinateFrom: self.mapView)
            
            chosenLatitude = touchedCoordinates.longitude
            chosenLongitude = touchedCoordinates.latitude
            
            // add annotations.... pin etc...
            let annotation = MKPointAnnotation()
            annotation.coordinate = touchedCoordinates
            annotation.title = nameText.text
            annotation.subtitle = commentText.text
            self.mapView.addAnnotation(annotation)
        }
    }
        
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // locations[0]
        if selectedTitle == "" {
            let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude,
                                                  longitude: locations[0].coordinate.longitude)
            // adjust zoom level of location... 0.05 is a good choice
            let span = MKCoordinateSpan(latitudeDelta: 0.05,
                                        longitudeDelta: 0.05)
            // defining region using location data and span
            let region = MKCoordinateRegion(center: location, span: span)
            mapView.setRegion(region, animated: true)
        } else {
            // do nothing
        }
    }
    
    // Add additional views for 'annotations'
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        // return nothing if pinview is at user current location.. as that is not what we want..
        if annotation is MKUserLocation {
            return nil
        }
                
        let reuseId = "myAnnotation"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKMarkerAnnotationView
        
        // if pinview is empty, create a new one
        if pinView == nil {
            // pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId) // MKPinAnnotationView is deprecated
            pinView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView?.canShowCallout = true
            // change other attributes of pinview
            pinView?.tintColor = UIColor.brown
            
            // adding button to right side of pinview
            let button = UIButton(type: UIButton.ButtonType.detailDisclosure)
            pinView?.rightCalloutAccessoryView = button
            
        } else {
            pinView?.annotation = annotation
        }
        
        return pinView
    }
    
    // Navigation for accessory view click...
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if selectedTitle != "" {
            
            let requestLocation = CLLocation(latitude: annotationLatitude,
                                             longitude: annotationLongitude)
            
            CLGeocoder().reverseGeocodeLocation(requestLocation) { (placemarks, error) in
                // closure
                if let placemark = placemarks {
                    if placemark.count > 0 {
                        
                        let newPlacemark = MKPlacemark(placemark: placemark[0])
                        print(newPlacemark)
                        let item = MKMapItem(placemark: newPlacemark)
                        item.name = self.annotationTitle
                        // adding navigation to address from current location.. options, drive, walk etc... below only for drive
                        let launchOptions = [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving]
                        item.openInMaps(launchOptions: launchOptions)
                    }
                    
                }
                
                
            }
            
        }
    }
    
    
    
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newPlace = NSEntityDescription.insertNewObject(forEntityName: "Places",
                                                           into: context)
        
        newPlace.setValue(nameText.text, forKey: "title")
        newPlace.setValue(commentText.text, forKey: "subtitle")
        newPlace.setValue(chosenLatitude, forKey: "latitude")
        newPlace.setValue(chosenLongitude, forKey: "longitude")
        newPlace.setValue(UUID(), forKey: "id")
        
        do {
            try context.save()
            print("Success!")
        } catch {
            print("Oops! Error while saving")
        }
        
        // return back to title page once saving is complete
        NotificationCenter.default.post(name: NSNotification.Name("newPlace"), object: nil)
        // trigger function to get data from CoreData.. the below line pops up to the ListVC, where we check for the message
        // this needs to be done outside of ViewDidLoad.. in viewWillAfter
        navigationController?.popViewController(animated: true)
        
        
    }
}

