package com.usst.recommend;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

public class TestHttpClient {
	String iid = Integer.toString(1);
	String uid = Integer.toString(107).substring(2);
	String value = Integer.toString(1);
	public static void main(String[] args) {
		new TestHttpClient().readFile();
	}
	public void readFile(){
		try {
			List<String> list = FileUtils.readLines(new File("D:\\Users\\ad\\新建文本文档.txt"), "utf-8");
			for(String str : list){
				String[] strs = str.split(",");
				uid = strs[0];
				iid = strs[1].substring(2);
				value = Integer.toString((int)Math.floor(Double.parseDouble(strs[2])));
				CloseableHttpClient httpclient = HttpClients.createDefault();  
				try {  
		            // 创建httpget.  
					String url = "http://localhost:8088/recommend/saveRecommend.html?iid="+iid+"&uid="+uid+"&goodId=test&value="+value+"";
		            HttpGet httpget = new HttpGet(url);  
		            System.out.println("executing request " + httpget.getURI());  
		            // 执行get请求.    
		            CloseableHttpResponse response = httpclient.execute(httpget);  
		            try {  
		                // 获取响应实体    
		                HttpEntity entity = response.getEntity();  
		                System.out.println("--------------------------------------");  
		                // 打印响应状态    
		                System.out.println(response.getStatusLine());  
		                if (entity != null) {  
		                    // 打印响应内容长度    
		                    System.out.println("Response content length: " + entity.getContentLength());  
		                    // 打印响应内容    
		                    System.out.println("Response content: " + EntityUtils.toString(entity));  
		                }  
		                System.out.println("------------------------------------");  
		            } finally {  
		                response.close();  
		            }  
		        } catch (ClientProtocolException e) {  
		            e.printStackTrace();  
		        } catch (IOException e) {  
		            e.printStackTrace();  
		        } finally {  
		            // 关闭连接,释放资源    
		            try {  
		                httpclient.close();  
		            } catch (IOException e) {  
		                e.printStackTrace();  
		            }  
		        }  
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	public void get(){
		CloseableHttpClient httpclient = HttpClients.createDefault();  
		try {  
            // 创建httpget.  
			String url = "http://localhost:8088/recommend/saveRecommend.html?iid="+iid+"&uid="+uid+"&goodId=test&value="+value+"";
            HttpGet httpget = new HttpGet(url);  
            System.out.println("executing request " + httpget.getURI());  
            // 执行get请求.    
            CloseableHttpResponse response = httpclient.execute(httpget);  
            try {  
                // 获取响应实体    
                HttpEntity entity = response.getEntity();  
                System.out.println("--------------------------------------");  
                // 打印响应状态    
                System.out.println(response.getStatusLine());  
                if (entity != null) {  
                    // 打印响应内容长度    
                    System.out.println("Response content length: " + entity.getContentLength());  
                    // 打印响应内容    
                    System.out.println("Response content: " + EntityUtils.toString(entity));  
                }  
                System.out.println("------------------------------------");  
            } finally {  
                response.close();  
            }  
        } catch (ClientProtocolException e) {  
            e.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        } finally {  
            // 关闭连接,释放资源    
            try {  
                httpclient.close();  
            } catch (IOException e) {  
                e.printStackTrace();  
            }  
        }  
	}
	/** 
     * post方式提交表单（模拟用户登录请求） 
     */  
    public void postForm() {  
        // 创建默认的httpClient实例.    
        CloseableHttpClient httpclient = HttpClients.createDefault();  
        // 创建httppost    
        HttpPost httppost = new HttpPost("http://localhost:8080/myDemo/Ajax/serivceJ.action");  
        // 创建参数队列    
        List<NameValuePair> formparams = new ArrayList<NameValuePair>();  
        formparams.add(new BasicNameValuePair("username", "admin"));  
        formparams.add(new BasicNameValuePair("password", "123456"));  
        UrlEncodedFormEntity uefEntity;  
        try {  
            uefEntity = new UrlEncodedFormEntity(formparams, "UTF-8");  
            httppost.setEntity(uefEntity);  
            System.out.println("executing request " + httppost.getURI());  
            CloseableHttpResponse response = httpclient.execute(httppost);  
            try {  
                HttpEntity entity = response.getEntity();  
                if (entity != null) {  
                    System.out.println("--------------------------------------");  
                    System.out.println("Response content: " + EntityUtils.toString(entity, "UTF-8"));  
                    System.out.println("--------------------------------------");  
                }  
            } finally {  
                response.close();  
            }  
        } catch (ClientProtocolException e) {  
            e.printStackTrace();  
        } catch (UnsupportedEncodingException e1) {  
            e1.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        } finally {  
            // 关闭连接,释放资源    
            try {  
                httpclient.close();  
            } catch (IOException e) {  
                e.printStackTrace();  
            }  
        }  
    }  
	/** 
     * 发送 post请求访问本地应用并根据传递参数不同返回不同结果 
     */  
    public void post() {  
        // 创建默认的httpClient实例.    
        CloseableHttpClient httpclient = HttpClients.createDefault();  
        // 创建httppost    
        HttpPost httppost = new HttpPost("http://localhost:8080/myDemo/Ajax/serivceJ.action");  
        // 创建参数队列    
        List<NameValuePair> formparams = new ArrayList<NameValuePair>();  
        formparams.add(new BasicNameValuePair("type", "house"));  
        UrlEncodedFormEntity uefEntity;  
        try {  
            uefEntity = new UrlEncodedFormEntity(formparams, "UTF-8");  
            httppost.setEntity(uefEntity);  
            System.out.println("executing request " + httppost.getURI());  
            CloseableHttpResponse response = httpclient.execute(httppost);  
            try {  
                HttpEntity entity = response.getEntity();  
                if (entity != null) {  
                    System.out.println("--------------------------------------");  
                    System.out.println("Response content: " + EntityUtils.toString(entity, "UTF-8"));  
                    System.out.println("--------------------------------------");  
                }  
            } finally {  
                response.close();  
            }  
        } catch (ClientProtocolException e) {  
            e.printStackTrace();  
        } catch (UnsupportedEncodingException e1) {  
            e1.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        } finally {  
            // 关闭连接,释放资源    
            try {  
                httpclient.close();  
            } catch (IOException e) {  
                e.printStackTrace();  
            }  
        }  
    }  
}
