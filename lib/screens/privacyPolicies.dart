import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class PrivacyPolicies extends StatefulWidget {


  @override
  _PrivacyPoliciesState createState() => _PrivacyPoliciesState();
}

class _PrivacyPoliciesState extends State<PrivacyPolicies> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff060E57),
        leading: IconButton(padding: EdgeInsets.zero, onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),


        title: Text("Privacy Policies", style: TextStyle(
            fontFamily: "Franklin_Gothic"
        ),),
        centerTitle: true,
        elevation: 0,

      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff060E57),
                  Color(0xff010311)
                ]
            )
        ),
        child: Container(
          height: 810.h,
          margin: EdgeInsets.only(right: 7.w, left: 7.w),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40.r)
          ),
          child: Padding(
            padding:  EdgeInsets.only(top: 20.h),
            child: ListView(
                padding: EdgeInsets.only(right: 40.w, left: 40.w),
                children: [ Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,


                  children: [
                    Text("The Information We Collect.",style: TextStyle(
                      fontFamily: "Franklin_Gothic",
                      fontSize: 20.sp,


                    ),
                    ),

                    // Text("  Here you can find a list of your transactions that are in progress or have been successfully completed. Here you can find a list of your transactions that are in progress or have been successfully completed. Here you can find a list of your transactions that are in progress or have been successfully completed. Here you can find a list of your transactions that are in progress or have been successfully completed. Here you can find a list of your transactions that are in progress or have been successfully completed. Here you can find a list of your transactions that are in progress or have been successfully completed. Here you can find a list of your transactions that are in progress or have been successfully completed. Here you can find a list of your transactions that are in progress or have been successfully completed. Here you can find a list of your transactions that are in progress or have been successfully completed. Here you can find a list of your transactions that are in progress or have been successfully completed. Here you can find a list of your transactions that are in progress or have been successfully completed.",style: TextStyle(
                    //     fontFamily: "Franklin_Gothic",
                    //     fontSize: 15,
                    //     color: Colors.grey
                    // ),),
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      "Personally Identifiable Information. Throughout our website, we have provided Site visitors various forms from which they can complete a transaction or request additional information about our services, or from which they can request to speak with a customer service representative. On these forms, visitors are prompted to provide their names, contact information and, in some cases, other personally identifiable information pertinent to the request.",style: TextStyle(
                        fontFamily: "Franklin_Gothic",
                        fontSize: 17.sp,
                        color: Colors.grey

                    ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      "Non-personally Identifiable Information. We also collect autonomous, non-personally identifiable information through the Site, including the Internet Protocol (IP) address(es) from which you access the Site and information about the nature of your use of the Site. We collect this information and use it in the aggregate to monitor the Site, to improve Site offerings and for targeted promotional or marketing initiatives. Aggregated data are compiled into statistical and demographic information that we use, and may share with others, including third-party vendors to show preferences of Site users in the aggregate, but not the preferences of any individual users and/or for marketing purposes. If we share this kind of aggregated data with third parties, it will not include a level of detail that would permit a third party to associate an individual user personal information preferences. We may combine autonomous information with personally identifiable information to identify a user in order to enforce the Sites Terms of Use. If you wish to opt out of data collection or retargeting advertising, please email us directly at team@mygreat.io",
                      style: TextStyle(
                          fontFamily: "Franklin_Gothic",
                          fontSize: 17.sp,
                          color: Colors.grey

                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text("Use of the Information We Collect.",style: TextStyle(
                      fontFamily: "Franklin_Gothic",
                      fontSize: 20.sp,


                    ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),

                    Text(
                      "We use the personally identifiable information we collect on the Site to ensure compliance with the website Terms of Use, to offer and render our services and to respond to our users' queries. Personally identifiable information is accessible by our employees, contractors and agents to the extent reasonably necessary for these purposes. In addition, we also use this information to generate a list of email addresses to which we send correspondence from us. Such correspondence may include occasional updates about our products and services, along with other Site-related information. By submitting information to us through the provided prompts or forms, you consent to our placing your email address on this opt-in list.",style: TextStyle(
                        fontFamily: "Franklin_Gothic",
                        fontSize: 17.sp,
                        color: Colors.grey

                    ),
                    ),
                    Text(
                      "Except as described in this section, we will not share your personally identifiable information with any third party unless you expressly consent to such disclosure in advance. We may use cookies to identify you as a user of the Site, to permit your access to the Site services and to monitor your use of the Site. Cookies are text files, stored in your Web browser, that contain information about you relative to your use of the Site. If you configure your Web browser to disable or block cookies, you will not be able to use the Site services.",style: TextStyle(
                        fontFamily: "Franklin_Gothic",
                        fontSize: 17.sp,
                        color: Colors.grey

                    ),
                    ),





                  ],
                ),
                ]
            ),
          ),
        ),


      ),
    );
  }
}
