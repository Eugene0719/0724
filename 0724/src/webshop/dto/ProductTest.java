package webshop.dto;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class ProductTest {

	@Before
	public void setUp() throws Exception {
		System.out.println(1);
	}

	
	@After
	public void tearDown() throws Exception {
		System.out.println(2);
	}

	@Test
	public void test() {
		System.out.println(3);
		Product pro=new Product();
		int num=pro.f();
		System.out.println(num);
		Assert.assertEquals(10, num);
	}

}
