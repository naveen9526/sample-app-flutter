package sampleflutterapp.ssb.com.sample_flutter_app;

import android.os.Bundle;

//import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.net.NetworkInterface;
import java.util.Collections;
import java.util.List;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    private static final String CHANNEL = "macAddress";

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        GeneratedPluginRegistrant.registerWith(new FlutterEngine((this)));
        new MethodChannel(getFlutterEngine().getDartExecutor().getBinaryMessenger(), CHANNEL).setMethodCallHandler(
                (methodCall, result) -> {
                    if (methodCall.method.equals("macAddress")) {
                        getMacAddress(result);
                    }
                }
        );
    }

    public static void getMacAddress(MethodChannel.Result result) {

        try {
            List<NetworkInterface> all = Collections.list(NetworkInterface.getNetworkInterfaces());

            for (NetworkInterface networkInterface : all) {
                if (!networkInterface.getName().equalsIgnoreCase("wlan0")) continue;

                byte[] macByte = new byte[0];
                if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.GINGERBREAD) {
                    macByte = networkInterface.getHardwareAddress();
                }

                if (macByte == null) {
                    result.error("empty", "empty", null);
                    break;
                } else {

                    String response = "";
                    for (byte b: macByte) {
                        response += String.format("%02X:", b);
                    }

                    if (response.length() > 0) {
                        response = response.subSequence(0, response.lastIndexOf(":")).toString();
                    }
                    result.success(response);
                    break;
                }
            }
        } catch (Exception e) {
            result.success("");
        }
    }
}
