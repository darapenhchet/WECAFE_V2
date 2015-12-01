package com.kosign.wecafe.controller.admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosign.wecafe.entities.Category;
import com.kosign.wecafe.entities.Product;
import com.kosign.wecafe.entities.User;
import com.kosign.wecafe.forms.ProductForm;
import com.kosign.wecafe.services.CategoryService;
import com.kosign.wecafe.services.ProductService;
import com.kosign.wecafe.services.UnitService;
import com.kosign.wecafe.services.UserService;

@Controller
public class ProductController {

	@Inject
	private ProductService productService;

	@Inject
	private CategoryService categoryService;
	
	@Inject
	private UnitService unitService;

	@Autowired
	private UserService userService;
	
	@Autowired
	ServletContext servletContext;

	@RequestMapping(value = "/admin/products", method = RequestMethod.GET)
	public String listAllProducts(Map<String, Object> model) {
		model.put("products", productService.getAllProducts());
		return "admin/productlist";
	}

	
	@RequestMapping(value = "/admin/products/rest", method = RequestMethod.GET, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Product> getAllProducts() {
		return productService.getAllProducts();
	}

	@RequestMapping(value = "/admin/productadd", method = RequestMethod.GET)
	public String productadd(Map<String, Object> model) {
		model.put("categories", categoryService.getAllCategories());
		model.put("units", unitService.getAllUnits());
		return "admin/productadd";
	}

	@RequestMapping(value = "/admin/productlists", method = RequestMethod.GET)
	public @ResponseBody List<Product> getAllProductsJSON() {
		return productService.getAllProducts();
	}

	public Map<String, Object> getAllProduct() {
		Map<String, Object> m = new HashMap<>();
		try {
			m.put("item", productService.getAllProducts());
		} catch (Exception ex) {
			m.put("error", ex.getMessage());
		}
		return m;
	}

	@RequestMapping(value="/admin/product/add", method=RequestMethod.POST)
	public  @ResponseBody Boolean addNewProduct(ProductForm form , HttpServletRequest request){
		
		/*String name = form.getImages().getOriginalFilename();
		System.out.println("name="+form.getProductName());
		if (!form.getImages().isEmpty()) {
            try {
                byte[] bytes = form.getImages().getBytes();
                UUID uuid = UUID.randomUUID();
                String randomUUIDFileName = uuid.toString();

                String extension = name.substring(name.lastIndexOf(".")+1);
                
                // creating the directory to store file
                String savePath = request.getServletContext().getRealPath("/resources/images/products/");
				System.out.println(savePath);
				File path = new File(savePath);
				if(!path.exists()){
					path.mkdir();
				}
                
                BufferedOutputStream stream =
                        new BufferedOutputStream(new FileOutputStream(new File(savePath + File.separator  + randomUUIDFileName + "." + extension)));
                stream.write(bytes);
                stream.close();
                System.out.println( "You successfully uploaded " + savePath + File.separator + randomUUIDFileName+extension + "!");

                
                Product product = new Product();
                Category category = new Category();
                category.setCatId(form.getCategoryId());
                
        		User user = userService.findUserByUsername(getPrincipal());
        		System.out.println(user.getUsername());
        		
        		product.setProductName(form.getProductName());
        		product.setQuantity(form.getQuantity());
        		product.setCostPrice(form.getCostPrice());
        		product.setSalePrice(form.getSalePrice());
        		product.setUnitPrice(form.getUnitPrice());
        		product.setCategory(category);
        		//product.setCreatedBy(user);
        		//product.setLastUpdatedBy(user);
        		product.setImage(randomUUIDFileName+"."+extension);
        		product.setCreatedDate(new Date());
    			product.setLastUpdatedDate(new Date());
    			product.setStatus(true);
        		return productService.addNewProduct(product);

            } catch (Exception e) {
            	System.out.println(e.getMessage());
                System.out.println("You failed to upload " + name + " => " + e.getMessage());
                return false;
            }
        } else {
            System.out.println("You failed to upload " + name + " because the file was empty.");
            return false;
        }*/
		
		
		
		
		/*List<Product> products = new ArrayList<>();
		if(session.getAttribute("products")!=null){
			products = (ArrayList<Product>)session.getAttribute("products");
		}
		products.add(product);*/		
		
		
		//System.out.println(product.getProductName());
		//User user = userService.findUserByUsername(getPrincipal());
		//System.out.println(user.getUsername());
		/*product.setCreatedBy(user);
		product.setLastUpdatedBy(user);
		return productService.addNewProduct(product);*/
		//return ((Product)session.getAttribute("product")).getProductName();
		//return false;
		
		
		Product product = new Product();
        Category category = new Category();
        category.setCatId(form.getCategoryId());
        
		User user = userService.findUserByUsername(getPrincipal());
		System.out.println(user.getUsername());
		
		product.setProductName(form.getProductName());
		product.setQuantity(form.getQuantity());
		product.setCostPrice(form.getCostPrice());
		product.setSalePrice(form.getSalePrice());
		product.setUnitPrice(form.getUnitPrice());
		product.setCategory(category);
		//product.setCreatedBy(user);
		//product.setLastUpdatedBy(user);
		product.setImage(form.getImage());
		product.setCreatedDate(new Date());
		product.setLastUpdatedDate(new Date());
		product.setStatus(true);
		return productService.addNewProduct(product);
		
	}

	@RequestMapping(value = "/admin/product/{id}", method = RequestMethod.GET)
	public String updateProduct(@PathVariable("id") Long id, Map<String, Object> model) {
		Product product = productService.findProductById(id);
		model.put("product", product);
		model.put("categories", categoryService.getAllCategories());
		return "admin/productupdate";
	}

	@RequestMapping(value = "/admin/product/update", method = RequestMethod.POST)
	public @ResponseBody boolean updateProduct(ProductForm product, HttpServletRequest request) {

		/*System.out.println("UPDATING CONTROLLER...");
		String name = product.getImages().getOriginalFilename();
		System.out.println("name="+product.getProductName());
		if (!product.getImages().isEmpty()) {
            try {
                byte[] bytes = product.getImages().getBytes();
                UUID uuid = UUID.randomUUID();
                String randomUUIDFileName = uuid.toString();
                
                String extension = name.substring(name.lastIndexOf(".")+1);
                                String webappRoot = new File("C:\\Users\\Channbora\\git\\wecafe\\webapp").getAbsolutePath() ; //servletContext.getRealPath("/");
                                String fileName = File.separator +"resources"
                                        		+ File.separator + "images" + File.separator + "products" + File.separator
                                        		+ randomUUIDFileName+"."+extension;
                                
                                // creating the directory to store file
				String savePath = request.getServletContext().getRealPath("/resources/images/products/");
				File path = new File(savePath);
				if(!path.exists()){
					path.mkdir();
				}
                
                BufferedOutputStream stream =
                        new BufferedOutputStream(new FileOutputStream(savePath + File.separator + randomUUIDFileName+"."+extension));
                stream.write(bytes);
                stream.close();
                System.out.println( "You successfully uploaded " + name + "!");
                product.setImgURL(randomUUIDFileName+"."+extension);                
                return productService.updateProduct(product);
            } catch (Exception e) {
            	System.out.println(e.getMessage());
                System.out.println("You failed to upload " + name + " => " + e.getMessage());
                return false;
            }
        } else {
            System.out.println("You failed to upload " + name + " because the file was empty.");
            return false;
        }*/
		return productService.updateProduct(product);
	}

	@RequestMapping(value = "/admin/product/delete/{id}", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody boolean deleteProduct(@RequestBody @PathVariable("id") Long id) {
		System.out.println("DELETE ID=" + id);
		return productService.deleteProduct(id);
	}
	
	@RequestMapping(value = "/admin/product/status/{id}", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody boolean changeProductStatus(@PathVariable("id") Long id) {
		System.out.println("ID=" + id);
		return productService.updateProductStatus(id);
	}
	
	@RequestMapping(value = "/admin/product/invoice")
	public String productInvoice(){
		return "admin/invoice";
	}

	private String getPrincipal() {
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}

}

