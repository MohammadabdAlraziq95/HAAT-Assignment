#  Basic Food Delivery Application

ordering food online mockup IOS app , the purpuse is to test my coding skills and ios mobile development knowledge.
<br />

# How To Run 

1- download the project <br />
2- go to project directory <br />
3- pod install <br />
4- run or test <br />
5- use phone "+972592750327" and authcode "0000" to login.<br />


# Architecture 

 used clean MVVM protocol orianted Architecture. <br />
 
 
# Storage Layer

 1- fake json response used json files (MealBrands.json , Users.json). <br />
 2- to store cart items used (CoreData). <br />
 3- to manage current user logged in used(UserDefualts). <br />

 
# Service Layer

 used (Alamofire , AlamofireImage) pods.<br />


# UI Layer 

 1- used seperated storyboards (Main.storyboard , Home.storyboard , Cart.Stroyboard , Authentication.storyboard) <br />
 2- used Reusable UI just like (Reusable Cells , Custom Alert , CarouselView). <br />
 3- used (collectionViews , TableViews) to represent dynamic data. <br />
 4- some extensions used to beautify Views and adding new functinalites needed  ( UIImageView+Extension , UITextFiled+Extension , .. ). <br />
 5- used usuall UIView elements like (UITextField , UIButton , UIImageView , UILabel , UISearchBar ..).<br />
 
 
 # Logic Layer 
 
 1- used ViewModels to handle the logic for each ViewController. <br />
 2- protocols used to bind data between objects.  <br />
 3- viewcontroller extensions to confirm protocols. <br />
 4- completion handlers used to get back results from Services. <br />
 5- used struct , class to build model objects with codable. <br /> 


# unit testing
 as a sample i done testing viewmodels and services and the code coverage was 23.2%. <br />


# tools 

used swiftLint -> helping to achive clean code <br />
used firebase siwft package to manage crashes using Firebase Crashlytics , Firebase Analytics. <br />


# Error Generator note

  if you want to test the functionality add "fatalError()" function on (Generate error) Button Action and crash will happen when you click button and Crashlytics will record this. 

# Driver Tracking 

  1- used Firebase RealTime Database to store most recent location each 20 second.<br />
  2- used UserDefualts to store Cache of each location and its time.<br />
  3- each 20 second app will read new location.<br />
  4- we update the map marker location.<br />

# Note :

 Realtime Database not costing from network wize cause Realtime data means that any updates made to the database will be sent out to client apps subscribed to that stream of data.

# video

https://user-images.githubusercontent.com/38591209/176475430-87e61b5a-2615-4a41-82dc-af97afddc5a1.mov


# Screenshots

Authantication <br />

<p float="left">
  <img src="/HAAT-Assignment/Resources/Screenshots/SignUp.png" width="250" /> 
  <img src="/HAAT-Assignment/Resources/Screenshots/SignUpPhone.png" width="250" />
  <img src="/HAAT-Assignment/Resources/Screenshots/AuthCode.png" width="250" />
</p>

Resturants and Meals <br />
<p float="left">
  <img src="/HAAT-Assignment/Resources/Screenshots/Home.png" width="250" /> 
  <img src="/HAAT-Assignment/Resources/Screenshots/Meals.png" width="250" />
  <img src="/HAAT-Assignment/Resources/Screenshots/Search.png" width="250" />
</p>

Shopping Cart <br />

<p float="left">
  <img src="/HAAT-Assignment/Resources/Screenshots/AddToCart.png" width="250" /> 
  <img src="/HAAT-Assignment/Resources/Screenshots/Cart.png" width="250" />
  <img src="/HAAT-Assignment/Resources/Screenshots/Error.png" width="250" />
</p>

Driver Tracking <br />

<p float="left">
  
  <img src="/HAAT-Assignment/Resources/Screenshots/map.png" width="250" />

</p>

Crashlytics and Analysis <br />

![](/HAAT-Assignment/Resources/Screenshots/crashboard.png)
![](/HAAT-Assignment/Resources/Screenshots/cartViewControllerCrash.png)
![](/HAAT-Assignment/Resources/Screenshots/crashDetails.png)
![](/HAAT-Assignment/Resources/Screenshots/AnalyticsBoard.png)
![](/HAAT-Assignment/Resources/Screenshots/investigationPage.png)
 <br />
RealTime Location

<img width="1001" alt="Screen Shot 2022-07-13 at 11 28 55 AM" src="https://user-images.githubusercontent.com/38591209/178688041-599bb388-ad82-4ae0-a4d3-a8c16e997d3a.png">



