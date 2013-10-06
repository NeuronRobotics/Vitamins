package com.neuronrobotics;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;

import org.opencv.core.Core;
import org.opencv.core.CvType;
import org.opencv.core.Mat;
import org.opencv.core.MatOfByte;
import org.opencv.core.MatOfRect;
import org.opencv.core.Point;
import org.opencv.core.Rect;
import org.opencv.core.Scalar;
import org.opencv.highgui.Highgui;
import org.opencv.highgui.VideoCapture;
import org.opencv.objdetect.CascadeClassifier;

public class OpenCVTest {
	  public void run() {
		    System.out.println("\nRunning DetectFaceDemo");
		    VideoCapture vc = new VideoCapture(0);
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
		    JFrame frame = new JFrame();
		    ImageIcon icon = new ImageIcon();
		    frame .setContentPane(new  JLabel(icon));
		    frame.setSize(640, 480);
		    frame.setVisible(true);
		    frame .setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		    Mat matImage = new Mat();
		    MatOfByte mb=new MatOfByte(); 
		    MatOfRect faceDetections = new MatOfRect();
		    
		    while (vc.isOpened()){
			    //vc.grab();   
			    vc.read(matImage);
			    if(!matImage.empty()){
				    // Create a face detector from the cascade file in the resources
				    // directory.
				    CascadeClassifier faceDetector = new CascadeClassifier(OpenCVTest.class.getResource("lbpcascade_frontalface.xml").getPath());
				    //matImage = Highgui.imread(OpenCVTest.class.getResource("lena.png").getPath());
		
				    // Detect faces in the image.
				    // MatOfRect is a special container class for Rect.
				    
				    faceDetector.detectMultiScale(matImage, faceDetections);
		
				    System.out.println(String.format("Detected %s faces", faceDetections.toArray().length));
		
				    // Draw a bounding box around each face.
				    for (Rect rect : faceDetections.toArray()) {
				        Core.rectangle(matImage, new Point(rect.x, rect.y), new Point(rect.x + rect.width, rect.y + rect.height), new Scalar(0, 255, 0));
				    }
				    try {
				        Highgui.imencode(".jpg", matImage, mb);
						BufferedImage image = ImageIO.read(new ByteArrayInputStream(mb.toArray()));
						icon.setImage(image);
						frame.repaint();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} 
			    }else{
			    	System.out.println("No image");
			    	//vc.release();
			    	//vc.open(videoInput);
			    }
			    //matImage.release();
		    }
		  }

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		System.loadLibrary(Core.NATIVE_LIBRARY_NAME);
		System.out.println(Core.VERSION);
        
        new OpenCVTest().run();
	}

}
