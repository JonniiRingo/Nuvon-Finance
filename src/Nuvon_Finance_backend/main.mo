import Debug "mo:base/Debug";
import Time "mo:base/Time"; 
import Float "mo:base/Float"; 

actor Nuvon_Finance {
  stable var currentValue: Float = 300;
  // currentValue := 100;

  stable var startTime = Time.now(); 
  Debug.print(debug_show(startTime)); 

  let id = 57854323565858765877983;
  // Debug.print(debug_show(id));

  
  // Debug.print(debug_show(currentValue)); 
  // Debug.print(debug_show(_id));

  public func topUp(amount: Float){
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func topDown(amount: Float){
    let tempValue: Float = currentValue - amount;
    if(tempValue >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Amount too large, currentVaue less than zero")
    }
  };

  // topUp();

  // Ultra Fast Query Methods
  public query func CheckBalance(): async Float {
    return currentValue;
  }; 

  public func compound(){
    let currentTime = Time.now(); 
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS)); 
    startTime := currentTime;
  }


}

// Structure for running the app and calling functions from the terminal

// 1. dfx deploy

// 2. dfx deploy in a separate terminal (navigate to the same project)

// 3. dfx canister call hello_backend '("evryone")'   

      // NOTE: 
      // It's simply the name of the canister without "backend" if you change the settings in 
      // dfx.json to drop backend from the canister name

// 4. Observe the following result 
//     ("Hello everyone!")

// Structure for running the API testing UI

// 1. dfx canister id __Candid_UI 

// 2. http://127.0.0.1:4943/?canisterId=<past in canister id her from the terminal>

// 3. Paste that whole thing into the browser to navigate to the API test Candid UI

// 4. dfx canister id <name of canister>

// 5. Paste into the form in the front end UI


// Time Tracking and compound interest

  // Time - type Time = = Int

  // now - let now : () -> Time

  // 