package com.example.raavailability;

import android.content.Context;
import android.os.Handler;

import androidx.annotation.NonNull;

import com.google.ar.core.ArCoreApk;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** RaavailabilityPlugin */
public class RaavailabilityPlugin implements FlutterPlugin, MethodCallHandler {
  private MethodChannel channel;
  private Context mContext;


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

  private String _isSupported(){
    ArCoreApk.Availability availability = ArCoreApk.getInstance().checkAvailability(mContext);
    String result = "Is supported" + availability.isSupported();
    result += "//Is unsupported" + availability.isUnsupported();
    result += "//Is unknown" + availability.isUnknown();
    result += "//Is transient" + availability.isTransient();

    return result;
  }
}
