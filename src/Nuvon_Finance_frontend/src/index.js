import { Nuvon_Finance_backend } from '../../declarations/Nuvon_Finance_backend';

window.addEventListener("load", async function(){
    // console.log("Finished loading"); 
    update();
}); 

document.querySelector("form").addEventListener("submit", async function(event) {
    event.preventDefault(); 
    console.log("submitted"); 

    const button = event.target.querySelector("#submit-btn");

    const inputAmount = parseFloat(document.getElementById("input-amount").value);
    const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value);

    button.setAttribute('disabled', true); 

    if (document.getElementById("input-amount").value.length != 0){
        await Nuvon_Finance_backend.topUp(inputAmount);
    }

    if(document.getElementById("withdrawal-amount").value.length != 0){
        await Nuvon_Finance_backend.topDown(outputAmount); 
    }

    await Nuvon_Finance_backend.compound();
    update(); 




    document.getElementById("input-amount").vlaue = "";
    document.getElementById("withdrawal-amount").value="";

    button.removeAttribute("disabled"); 



}); 


async function update() {
    const currentAmount = await Nuvon_Finance_backend.CheckBalance(); 
    document.getElementById("value").innerText = Math.round(currentAmount * 100) / 100;
};

