import Quickshell
import Quickshell.Networking
pragma Singleton

Singleton {
    id: root

    readonly property var deviceList: Networking.devices ? Networking.devices.values : []
    readonly property string connectionState: {
        let wifi = false;
        for (let i = 0; i < deviceList.length; i++) {
            const dev = deviceList[i];
            if (!dev.connected)
                continue;

            // Cabel preferred -> Return.
            if (dev.type === DeviceType.Wired)
                return "wired";

            if (dev.type === DeviceType.Wifi)
                wifi = true;

        }
        return wifi ? "wifi" : "none";
    }
    readonly property bool online: connectionState !== "none"
    // Active device - Cabel preffered.
    readonly property var activeDevice: {
        let wifiDev = null;
        for (let i = 0; i < deviceList.length; i++) {
            const dev = deviceList[i];
            if (!dev.connected)
                continue;

            if (dev.type === DeviceType.Wired)
                return dev;

            if (dev.type === DeviceType.Wifi)
                wifiDev = dev;

        }
        return wifiDev;
    }
    // The connected network of the active Wifi device.
    readonly property var activeNetwork: {
        const dev = activeDevice;
        if (!dev || dev.type !== DeviceType.Wifi || !dev.networks)
            return null;

        const nets = dev.networks.values;
        if (!nets)
            return null;

        for (let i = 0; i < nets.length; i++) {
            if (nets[i].connected)
                return nets[i];

        }
        return null;
    }
    // SSID of connected Network, else empty.
    readonly property string ssid: activeNetwork ? activeNetwork.name : ""
    // signalLevel in percent 0-1.0
    readonly property int signalStrength: activeNetwork ? Math.round(activeNetwork.signalStrength * 100) : -1
    // Grained levels for icon choise: 0 = no singal ... 3 = full
    readonly property int signalLevel: {
        if (signalStrength < 0)
            return -1;

        if (signalStrength >= 60)
            return 3;

        if (signalStrength >= 40)
            return 2;

        if (signalStrength >= 20)
            return 1;

        return 0;
    }
}
