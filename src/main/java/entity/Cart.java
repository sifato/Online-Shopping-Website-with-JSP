package entity;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
public class Cart {
	private HashMap<Items, Integer> goods;
	private double totalPrice;

	public Cart() {
		
		goods = new HashMap<Items, Integer>();
		totalPrice = 0;
	}

	public HashMap<Items, Integer> getGoods() {
		return goods;
	}

	public void setGoods(HashMap<Items, Integer> goods) {
		this.goods = goods;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	
	public boolean addGoodsInCart(Items item, int number) {
		
		if (goods.containsKey(item)) {
			goods.put(item, goods.get(item)+number);
		}else {
			goods.put(item, number);
		}
		calcTotalPrice();
		return true;
	}

	
	public boolean removeGoodsFromCart(Items item) {
		goods.remove(item);
		calcTotalPrice();
		return true;
	}

	
	public double calcTotalPrice() {
		double sum = 0;
		Set<Items> keys = goods.keySet();
		Iterator<Items> iterator = keys.iterator();
		while (iterator.hasNext()) {
			Items items = (Items) iterator.next();
			sum += items.getPrice() * goods.get(items);
		}
		this.setTotalPrice(sum);
		return sum;
	}
	
	public static void main(String[] args) {
		
		Items i1 = new Items(1, "Water Basketball Shoes", "Wenzhou", 200, 500, "001.jpg");
		Items i2 = new Items(2, "Li Ning sports shoes", "Guangzhou", 300, 500, "002.jpg");
		Items i3 = new Items(1, "Water Basketball Shoes", "Wenzhou", 200, 500, "001.jpg");
		
		
		Cart cart = new Cart();
		cart.addGoodsInCart(i1, 1);
		cart.addGoodsInCart(i2, 2);
		cart.addGoodsInCart(i3, 3);
		
		
		
		Set<Map.Entry<Items, Integer>>items = cart.getGoods().entrySet();
		for (Map.Entry<Items, Integer> entry : items) {
			System.out.println(entry);
		}
		System.out.println("After buying 4 pairs of Walter basketball shoes and 2 pairs of Li-Ning sneakers, the total price of the shopping cart"+cart.getTotalPrice());;
	}
}
