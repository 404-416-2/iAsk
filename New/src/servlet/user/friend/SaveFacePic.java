package servlet.user.friend;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class SaveFacePic
 */
@WebServlet("/SaveFacePic")
@MultipartConfig
public class SaveFacePic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveFacePic() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uid = (String)request.getSession().getAttribute("uid");
		Part part = request.getPart("myfile");
        String disposition = part.getHeader("Content-Disposition");
        String suffix = disposition.substring(disposition.lastIndexOf(".")+1,disposition.length()-1);
          //随机的生存一个32的字符串
        if(!suffix.toLowerCase().equals("jpg"))
        {
        	request.setAttribute("jumpUrl", "ViewFriendList");
        	request.setAttribute("alerInfo","图片格式错误");
        	request.getRequestDispatcher("userFriend/alert.jsp").forward(request, response);
        	return;
        }
        System.out.println(suffix);
        String filename = uid+"."+suffix.toLowerCase();
          //获取上传的文件名
        InputStream is = part.getInputStream();
        //动态获取服务器的路径
        String codepath = "D:\\program\\eclipse\\workspace\\new\\WebContent\\facePicture";
        String serverpath = request.getServletContext().getRealPath("/facePicture");
        System.out.println(serverpath+"\\"+filename);
        FileOutputStream fos = new FileOutputStream(serverpath+"\\"+filename);
        FileOutputStream fos2 = new FileOutputStream(codepath+"\\"+filename);
        byte[] bty = new byte[1024];
        int length =0;
        while((length=is.read(bty))!=-1){
            fos.write(bty,0,length);
            fos2.write(bty,0,length);
        }
        fos.close();
        is.close();
        response.sendRedirect("ViewFriendList");
	}

}
