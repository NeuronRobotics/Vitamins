package com.neuronrobotics.jniloader;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.opencv.highgui.VideoCapture;
import org.opencv.core.Core;
import org.opencv.core.Mat;
import org.opencv.core.MatOfByte;
import org.opencv.core.MatOfRect;
import org.opencv.core.Point;
import org.opencv.core.Rect;
import org.opencv.core.Scalar;
import org.opencv.highgui.Highgui;
import org.opencv.objdetect.CascadeClassifier;


public class FaceDetector {
	private Mat matImage;
	private MatOfByte mb;
	private MatOfRect faceDetections;
	private CascadeClassifier faceDetector ;
	private VideoCapture vc;
	public FaceDetector(int index){
		 System.out.println("\nRunning DetectFaceDemo");
	    vc = new VideoCapture(0);
	    try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    if(!vc.isOpened()){
	        System.out.println("Camera Error");
	    }
	    else{
	        System.out.println("Camera OK");
	    }
	    matImage = new Mat();
		mb=new MatOfByte(); 
		faceDetections = new MatOfRect();
		// Create a face detector from the cascade file in the resources
	    // directory.
		faceDetector = new CascadeClassifier(FaceDetector.class.getResource("lbpcascade_frontalface.xml").getPath());
		updateImage();
	}
	
	
	public void updateImage(){
		if(!vc.isOpened())
			return;
		
		vc.read(matImage);
		
	}
	
	public BufferedImage getLatestImage(){
		if(matImage.empty()){
			updateImage();
		}
		Highgui.imencode(".jpg", matImage, mb);
		BufferedImage image=null;
		try {
			image = ImageIO.read(new ByteArrayInputStream(mb.toArray()));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return image;
	}
	
	public Rect [] getFaces(){
		updateImage();
		if(matImage.empty()){
			return null;
		}
		Rect [] myArray = faceDetections.toArray();
		faceDetector.detectMultiScale(matImage, faceDetections);
		//System.out.println(String.format("Detected %s faces", myArray.length));
		// Draw a bounding box around each face.
	    for (Rect rect : myArray) {
	        Core.rectangle(matImage, new Point(rect.x, rect.y), new Point(rect.x + rect.width, rect.y + rect.height), new Scalar(0, 255, 0));
	    }
		return myArray;
	}
}
