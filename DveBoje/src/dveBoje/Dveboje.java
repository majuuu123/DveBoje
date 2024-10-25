package dveBoje;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.border.LineBorder;
import javax.swing.JButton;
import javax.swing.JColorChooser;

import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.Color;

public class Dveboje {

	private JFrame frame;
	private Color borderColor;
	private Color bgColor;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Dveboje window = new Dveboje();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public Dveboje() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.getContentPane().setBackground(new Color(192, 192, 192));
		frame.setBounds(100, 100, 450, 300);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		frame.getContentPane().setBackground(bgColor);
		
		JButton btnChangeBackground = new JButton("Cange Background");
		btnChangeBackground.setBorder(new LineBorder(borderColor));
		btnChangeBackground.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Color initialcolor=Color.RED;    
				Color color=JColorChooser.showDialog(frame,"Select a color",initialcolor);    
				frame.getContentPane().setBackground(color);    
				bgColor = color;
			}
		});
		btnChangeBackground.setBounds(58, 73, 137, 74);
		frame.getContentPane().add(btnChangeBackground);
		
		JButton btnChangeBroder = new JButton("Change Border");
		btnChangeBroder.setBorder(new LineBorder(borderColor));
		btnChangeBroder.setForeground(Color.BLACK);
		btnChangeBroder.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Color initialcolor=Color.RED;    
				Color color=JColorChooser.showDialog(frame,"Select a color",initialcolor);    
				btnChangeBroder.setBorder(new LineBorder(color));
				btnChangeBackground.setBorder(new LineBorder(color));
				borderColor = color;
			}
		});
		btnChangeBroder.setBounds(232, 79, 128, 62);
		frame.getContentPane().add(btnChangeBroder);
	}

}
