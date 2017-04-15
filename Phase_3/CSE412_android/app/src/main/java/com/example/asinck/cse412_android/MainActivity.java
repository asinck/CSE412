package com.example.asinck.cse412_android;

/*

https://developer.android.com/guide/webapps/webview.html
https://www.tutorialspoint.com/android/android_webview_layout.htm

 */

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Window;
import android.view.WindowManager;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;

public class MainActivity extends AppCompatActivity {
    //These are the elements of the page. This is just the declaration
    WebView browser;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //Remove title bar
        this.requestWindowFeature(Window.FEATURE_NO_TITLE);
        //Remove notification bar
        this.getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);

        setContentView(R.layout.activity_main);

        //these are the elements of the page. This is where they are actually connected.
        browser = (WebView) findViewById(R.id.webview);

        //Set up the web browser
        WebSettings webSettings = browser.getSettings();
        webSettings.setJavaScriptEnabled(true);
        webSettings.setDatabasePath("");
        webSettings.setDomStorageEnabled(true);
        browser.setWebViewClient(new MyBrowser());

        loadPage();
    }
   private class MyBrowser extends WebViewClient {
      @Override
      public boolean shouldOverrideUrlLoading(WebView view, String url) {
         view.loadUrl(url);
         return true;
      }
   }

   //This function loads a web page.
   private void loadPage() {
       browser.loadUrl("http://cse412.michaeljscott.net/");
   }
}

