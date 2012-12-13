import java.awt.*;
import java.awt.event.*;
import java.util.*;
import java.net.*;
import java.io.*;
import java.lang.*;
import javax.swing.*;
import javax.swing.event.*;

public class SimpleWebBrowser
{
     public static void main(String [] args)
     {
          JFrame frame = new EditorPaneFrame();
          frame.show();
     }
}
class HTMLResponse
{
	private String type;
	private String message;
	
	public HTMLResponse(String s)
	{
		type = "text/html";
		message = "";
		int kk = s.indexOf("Content-type");
		s = s.substring(s.indexOf("Content-type") + 14);
		type = ((s.split("\n"))[0]);
		type = type.substring(0, type.length() - 1);
		message = s.substring(type.length() + 4);
	}
	public String getType()
	{
		return type;
	}
	public String getMessage()
	{
		return message;
	}
}
class EditorPaneFrame extends JFrame
{
    static PrintStream log = System.out;
	protected void log(String s) {
        synchronized (log) {
            log.println(s);
            log.flush();
        }
    }
	protected void log(int s) {
        synchronized (log) {
        	log.println(s);
            log.flush();
        }
    }
    static char[] buf;
    final static int BUF_SIZE = 200048;
	private JTextField url;
    private JButton loadButton;
    private JButton backButton;
    private JTextPane editorPane;
    private ImageIcon imageIcon;
    private JEditorPane htpEditorPane;
    private Stack urlStack = new Stack();
    //handling HTTP part
    public static int number = 0;
    public void handleUrl(String s)
    {
    	 try{
    		 //java.lang.url
    		 URL u = new URL(s);
    		 String host = u.getHost();
    		 int port = u.getPort();
    		 if (port == -1) port = 80;
    		 String File = (String)u.getFile();
    		 if (File == "") File = "/index.html";
    		 log("start requesting : " + host + " " + port + " " + File);
    		 String feedback = getFileFromServer(host, port, File);
    		 htpEditorPane.setText(feedback);
    		 HTMLResponse res = new HTMLResponse(feedback);
    		 log("mes..." + res.getMessage());
    		 log("type..." + res.getType());
    		 String html = res.getMessage();
    		 int fileSt = html.indexOf("<img src=", 0);
    		 if (fileSt >= 0) {
    			 fileSt += 10;
    			 int fileEd = html.indexOf("\"", fileSt);
    			 String kkk = html.substring(fileSt, fileEd);
    			 String fileUrl = u + "/" + kkk;
    			 log(kkk.substring(0, 4));
    			 if (kkk.substring(0, 4).equals("http"))
    				 fileUrl = kkk;
    			 System.out.println("finding img : " + fileUrl);

    			 URL url = new URL(fileUrl);
    			 InputStream in = new BufferedInputStream(url.openStream());
    			 ByteArrayOutputStream out = new ByteArrayOutputStream();
    			 byte[] buf = new byte[1024];
    			 int n = 0;
    			 while (-1!=(n=in.read(buf)))
    			 {
    			    out.write(buf, 0, n);
    			 }
    			 out.close();
    			 in.close();
    			 byte[] response = out.toByteArray();
    			 FileOutputStream fos = new FileOutputStream(number + "borrowed_image.jpg");
    			 fos.write(response);
    			 fos.close();
    			 imageIcon = new ImageIcon(number + "borrowed_image.jpg");
    			 editorPane.insertIcon(imageIcon);
    			 number++;
    		 }
    	 }
    	 catch (Exception e)
    	 {
    		 editorPane.setText("Error: " + e);
    	 }
     }
 	public String getFileFromServer(String host, int port, String File) throws Exception
 	{
 		String sentence;
 		String modifiedSentence;
         buf = new char[BUF_SIZE];
 		log("starting request..");
 		BufferedReader inFromUser = new BufferedReader(
 								new InputStreamReader(System.in));
 		Socket clientSocket = new Socket(host, port);
 		DataOutputStream outToServer = new DataOutputStream(
 								clientSocket.getOutputStream());
 		BufferedReader inFromServer = 
 			new BufferedReader(new InputStreamReader(
 				clientSocket.getInputStream()));
 		log("connection established\n\n");
 		
 		sentence = "GET " + File + " HTTP/1.0\n";
 		
 		outToServer.writeBytes(sentence + '\n');
 		
         int nread = 0, r = 0;

         while (nread < BUF_SIZE) {
         	//read at most BUF_SIZE-nread chars
             r = inFromServer.read(buf, nread, BUF_SIZE - nread);
             if (r == -1) break;
             nread += r;
         }
         
 		modifiedSentence = new String(buf,0,nread);
 		log("FROM SERVER: ..not displayed here");
 		clientSocket.close();
        return modifiedSentence; 
 	}
 	//build the GUI
     public EditorPaneFrame()
     {
          setTitle("SimpleWebBrowser");
          setSize(1000,600);
          addWindowListener(new WindowAdapter()
          {
               public void windowClosing(WindowEvent e)
               {
                    System.exit(0);
               }
          } );
          // set up text field and load button for typing in URL
          url = new JTextField("http://127.0.0.1:9060", 30);
          loadButton = new JButton("Load");
          ActionListener loadAction = new ActionListener()
          {
              public void actionPerformed(ActionEvent event)
              {
             
           	   try {
                        // remember URL for back button
                        urlStack.push(url.getText());
                        handleUrl(url.getText());
                   }
                   catch(Exception e)
                   {
                        editorPane.setText("Error: " +e);
                   }
              }
         };
          loadButton.addActionListener(loadAction);
          url.registerKeyboardAction(loadAction,
                  					 KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0, false),
                  					 JComponent.WHEN_FOCUSED);
          // set up back button and button action
          backButton = new JButton("Back");
          ActionListener backAction = new ActionListener()
          {
              public void actionPerformed(ActionEvent event)
              {
                   if(urlStack.size()<=1) return;
                   try
                   {
                        urlStack.pop();
                        String urlString = (String)urlStack.peek();
                        url.setText(urlString);
                        handleUrl(urlString);
                   }
                   catch(Exception e)
                   {
                        editorPane.setText("Error : " +e);
                   }
              }
         };
          backButton.addActionListener(backAction);
          url.registerKeyboardAction(backAction,
					 KeyStroke.getKeyStroke(KeyEvent.VK_ESCAPE, 0, false),
					 JComponent.WHEN_FOCUSED);
          editorPane = new JTextPane();
          editorPane.setEditable(false);
          htpEditorPane = new JEditorPane();
          htpEditorPane.setEditable(false);
//          editorPane.setSize(350,550);
          editorPane.setPreferredSize(new java.awt.Dimension(350,550));
          htpEditorPane.setSize(620,550);
          Container contentPane = getContentPane();
          contentPane.add(new JScrollPane(editorPane), "West");
          contentPane.add(new JScrollPane(htpEditorPane), "East");
          JPanel panel = new JPanel();
          panel.add(new JLabel("URL"));
          panel.add(url);
          panel.add(loadButton);
          panel.add(backButton);
          contentPane.add(panel,"North");
     }
}