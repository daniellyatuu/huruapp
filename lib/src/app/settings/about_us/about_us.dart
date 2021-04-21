import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  Widget _divider() {
    return SizedBox(
      height: 10.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        backgroundColor: Color(0xFF417690),
      ),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Text(
              'WHO ARE WE?',
              style: Theme.of(context).textTheme.headline6,
            ),
            _divider(),
            Text(
              'We are team of digital health researchers from Muhimbili University of Health and Allied Sciences, Ministry of Health'
              ' Tanzania working together with Casa famiglia rosseta Italy. We have developed this application to increase'
              ' information access for people with drug use disorders and their care takers as well as the healthcare workers.'
              ' This is to ensure that people with drug use disorders get the best evidence-based services and health care '
              'workers have access to information on how to best to care and treat their patients. ',
              style: TextStyle(
                fontSize: 16.0,
                height: 1.4,
              ),
              textAlign: TextAlign.justify,
            ),
            _divider(),
            Text(
              'Huru App is a referral service that provides information about addiction treatment practitioners and facilities.',
              style: TextStyle(
                fontSize: 16.0,
                height: 1.4,
              ),
              textAlign: TextAlign.justify,
            ),
            _divider(),
            Text(
              'Huru App is not a medical provider or treatment facility and does not provide medical advice.',
              style: TextStyle(
                fontSize: 16.0,
                height: 1.4,
              ),
              textAlign: TextAlign.justify,
            ),
            _divider(),
            Text(
              'Huru App does not endorse any treatment facility or guarantee the quality of care provided, or the results to be achieved, by any treatment facility.',
              style: TextStyle(
                fontSize: 16.0,
                height: 1.4,
              ),
              textAlign: TextAlign.justify,
            ),
            _divider(),
            Text(
              'The information provided by Huru App is not a substitute for professional treatment advice.',
              style: TextStyle(
                fontSize: 16.0,
                height: 1.4,
              ),
              textAlign: TextAlign.justify,
            ),
            _divider(),
            Text(
              'MISSION',
              style: Theme.of(context).textTheme.headline6,
            ),
            _divider(),
            Text(
              'To create a happy community where people are free from addiction and engage in productive activities',
              style: TextStyle(
                fontSize: 16.0,
                height: 1.4,
              ),
              textAlign: TextAlign.justify,
            ),
            _divider(),
            Text(
              'VISION',
              style: Theme.of(context).textTheme.headline6,
            ),
            _divider(),
            Text(
              'To ensure access of information and services that facilitate recovery of people from substance use disorder and build a healthy community which is free from drug addiction',
              style: TextStyle(
                fontSize: 16.0,
                height: 1.4,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
