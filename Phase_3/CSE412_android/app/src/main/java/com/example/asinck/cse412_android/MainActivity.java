package com.example.asinck.cse412_android;

/*

https://developer.android.com/guide/webapps/webview.html
https://www.tutorialspoint.com/android/android_webview_layout.htm

 */

import android.content.Intent;
import android.net.Uri;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {
    //These are the elements of the page. This is just the declaration
    WebView browser;
    EditText urlInput;
    Button loadButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //these are the elements of the page. This is where they are actually connected.
        browser = (WebView) findViewById(R.id.webview);
        urlInput = (EditText) findViewById(R.id.urlInput);
        loadButton = (Button) findViewById(R.id.loadUrlButton);


        //Set up the web browser
//        browser.loadUrl("");
        WebSettings webSettings = browser.getSettings();
        webSettings.setJavaScriptEnabled(true);
        webSettings.setDatabasePath("");
        webSettings.setDomStorageEnabled(true);
        browser.setWebViewClient(new MyBrowser());

        //Connect the button so that it does something
        loadButton.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                loadPage(view);
            }
        });
    }
   private class MyBrowser extends WebViewClient {
      @Override
      public boolean shouldOverrideUrlLoading(WebView view, String url) {
         view.loadUrl(url);
         return true;
      }
   }

   //This function loads a web page.
   private void loadPage(View view) {
       String URL = "" + urlInput.getText();
       if (!URL.startsWith("http://")) {
           URL = "http://" + URL;
       }
       browser.loadUrl(URL);
   }
}

