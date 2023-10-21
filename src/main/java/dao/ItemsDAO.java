package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

import util.DBHelper;

import entity.Items;

public class ItemsDAO {
	private Connection coon = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public ArrayList<Items> getAllItems() {
		ArrayList<Items> itemsList = new ArrayList<Items>();

		try {
			coon = DBHelper.getConnection();
			String sql = "select * from items;";
			pstmt = coon.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Items items = new Items();
				setItemsAttributes(rs, items);
				itemsList.add(items);
			}
			return itemsList;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			DBHelper.relsaseResource(rs, pstmt);
		}
	}

	
	private void setItemsAttributes(ResultSet rs, Items items)
			throws SQLException {
		items.setId(rs.getInt("id"));
		items.setName(rs.getString("name"));
		items.setCity(rs.getString("city"));
		items.setPrice(rs.getInt("price"));
		items.setNumber(rs.getInt("number"));
		items.setPicture(rs.getString("picture"));
	}

	
	public Items getItemsById(int id) {

		try {
			coon = DBHelper.getConnection();
			String sql = "select * from items where id=?;";
			pstmt = coon.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				Items items = new Items(); 
				setItemsAttributes(rs, items);
				return items;
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			DBHelper.relsaseResource(rs, pstmt);
		}
	}
	
	
	public ArrayList<Items>getViewList(String list){
		ArrayList<Items>itemsList = new ArrayList<Items>();
		int iCount = 5;
		if (list!=null&&list.length()>0) {
			String[]temp=list.split(",");
			
			if (temp.length>=iCount) {
				System.out.println("Browsing records greater than or equal to 5");
				System.out.println(Arrays.toString(temp));
				for(int i = temp.length-1;i>=temp.length-iCount;i--){
					itemsList.add(getItemsById(Integer.parseInt(temp[i])));
				}
			}else {
				System.out.println("Browse history is less than 5");
				System.out.println(Arrays.toString(temp));
				for(int i = temp.length-1;i>=0;i--){
					itemsList.add(getItemsById(Integer.parseInt(temp[i])));
				}
			}
			return itemsList;
		}else {
			return null;
		}		
	}
}
