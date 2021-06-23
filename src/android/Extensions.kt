package com.yodo1.cordova

import com.yodo1.mas.error.Yodo1MasError
import org.apache.cordova.CallbackContext
import org.apache.cordova.PluginResult
import org.json.JSONObject

fun CallbackContext.fireEvent(event: Event, error: Yodo1MasError) {
    val message = JSONObject().put("event", event.value).put("error", error)
    val result = PluginResult(PluginResult.Status.OK, message)
    result.keepCallback = true
    this.sendPluginResult(result)
}

fun CallbackContext.fireEvent(event: Event) {
    val message = JSONObject().put("event", event.value)
    val result = PluginResult(PluginResult.Status.OK, message)
    result.keepCallback = true
    this.sendPluginResult(result)
}