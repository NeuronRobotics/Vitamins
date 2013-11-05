package com.neuronrobotics.jniloader;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

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
	private MatOfRect faceDetections;
	private CascadeClassifier faceDetector ;
	private VideoCapture vc;
	private double scale=.2;
	
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

		MatOfByte mb=new MatOfByte(); 
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
		BufferedImage tmp= toGrayScale(getLatestImage(),scale);
		
		MatOfByte mb;

		try {
			
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			ImageIO.write(tmp, "jpg", baos);
			baos.flush();
			byte[] tmpByteArray = baos.toByteArray();
			baos.close();
			mb = new MatOfByte(tmpByteArray);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	
		Mat matImageLocal =Highgui.imdecode(mb, 0);
		
		if(matImageLocal.empty()){
			return null;
		}
		
		faceDetector.detectMultiScale(matImageLocal, faceDetections);
		Rect [] smallArray = faceDetections.toArray();
		Rect [] myArray = new Rect [smallArray.length];
		for(int i=0;i<smallArray.length;i++){
			Rect r = smallArray[i];
			myArray[i] = new Rect(	(int)	(r.x/scale),
									(int)(r.y/scale),
									(int)(r.width/scale), 
									(int)(r.height/scale));
		}
		
		//System.out.println(String.format("Detected %s faces", myArray.length));
		// Draw a bounding box around each face.
	    for (Rect rect : myArray) {
	        Core.rectangle(matImage, new Point(rect.x, rect.y), new Point(rect.x + rect.width, rect.y + rect.height), new Scalar(0, 255, 0));
	    }
		return myArray;
	}
	
	private BufferedImage toGrayScale(BufferedImage in, int w, int h){
		BufferedImage bi = new BufferedImage(w,h, BufferedImage.TYPE_BYTE_GRAY);
		Graphics g = bi.createGraphics();
		g.drawImage(in, 0, 0,w,h, null);
		return bi;
	}
	private BufferedImage toGrayScale(BufferedImage in, double scale){
		int w=(int)(in.getWidth()*scale);
		int h=(int) (in.getHeight()*scale);	
		return toGrayScale(in, w, h);
	}
}
