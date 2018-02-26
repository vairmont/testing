import { NgModule, ErrorHandler } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpModule } from '@angular/http';
import { IonicApp, IonicModule, IonicErrorHandler } from 'ionic-angular';
import { MyApp } from './app.component';
import { HomePage } from '../pages/home/home';
import { TabsPage } from '../pages/tabs/tabs';
import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen';
import { LoginPage } from "../pages/login/login";
import { RegisterPage } from "../pages/register/register";
import { BrotherAppPage } from "../pages/brother-app/brother-app";
import { HistoryPage } from "../pages/history/history";
import { ServicePage } from "../pages/service/service";
import { SettingsPage } from "../pages/settings/settings";
import { ProductPage } from "../pages/product/product";
import { ProductDetailPage } from "../pages/product-detail/product-detail";
import { PrivacyPage } from "../pages/privacy/privacy";
import { NewsPage } from "../pages/news/news";
import { TermsPage } from "../pages/terms/terms";
import { WarrantyPage } from "../pages/warranty/warranty";
import { ProfilePage } from "../pages/profile/profile";
import { CartPage } from '../pages/cart/cart';
import { NavbarWithCartPage } from '../pages/navbar-with-cart/navbar-with-cart';
import { NavbarWithoutCartPage } from '../pages/navbar-without-cart/navbar-without-cart';
import { ChatPage } from "../pages/chat/chat";
import { CustomerDetailPage } from '../pages/customer-detail/customer-detail';
import { OrderConfirmationPage } from '../pages/order-confirmation/order-confirmation';
import { FavoritePage } from '../pages/favorite/favorite';
import { InAppBrowser } from '@ionic-native/in-app-browser';
import { Camera } from '@ionic-native/camera';
import { VerifyCodePage } from '../pages/verify-code/verify-code';
import { OrderPage } from '../pages/order/order';
import { CallNumber } from "@ionic-native/call-number";
import { SerialNumberPage } from '../pages/serial-number/serial-number';
import { OfferingPage } from '../pages/offering/offering';
import { BarcodeScanner } from '@ionic-native/barcode-scanner';
import { Device } from '@ionic-native/device';
import { ForgotPasswordPage } from '../pages/forgot-password/forgot-password';
import { ChangePasswordPage } from '../pages/change-password/change-password';
import { ContactPage } from '../pages/contact/contact';
import { PlaceSearchPage } from '../pages/place-search/place-search';
import { AgmCoreModule } from '@agm/core';
import { Geolocation } from '@ionic-native/geolocation';
import { NativeGeocoder } from '@ionic-native/native-geocoder';
import { IonicStorageModule } from '@ionic/storage';
import { ProductCategoriesServiceProvider } from '../providers/product-categories-service/product-categories-service';
import { ApiUrlServiceProvider } from '../providers/api-url-service/api-url-service';
import { CitiesServiceProvider } from '../providers/cities-service/cities-service';
import { ForgotPasswordServiceProvider } from '../providers/forgot-password-service/forgot-password-service';
import { RegisterServiceProvider } from '../providers/register-service/register-service';
import { VerifyServiceProvider } from '../providers/verify-service/verify-service';
import { LoginServiceProvider } from '../providers/login-service/login-service';
import { FCM } from '@ionic-native/fcm';
import { Broadcaster } from '@ionic-native/broadcaster';
import { File } from '@ionic-native/file';
import { FileTransfer, FileTransferObject } from '@ionic-native/file-transfer';
import { FcmServiceProvider } from '../providers/fcm-service/fcm-service';
import { ProfileServiceProvider } from '../providers/profile-service/profile-service';
import { FavoriteServiceProvider } from '../providers/favorite-service/favorite-service';
import { TicketServiceProvider } from '../providers/ticket-service/ticket-service';
import { ServiceServiceProvider } from '../providers/service-service/service-service';
import { CartServiceProvider } from '../providers/cart-service/cart-service';
import { NewsServiceProvider } from '../providers/news-service/news-service';
import { OrderServiceProvider } from '../providers/order-service/order-service';
import { ProductServiceProvider } from '../providers/product-service/product-service';
import { HistoryServiceProvider } from '../providers/history-service/history-service';

@NgModule({
  declarations: [
    MyApp,
    HomePage,
    TabsPage,
    LoginPage,
    RegisterPage,
    BrotherAppPage,
    HistoryPage,
    ServicePage,
    SettingsPage,
    ProductPage,
    ProductDetailPage,
    PrivacyPage,
    NewsPage,
    TermsPage,
    WarrantyPage,
    ProfilePage,
    CartPage,
    NavbarWithCartPage,
    NavbarWithoutCartPage,
    ChatPage,
    CustomerDetailPage,
    OrderConfirmationPage,
    FavoritePage,
    VerifyCodePage,
    OrderPage,
    SerialNumberPage,
    OfferingPage,
    ForgotPasswordPage,
    ChangePasswordPage,
    ContactPage,
    PlaceSearchPage
  ],
  imports: [
    BrowserModule,
    HttpModule,
    IonicModule.forRoot(MyApp,{
      platforms: {
        android: { tabsPlacement: "top" },
        ios: { tabsPlacement:"bottom" }
      }
    }),
    AgmCoreModule.forRoot({
      apiKey: 'AIzaSyCo7f3fi5ithqwdTYl12WrGjMS-WMIsko8',
      libraries: ['places']
    }),
    IonicStorageModule.forRoot()
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    MyApp,
    HomePage,
    TabsPage,
    LoginPage,
    RegisterPage,
    BrotherAppPage,
    HistoryPage,
    ServicePage,
    SettingsPage,
    ProductPage,
    ProductDetailPage,
    PrivacyPage,
    NewsPage,
    TermsPage,
    WarrantyPage,
    ProfilePage,
    CartPage,
    NavbarWithCartPage,
    NavbarWithoutCartPage,
    ChatPage,
    CustomerDetailPage,
    OrderConfirmationPage,
    FavoritePage,
    VerifyCodePage,
    OrderPage,
    SerialNumberPage,
    OfferingPage,
    ForgotPasswordPage,
    ChangePasswordPage,
    ContactPage,
    PlaceSearchPage
  ],
  providers: [
    StatusBar,
    SplashScreen,
    InAppBrowser,
    Camera,
    CallNumber,
    BarcodeScanner,
    Device,
    Geolocation,
    NativeGeocoder,
    FCM,
    Broadcaster,
    FileTransfer,
    FileTransferObject,
    File,
    {provide: ErrorHandler, useClass: IonicErrorHandler},
    ProductCategoriesServiceProvider,
    ApiUrlServiceProvider,
    CitiesServiceProvider,
    ForgotPasswordServiceProvider,
    RegisterServiceProvider,
    VerifyServiceProvider,
    LoginServiceProvider,
    FcmServiceProvider,
    ProfileServiceProvider,
    FavoriteServiceProvider,
    TicketServiceProvider,
    ServiceServiceProvider,
    CartServiceProvider,
    NewsServiceProvider,
    OrderServiceProvider,
    ProductServiceProvider,
    HistoryServiceProvider
  ]
})
export class AppModule {}
