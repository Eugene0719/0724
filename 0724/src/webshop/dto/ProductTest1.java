package webshop.dto;

import static org.junit.Assert.*;

import org.junit.Test;

public class ProductTest1 {

	Product pro=new Product("P1111", "µî´ë", 100000);
	
	@Test
	public void testProductStringStringInteger() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetProductId() {
		pro.getProductId();
	}

	@Test
	public void testGetPname() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetUnitPrice() {
		fail("Not yet implemented");
	}

}
