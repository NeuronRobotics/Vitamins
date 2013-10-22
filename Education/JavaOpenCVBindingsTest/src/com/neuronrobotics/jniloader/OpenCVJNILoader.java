package com.neuronrobotics.jniloader;

public class OpenCVJNILoader {
	static NativeResource resource=null;
	public static void load() {
		if( resource!=null)
			return;
		resource= new NativeResource();
		
		if(NativeResource.isLinux())
			resource.load("libopencv_java246");
		if(NativeResource.isOSX())
			resource.load("libopencv_java");
		
	}

}
