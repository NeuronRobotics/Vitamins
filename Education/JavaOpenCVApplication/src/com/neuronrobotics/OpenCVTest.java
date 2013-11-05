package com.neuronrobotics;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;

import org.opencv.core.Rect;



import com.neuronrobotics.jniloader.FaceDetector;
import com.neuronrobotics.jniloader.OpenCVJNILoader;

public class OpenCVTest {
	  public void run() {
		FaceDetector faceDetectorObject = new FaceDetector(0);
		JFrame frame = new JFrame();
		ImageIcon icon = new ImageIcon();
		frame .setContentPane(new  JLabel(icon));
		frame.setSize(640, 480);
		frame.setVisible(true);
		frame .setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		
		while (true){
			Rect [] faces = faceDetectorObject.getFaces();
			for(Rect r:faces){
				System.out.println("Face at x:"+r.x+" y:"+r.y+" size:"+r.height*r.width);
			}
			try {
				BufferedImage image = faceDetectorObject.getLatestImage();
				icon.setImage(image);
				frame.repaint();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		}
		   
		    
	  }

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		OpenCVJNILoader.load();
        
        new OpenCVTest().run();
	}

}
