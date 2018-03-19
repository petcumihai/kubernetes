package org.ballerinax.kubernetes.models;

import java.util.Map;

/**
 * Model class to hold kubernetes secret data.
 */
public class SecretModel {
    private String name;
    private Map<String, String> data;
    private String mountPath;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Map<String, String> getData() {
        return data;
    }

    public void setData(Map<String, String> data) {
        this.data = data;
    }

    public String getMountPath() {
        return mountPath;
    }

    public void setMountPath(String mountPath) {
        this.mountPath = mountPath;
    }
}
