package com.example.raavailability;

import android.app.Activity;
import android.content.Context;
import android.os.Handler;
import android.util.Log;

import androidx.annotation.NonNull;

import com.google.ar.core.ArCoreApk;
import com.google.ar.core.exceptions.UnavailableUserDeclinedInstallationException;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** RaavailabilityPlugin */
public class RaavailabilityPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {
  private MethodChannel channel;
  private Context mContext;
  private Activity activity;
  private boolean mUserRequestedInstall = true;


  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "raavailability");
    channel.setMethodCallHandler(this);
    this.mContext = flutterPluginBinding.getApplicationContext();
  }

  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "raavailability");
    channel.setMethodCallHandler(new RaavailabilityPlugin());
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("isSupported")) {
      result.success(_isSupported());
    } else if(call.method.equals("")){

    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  private boolean _isSupported(){
    ArCoreApk _arcore = ArCoreApk.getInstance();
    try {
      switch (_arcore.requestInstall(activity, mUserRequestedInstall)) {
        case INSTALLED:
          return true;
        case INSTALL_REQUESTED:
          return false;
      }
    } catch (UnavailableUserDeclinedInstallationException e) {
      Log.e("User decline install", "The user declined the install.");
      return false;
    } catch (Exception e) {  // Current catch statements.
      Log.e("Unknown exception", e.getMessage());
      return false;
    }

    return false;
  }

  @Override
  public void onAttachedToActivity(ActivityPluginBinding activityPluginBinding) {
    this.activity = activityPluginBinding.getActivity();
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {

  }

  @Override
  public void onReattachedToActivityForConfigChanges(ActivityPluginBinding activityPluginBinding) {

  }

  @Override
  public void onDetachedFromActivity() {

  }
}
