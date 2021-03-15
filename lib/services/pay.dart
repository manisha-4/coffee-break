import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

Razorpay razorpay;

TextEditingController textEditingController=new TextEditingController();


  @override
  void initState()
  {
    super.initState();
    razorpay=new Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,handlerPaymentFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,handlerExternalWallet);

  }



void dispose()
{
  super.dispose();
  razorpay.clear();
}

void openCheckOut(){
  var options={
    "key":"rzp_test_ZEQDgNPtoN5Cin",
    "ammount":num.parse(textEditingController.text)*100,
    "name":"Manisha sah",
    "description":"Payment for the some random product",
    "prefill":{
      "contact":"2323232323",
      "email":"abc@gmail.com"
    },
"external":{
  "wallets":['paytm']
}
  };

try{
razorpay.open(options);
}catch(e)
{
  print(e.toString());
}




}





void handlerPaymentSuccess()
{
 // print('Payment Success');
  Toast.show("payment Success",context);
}
void handlerPaymentFailure()
{
  //print('Payment Fail');
  Toast.show("payment Fail",context);
}
void handlerExternalWallet()
{
  //print('Payment Error');
  Toast.show("payment Error",context);
}



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.brown[400],
          elevation: 0.0,
        title:Text('Pay Money') ,centerTitle: true,),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: 
        [
          SizedBox(height: 30,),
          TextField(
            controller: textEditingController,
            decoration:InputDecoration(hintText:'amount to pay'),
            //rstyle:TextStyle(color:Colors.red),
          ),
          SizedBox(height: 30,),
          RaisedButton(
           
            color:Colors.pink,
            child:Text('Pay now',style:TextStyle(color:Colors.white)),
            onPressed: (){
              openCheckOut();

            },)
        ],),
      )
      
    );
  }
}