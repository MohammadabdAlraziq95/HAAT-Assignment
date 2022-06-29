#  Basic Food Delivery Application

ordering food online mockup , the purpuse is to test my coding skills and ios mobile development knowledge.


# How To Run 

1- download the project 
2- go to project dirictory 
3- pod install
4- run or test
5- use phone "+972592750327" and authcode "0000" to login


# Architecture 

 used clean MVVM protocol orianted Architecture 
 
 
# Storage Layer

 1- fake json reponse used json files (MealBrands.json , Users.json) 
 2- to store cart items used (CoreData)
 3- to manage current user logged in used(UserDefualts)

 
# Service Layer

 used (Alamofire , AlamofireImage) pods


# UI Layer 

 1- used seperated storyboards (Main.storyboard , Home.storyboard , Cart.Stroyboard , Authentication.storyboard)
 2- used Reusable UI just like (Reusable Cells , Custom Alert , CarouselView)
 3- used (collectionViews , TableViews) to store dynamic data
 4- some extensions used to beautify Views and adding new functinalites needed  ( UIImageView+Extension , UITextFiled+Extension , .. )
 5- used usuall UIView elements like (UITextField , UIButton , UIImageView , UILabel , ..)
 
 
 # Logic Layer 
 1- used ViewModels to handle the logic for each ViewController 
 2- protocols used to bind data between objects 
 3- viewcontroller extensions to confirm protocols
 4- completion handlers used to get back results from Services
 5- used struct , class to build model objects with codable 


# unit testing
 as a sample i done testing viewmodels and services and the code coverage was 23.2%


# tools 

used swiftLint -> helping to achive clean code
used firebase siwft package to manage crashes using Firebase Crashlytics , Firebase Analytics


# video
![](/HAAT-Assignment/Resources/Screenshots/HAATVideo)
# Screenshots

Authantication 

![](/HAAT-Assignment/Resources/Screenshots/Auth.png)


Resturants and Meals

![](/HAAT-Assignment/Resources/Screenshots/Home.png)

Shopping Cart

![](/HAAT-Assignment/Resources/Screenshots/Cart.png)

Crashlytics and Analysis

![](/HAAT-Assignment/Resources/Screenshots/crashboard.png)
![](/HAAT-Assignment/Resources/Screenshots/cartViewControllerCrash.png)
![](/HAAT-Assignment/Resources/Screenshots/crashDetails.png)
![](/HAAT-Assignment/Resources/Screenshots/AnalyticsBoard.png)
![](/HAAT-Assignment/Resources/Screenshots/investigationPage.png)

